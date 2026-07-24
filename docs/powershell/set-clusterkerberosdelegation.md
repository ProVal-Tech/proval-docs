---
id: '7b34cb5e-5cd4-4257-82e3-bd2a6acd3934'
slug: /7b34cb5e-5cd4-4257-82e3-bd2a6acd3934
title: 'Set-ClusterKerberosDelegation'
title_meta: 'Set-ClusterKerberosDelegation'
keywords: ['hyper-v', 'hyper-v-host', 'reboot-host', 'reboot', 'restart-hyper-v-host', 'restart-cluster-node', 'kerberos', 'kerberos-delegation']
description: 'Writes Kerberos constrained-delegation entries for a set of cluster nodes, from an admin workstation or DC.'
tags: ['cluster', 'hyper-v', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Overview

When a clustered virtual machine is live‑migrated from one cluster node to another, the two hosts must authenticate to each other. In an automated, unattended scenario — for example, a node restart triggered by your management platform — that migration runs under each server's own **computer (SYSTEM) account**, because there is no logged‑in user to authenticate with. By default, a computer account is **not** permitted to act on behalf of another machine for this purpose, so the migration fails.

This script makes a **one‑time change in Active Directory** that fixes that. It configures **Kerberos constrained delegation** so that each cluster node's computer account is explicitly allowed to delegate to the other nodes — but **only** for the two specific services live migration needs:

- `cifs` — file/storage access (for example, Cluster Shared Volumes), and
- `Microsoft Virtual System Migration Service` — the Hyper‑V live‑migration service.

**In simple terms:** running this script once on a domain controller lets your cluster nodes talk to each other and live‑migrate virtual machines using Kerberos under their own SYSTEM/computer accounts, with no user credentials and no interactive session. That is exactly what the automated cluster‑node restart process relies on.

The configuration is **least‑privilege by design**: delegation is granted only to the other cluster nodes you name, and only for those two services — never blanket ("trust for delegation to any service") access.

## When and Where to Run This

- **When:** Once, as part of the initial setup, **before** you use the automated cluster‑node restart script. Re‑run it only if you add or remove nodes in the cluster. It is **not** a scheduled or recurring task.
- **Where:** From a **single** machine — a **domain controller**, or a domain‑joined administration workstation that has the RSAT Active Directory module installed. You do **not** run it on the cluster nodes themselves, and it does not need to be.
- **How you must be logged in:** An **interactive, logged‑in session as a Domain Administrator** (or an account delegated permission to modify these computer objects).
- **Do NOT run it through your RMM/management agent, and do NOT run it as SYSTEM.** This script writes security‑sensitive delegation attributes in Active Directory; a computer account is not permitted to set them, and the operation requires domain‑administrator rights. Run from an RMM or as SYSTEM, it will fail with access denied.

Although you run it from one machine, it writes to the Active Directory computer objects of **every** cluster node you pass, wiring up delegation in **both directions** in a single run.

## Requirements

- A **domain controller**, or a domain‑joined workstation with the **RSAT Active Directory PowerShell module** (`ActiveDirectory`) installed.
- A **logged‑in Domain Administrator** session (or an account delegated to modify these computer objects). Not SYSTEM, not an RMM agent.
- The cluster nodes must already be **domain members present in Active Directory**, each with a populated **DNSHostName** (the script reads it to build the fully‑qualified service names).
- **PowerShell 5.1** or later.
- Network connectivity from the machine you run it on to a domain controller.
- The **Strapper** PowerShell module (used for logging; the script installs it automatically from the PowerShell Gallery if it is missing).

> **Note:** This script performs only the **Active Directory half** of the setup. The other half — telling each Hyper‑V host to use Kerberos for live migration (`Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos`) — is a separate, per‑node step. **Both** halves are required for the automated restart to work. See **Related Content**.

## Impact

- **What changes:** For each node you list, two attributes on that node's **computer object in Active Directory** are updated:
  - `userAccountControl` — sets the delegation mode to **"Trust this computer for delegation to specified services only"** and **"Use Kerberos only"** (or **"Use any authentication protocol"** if you pass `-EnableProtocolTransition`).
  - `msDS-AllowedToDelegateTo` — adds the service entries (`cifs` and `Microsoft Virtual System Migration Service`, short name and FQDN) for every other node.
- **Which server:** The change is made to the **cluster nodes' AD computer objects**, even though you run the script from a single domain controller or workstation.
- **Idempotent and non‑destructive:** Re‑running the script merges new entries with existing ones and never removes unrelated entries. It is safe to run more than once.
- **No service interruption:** The script does **not** reboot any server, does **not** start, stop, suspend, or migrate any virtual machine, and does **not** change any Hyper‑V host setting. The new settings take effect for future Kerberos authentication; existing sessions are unaffected.
- **Reversible:** The entries can be removed later from the computer object's **Delegation** tab (or via `Set-ADComputer`) if you need to undo the change.

## What This Script Does Not Do

- Does **not** change the Hyper‑V live‑migration authentication type on the hosts — that is the separate per‑node step (`Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos`), which you run on each node and **can** run via your RMM/SYSTEM.
- Does **not** reboot, start, stop, suspend, or migrate any virtual machine.
- Does **not** need to run on a cluster node, and does **not** require the FailoverClusters or Hyper‑V modules.
- Does **not** run as SYSTEM or via your RMM — it requires an interactive domain‑administrator session.
- Is **not** something you schedule or run repeatedly — it is a one‑time setup (re‑run only when cluster nodes are added or removed).

## Process

1. You supply the list of cluster node names (short names).
2. For each node, the script looks it up in Active Directory and reads its DNS host name, so it can build both the short‑name and fully‑qualified service names.
3. For that node, it builds the set of service principal names (SPNs) the node must be allowed to delegate to: for **every other node**, the `cifs` service and the `Microsoft Virtual System Migration Service`, each in short‑name and FQDN form (four entries per peer).
4. It reads the node's current delegation list, merges the new entries in (dropping blanks and duplicates), and reads the current `userAccountControl`.
5. It sets the delegation flags — clearing "trust for delegation to any service" and selecting "Kerberos only" (or "any authentication protocol" with `-EnableProtocolTransition`) — and writes both the merged SPN list and the updated `userAccountControl` in a single update.
6. After every node is configured (each delegating to every other, so migration works in both directions), the script re‑reads each object to verify the result and returns a per‑node summary.

## Payload Usage

This content **does not use a payload**; it is a single, standalone script.

Run it from an **elevated, logged‑in Domain Administrator PowerShell session** on the domain controller (or RSAT workstation). Pass **every** node in the cluster in one run — the script wires up all directions at once.

Basic usage (Kerberos‑only, the standard configuration):

```powershell
.\Set-ClusterKerberosDelegation.ps1 -NodeName 'NODEA', 'NODEB'
```

Capture the returned verification summary:

```powershell
$summary = .\Set-ClusterKerberosDelegation.ps1 -NodeName 'NODEA', 'NODEB'
$summary | Format-Table
```

Use protocol transition only if a Kerberos‑only migration still fails with an authentication/delegation error:

```powershell
.\Set-ClusterKerberosDelegation.ps1 -NodeName 'NODEA', 'NODEB' -EnableProtocolTransition
```

## Parameters

| Parameter                | Alias | Required | Default | Type     | Description                                                                                                                                                          |
| ------------------------ | ----- | -------- | ------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `NodeName`               | —     | True     | —       | String[] | The cluster node computer (short) names. Supply **every** node in the cluster in a single run.                                                                       |
| `EnableProtocolTransition` | —   | False    | `False` | Switch   | Use **"Use any authentication protocol"** (protocol transition) instead of **"Use Kerberos only."** Leave off unless a Kerberos‑only migration still fails with an authentication or delegation error. |

## Verification

The script returns (and logs) a summary with one entry per node. Confirm that:

- `UnconstrainedDelegation` is **False** for every node (delegation is scoped to specified services only), and
- `DelegationEntryCount` equals **4 × (number of nodes − 1)** (four service entries per peer).

You can also confirm in **Active Directory Users and Computers** (enable **Advanced View**, open the computer object, **Delegation** tab): it should show **"Trust this computer for delegation to specified services only"** with **"Use Kerberos only"** selected, and the `cifs` and `Microsoft Virtual System Migration Service` entries listed for each peer.

The definitive end‑to‑end confirmation is a live migration performed as SYSTEM, which is exercised by the companion restart script's setup notes.

## Output

The script **returns the verification summary to the pipeline** (an array of objects, one per node, with the properties `Node`, `UnconstrainedDelegation`, `ProtocolTransition`, and `DelegationEntryCount`). On the early‑exit path (fewer than two nodes supplied) it returns nothing.

Logging is written via the Strapper module to the current working directory:

```text
.\Set-ClusterKerberosDelegation-log.txt
.\Set-ClusterKerberosDelegation-error.txt
```

No separate data file is written; the verification summary is returned to the pipeline and also recorded in the log.

## Related Content

- **[Restart-ClusterNode.ps1](/docs/6d72e8de-7031-4d4d-81a8-f6c6ab3729e7)** — the automated cluster‑node restart script that depends on this configuration to live‑migrate clustered virtual machines under the SYSTEM account.
- **Per‑node host step** — on each cluster node (this **can** run via your RMM/SYSTEM):

  ```powershell
  Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos
  ```

- **Setup order:** run **this script once** (the Active Directory half) and the `Set-VMHost` step **on each node** (the host half); then the automated restart script can run unattended.

## Changelog

### 2026-07-24

- Initial version of the document
