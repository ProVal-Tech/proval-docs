---
id: '6d72e8de-7031-4d4d-81a8-f6c6ab3729e7'
slug: /6d72e8de-7031-4d4d-81a8-f6c6ab3729e7
title: 'Restart-ClusterNode'
title_meta: 'Restart-ClusterNode'
keywords: ['hyper-v', 'hyper-v-host', 'reboot-host', 'reboot', 'restart-hyper-v-host', 'restart-cluster-node', 'reboot-cluster']
description: 'Safely restarts a Hyper-V cluster node by migrating clustered VMs to a neighbor and suspending the rest.'
tags: ['cluster', 'hyper-v', 'reboot']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Overview

This script safely restarts a **single Hyper‑V cluster node** without losing the virtual machines running on it. It is designed to run **unattended as SYSTEM** (for example, from your RMM/management platform).

Before the node reboots, the script:

- **Live‑migrates clustered (Highly Available) VMs** to a healthy neighbor node, so they keep running during the reboot, and
- **Suspends (saves the state of) non‑clustered VMs** that live on local storage and cannot be live‑migrated.

After the node reboots and rejoins the cluster, an automatic post‑reboot step:

- **Migrates the clustered VMs back** to this node, and
- **Resumes the non‑clustered VMs** from their saved state.

**In simple terms:** this lets you reboot a cluster node without taking down the VMs on it. Clustered VMs stay online by moving to the other node for the duration of the reboot, and local‑only VMs are paused and brought back automatically afterward. If anything goes wrong before the reboot, the script **rolls everything back and does not reboot**, so the node is never left in a half‑migrated state.

This script depends on a **one‑time environment setup** (Kerberos constrained delegation in Active Directory plus a per‑host Hyper‑V setting). That setup is described in **Environment Setup** below and must be completed before you run this script for the first time.

## Quick Start

> **Set up once → validate before each reboot → run the script per reboot.**

This content has two modes:

- **One‑time setup** — configure the environment so unattended live migration works under the SYSTEM account. Do this once, and again only when you add or remove cluster nodes.
- **Per‑reboot run** — restart a node whenever you need to; the script preserves the VMs before the reboot and restores them automatically afterward.

| Phase | When | What you do |
| --- | --- | --- |
| **1. Set up** (one time) | Before first use; repeat only when nodes are added or removed | **(a)** From a domain controller, as a domain admin: run `Set-ClusterKerberosDelegation.ps1` for all cluster nodes (Step 5). **(b)** On each node (may run as SYSTEM/RMM): `Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos` (Step 6). **(c)** Enable per‑VM migration compatibility on any clustered VM that needs it (Step 9). |
| **2. Validate** | Before each reboot (quick check) | Confirm delegation is in place (Step 4) and the host auth type is Kerberos (Step 6); preview which VMs will be migrated vs suspended (Step 7); confirm every clustered VM is migration‑compatible (Step 8). |
| **3. Run** (per reboot) | Each maintenance window | Run `Restart-ClusterNode.ps1` as SYSTEM on the node to reboot (no parameters). It migrates clustered VMs to the neighbor, suspends non‑clustered VMs, reboots, then restores everything automatically. |

> **Remember:** the Active Directory delegation step (Step 5) must run from an **interactive domain‑admin session** — not as SYSTEM and not via your RMM. The per‑host `Set-VMHost` step (Step 6) and this restart script **can** run as SYSTEM via your RMM.

## Requirements

**Environment prerequisites:**

- All Hyper‑V cluster nodes must be **domain‑joined** members of the **same Active Directory domain**.
- A working **Hyper‑V failover cluster** with **at least two nodes** (a healthy neighbor must exist to migrate VMs to).
- Appropriate cluster **quorum** configured. For a two‑node cluster, a **witness** (file‑share or cloud) is strongly recommended so that rebooting one node does not cause the cluster to lose quorum.
- **Clustered VMs** should use **shared storage** (for example, Cluster Shared Volumes) so they can be live‑migrated. VMs on local storage are treated as non‑clustered and are suspended instead.
- A **domain controller** (or a domain‑joined workstation with the RSAT Active Directory module) and a **Domain Administrator** account, for the one‑time Active Directory delegation setup.
- The **RSAT Active Directory PowerShell module** (`ActiveDirectory`) on the machine used for the delegation setup.
- **PowerShell 5.1** or later on the cluster nodes.
- **Live migration** enabled on each host, with the authentication type set to **Kerberos** (configured in Environment Setup).
- Network connectivity between the cluster nodes (for live migration) and from the setup machine to a domain controller.

**Runtime requirements (to run this script):**

- The script runs as **SYSTEM** on the node being rebooted (typically via your RMM). SYSTEM has the local administrator rights the script needs.
- The **Strapper** PowerShell module is used for logging and state persistence; the script installs it automatically from the PowerShell Gallery if it is missing.

> **Important:** The one‑time Active Directory delegation step (`Set-ClusterKerberosDelegation.ps1`) must **not** be run as SYSTEM or via your RMM — it requires an **interactive Domain Administrator** session. Only the per‑host `Set-VMHost` step and this restart script may run as SYSTEM. See **Environment Setup**.

## Environment Setup

Complete these steps **once** before using this script for the first time. Re‑run the relevant step only if you add or remove cluster nodes. Steps 1–5 are done from a domain controller (or RSAT workstation) as a domain admin; Steps 6–9 are done on the cluster nodes and **can** run as SYSTEM via your RMM.

## Step 1 — Note the names of the Hyper‑V cluster nodes

On any cluster node, list the cluster nodes and note each name (you will need them in later steps). Confirm each node's state is **Up**.

```powershell
Get-ClusterNode | Select-Object -Property Name, State
```

## Step 2 — Log in to the domain controller as a domain admin

Sign in to a domain controller (or a domain‑joined workstation with the RSAT Active Directory module) using a **Domain Administrator** account.

## Step 3 — Open an elevated PowerShell session

Launch PowerShell **as Administrator**.

## Step 4 — Validate the current Active Directory delegation state

Check whether the cluster nodes are **already** configured for Kerberos constrained delegation. Run this on the domain controller, replacing the node names with yours:

```powershell
foreach ($node in @('NodeA', 'NodeB')) {
    Get-ADComputer -Identity $node -Properties 'userAccountControl', 'msDS-AllowedToDelegateTo' |
        Select-Object -Property Name,
            @{ Name = 'UnconstrainedDelegation'; Expression = { ($_.userAccountControl -band 524288) -ne 0 } },
            @{ Name = 'ProtocolTransition'; Expression = { ($_.userAccountControl -band 16777216) -ne 0 } },
            @{ Name = 'DelegationEntries'; Expression = { $_.'msDS-AllowedToDelegateTo' -join '; ' } }
}
```

**What to look for** — for **every** node:

- `UnconstrainedDelegation` is **False** (delegation is scoped to specified services only).
- `ProtocolTransition` is **False** (Kerberos only), unless you intentionally use protocol transition.
- `DelegationEntries` contains, for each **other** node, four entries: `cifs/<peerShort>`, `cifs/<peerFQDN>`, `Microsoft Virtual System Migration Service/<peerShort>`, and `Microsoft Virtual System Migration Service/<peerFQDN>`.

If **all** nodes already show this, **skip Step 5**. If any node is missing entries or shows `UnconstrainedDelegation = True`, continue to Step 5.

## Step 5 — Run the delegation script (only if Step 4 showed it is needed)

From the elevated domain‑admin session, run the companion script, passing **every** cluster node. (The parameter is `-NodeName`.)

```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri 'https://contentrepo.net/repo/script/Set-ClusterKerberosDelegation.ps1'))) -NodeName @('NodeA', 'NodeB')
```

Replace `NodeA` / `NodeB` with your actual node names. The script wires up delegation in both directions in a single run and returns a verification summary. See the **Set-ClusterKerberosDelegation** README for full details.

## Step 6 — Validate and set the live‑migration setting on each node

This step runs **on each cluster node** and **can run as SYSTEM** (for example, via your RMM).

First, check the current state on the node:

```powershell
Get-VMHost | Select-Object -Property ComputerName, VirtualMachineMigrationEnabled, VirtualMachineMigrationAuthenticationType
```

**What to look for:** `VirtualMachineMigrationAuthenticationType` is **Kerberos** and `VirtualMachineMigrationEnabled` is **True**.

If either is not correct, set it on that node (only changes what is not already correct):

```powershell
Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos
Set-VMHost -VirtualMachineMigrationEnabled $true
```

Repeat for every cluster node.

## Step 7 — Preview which VMs will be migrated and which will be suspended

Run this **on each cluster node** to see, for every running VM on that node, what this script will do with it. Clustered VMs are **migrated to the neighbor**; non‑clustered VMs are **suspended (saved)**.

```powershell
$localNode = $env:COMPUTERNAME
$localGroups = @(Get-ClusterGroup |
    Where-Object -FilterScript { $_.GroupType -eq 'VirtualMachine' -and $_.OwnerNode -eq $localNode } |
    Select-Object -ExpandProperty 'Name')
$clustered = @()
foreach ($resource in (Get-ClusterResource | Where-Object -FilterScript { $_.ResourceType.Name -eq 'Virtual Machine' })) {
    if ($localGroups -contains $resource.OwnerGroup) {
        $clustered += ($resource.Name -replace '^Virtual Machine ', '')
    }
}
Get-VM | Where-Object -FilterScript { $_.State -eq 'Running' } |
    Select-Object -Property Name, @{ Name = 'Action'; Expression = { if ($clustered -contains $_.Name) { 'Migrate to neighbor' } else { 'Suspend (save state)' } } }
```

**What to look for:** confirm the VMs you expect to stay online are listed as **Migrate to neighbor**, and that any VM listed as **Suspend (save state)** is acceptable to pause briefly during the reboot.

## Step 8 — Check for clustered VMs that do not have migration compatibility enabled

A clustered VM must have **processor migration compatibility** enabled, or this script will refuse to migrate it (and will abort the whole run). Run this **on each cluster node**:

```powershell
$localNode = $env:COMPUTERNAME
$localGroups = @(Get-ClusterGroup |
    Where-Object -FilterScript { $_.GroupType -eq 'VirtualMachine' -and $_.OwnerNode -eq $localNode } |
    Select-Object -ExpandProperty 'Name')
$clustered = @()
foreach ($resource in (Get-ClusterResource | Where-Object -FilterScript { $_.ResourceType.Name -eq 'Virtual Machine' })) {
    if ($localGroups -contains $resource.OwnerGroup) {
        $clustered += ($resource.Name -replace '^Virtual Machine ', '')
    }
}
foreach ($name in $clustered) {
    Get-VMProcessor -VMName $name -ErrorAction SilentlyContinue |
        Select-Object -Property VMName, CompatibilityForMigrationEnabled
}
```

**What to look for:** any clustered VM with `CompatibilityForMigrationEnabled = False` must be enabled (Step 9) before you run this script. VMs already showing `True` need no action.

## Step 9 — Enable migration compatibility on any VM that needs it

> **Warning:** Enabling this setting requires the virtual machine to be **fully stopped**, which causes a **brief outage for that VM**. For a clustered VM, use the cluster‑aware option below so the cluster manages the role cleanly. Run these on the **node that currently owns the VM**.

**Recommended for clustered VMs (cluster‑aware):**

```powershell
Stop-ClusterGroup -Name '<VMName>'
Set-VMProcessor -VMName '<VMName>' -CompatibilityForMigrationEnabled $true
Start-ClusterGroup -Name '<VMName>'
```

**Alternative (direct Hyper‑V):**

```powershell
Stop-VM -Name '<VMName>'
Set-VMProcessor -VMName '<VMName>' -CompatibilityForMigrationEnabled $true
Start-VM -Name '<VMName>'
```

Replace `<VMName>` with the VM's name. This is a one‑time change per VM; once enabled, it persists.

## Step 10 — Run the restart script on the node to reboot

With the setup complete, run this script **as SYSTEM on the node you want to reboot** (typically via your RMM). It takes **no parameters**.

```powershell
.\Restart-ClusterNode.ps1
```

Or, if hosted in the content repository:

```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri 'https://contentrepo.net/repo/script/Restart-ClusterNode.ps1')))
```

## Configuration changes made by these setup steps

Each setup step changes configuration **only if it is not already correct**, and is safe to re‑run:

- **Step 5 (Set-ClusterKerberosDelegation):** Adds Kerberos **constrained‑delegation** entries to each node's Active Directory computer object — the `userAccountControl` delegation flags (specified‑services‑only, Kerberos‑only) and the `msDS-AllowedToDelegateTo` service entries (`cifs` and `Microsoft Virtual System Migration Service`, short name and FQDN, for each peer). Idempotent: it merges new entries with existing ones and makes no change if the node is already configured.
- **Step 6 (Set-VMHost):** Sets each host's live‑migration **authentication type to Kerberos** and **enables live migration** if it is disabled. No change if already Kerberos/enabled.
- **Step 9 (Set-VMProcessor):** Sets `CompatibilityForMigrationEnabled = True` on individual clustered VMs that lack it. Requires briefly stopping the VM. No change if already enabled.

## Impact

When you run this script on a node, it:

- Verifies the node is a cluster member and that Hyper‑V is running, and finds a healthy neighbor.
- Classifies the node's running VMs into clustered (to be migrated) and non‑clustered (to be suspended).
- Runs preflight checks (Kerberos auth type; migration compatibility on every clustered VM) and **aborts with guidance** if any check fails — before changing anything.
- Saves the VM state and writes a signed post‑reboot restore script to `C:\ProgramData\_Automation\Script\Restore-ClusterVMState\`, registering it as a startup scheduled task running as SYSTEM.
- Migrates clustered VMs to the neighbor and suspends non‑clustered VMs (confirming each reaches the saved state). If any step fails, it **rolls everything back and does not reboot**.
- Reboots the node.
- After the reboot, the scheduled task waits for the cluster and Hyper‑V services and for the node to rejoin, resumes the non‑clustered VMs, migrates the clustered VMs back (with retries), and then **removes itself**.

The script makes **no permanent changes** to Active Directory or the host configuration (those are done once in Environment Setup). Its own artifacts (the scheduled task and the post‑reboot script) are removed automatically after the restore completes, and on rollback.

## What This Script Does Not Do

- Does **not** perform the one‑time Active Directory delegation setup — that is `Set-ClusterKerberosDelegation.ps1` (Environment Setup, Step 5).
- Does **not** change the host live‑migration authentication type — that is the per‑node `Set-VMHost` step (Environment Setup, Step 6).
- Does **not** enable per‑VM migration compatibility — that is the per‑VM `Set-VMProcessor` step (Environment Setup, Step 9).
- Does **not** reboot more than one node at a time — it restarts only the node it runs on. To restart multiple nodes, run it on one node, let it fully complete (VMs restored), then run it on the next.
- Does **not** require any user credentials at runtime — it runs as SYSTEM using the Kerberos constrained delegation configured in setup.

## Process

1. **Cluster and Hyper‑V checks** — confirms the node is a cluster member (`clussvc` running and Automatic) and that the Hyper‑V service (`vmms`) is present and running.
2. **Neighbor resolution** — finds a healthy neighbor node (required only if clustered VMs exist).
3. **VM classification** — splits running VMs into clustered (a cluster "Virtual Machine" resource owned by this node → migrated) and non‑clustered (→ suspended). Classification uses the cluster VM resource, so it remains correct even if a cluster group was renamed.
4. **Preflight** — verifies the live‑migration authentication type is Kerberos and that every clustered VM has migration compatibility enabled; aborts with the exact fix if not.
5. **State capture and task creation** — stores the VM state (via Strapper) and writes the signed post‑reboot restore script plus a startup scheduled task (created before the disruptive work, for crash safety).
6. **Migrate and suspend (with rollback)** — migrates clustered VMs to the neighbor and suspends non‑clustered VMs. On any failure, rolls back (moves VMs back, resumes suspended VMs, removes the task and script) and aborts.
7. **Reboot** — forces a restart with a short countdown.
8. **Post‑reboot restore** — the scheduled task waits for the cluster and Hyper‑V services and for the node to report Up, resumes non‑clustered VMs, migrates clustered VMs back (with retries), and removes itself.

## Payload Usage

This script takes **no parameters**; it discovers the cluster nodes, the neighbor, and the VMs automatically at runtime.

It is normally executed **as SYSTEM** on the node to be rebooted, via your RMM. It contains an **embedded, code‑signed post‑reboot restore payload**: at runtime the script writes that payload to disk and registers a startup scheduled task to run it after the reboot. You do not run the payload manually, and you do not need to handle it directly.

Run directly:

```powershell
.\Restart-ClusterNode.ps1
```

Or via the content repository:

```powershell
& ([scriptblock]::Create((Invoke-RestMethod -Uri 'https://contentrepo.net/repo/script/Restart-ClusterNode.ps1')))
```

## Parameters

This script takes **no parameters**. All required values (cluster nodes, neighbor, and the VMs to preserve) are discovered automatically at runtime.

## Output

The main script and the post‑reboot restore script both log via the Strapper module:

```text
.\Restart-ClusterNode-log.txt
.\Restart-ClusterNode-error.txt
C:\ProgramData\_Automation\Script\Restore-ClusterVMState\Restore-ClusterVMState-log.txt
C:\ProgramData\_Automation\Script\Restore-ClusterVMState\Restore-ClusterVMState-error.txt
```

During the run, the script also creates `C:\ProgramData\_Automation\Script\Restore-ClusterVMState\Restore-ClusterVMState.ps1` and a scheduled task named **Post Reboot - Restore-ClusterVMState**. Both are removed automatically after the restore completes, and on rollback.

## Troubleshooting

When the script stops, read the message it logged or threw — it names the exact problem and, in most cases, the fix. The script always rolls back before aborting, so a failed run leaves the node in its pre‑run state (see **Rollback and Undo**).

| Symptom / message | Likely cause | What to do |
| --- | --- | --- |
| `Live migration authentication type is <type>; Kerberos is required for unattended operation. Aborting.` | The host's live‑migration authentication type is not Kerberos. | Run `Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos` on the node, and confirm the neighbor is Kerberos too (Environment Setup, Step 6). |
| `Clustered VM(s) lack migration compatibility: <names>. Enable CompatibilityForMigrationEnabled on each (VM must be Off), then retry.` | One or more clustered VMs do not have processor migration compatibility enabled. | Enable it on each listed VM (Environment Setup, Step 9). This briefly stops the VM. |
| `No healthy neighbor node available to host clustered VMs. Aborting.` | No other cluster node is Up. | Confirm at least one other node is healthy with `Get-ClusterNode`, bring it online, then re‑run. |
| `Cluster service (clussvc) not found … / is not running … / is not set to Automatic … Aborting.` | The node is not a cluster member, or the Cluster service is stopped or disabled. | Verify cluster membership; start the Cluster service and set its startup type to Automatic. |
| `Hyper-V service (vmms) not found … Aborting.` | The Hyper‑V role is not installed on the node. | Install or verify the Hyper‑V role. |
| A clustered VM fails to migrate with the generic `Migration failed. Please check the event log for related events.` | Kerberos delegation is not working end‑to‑end, the neighbor is not Kerberos‑ready, or the host CPUs are incompatible. | See **Investigating a live‑migration failure** below. |
| Delegation script: `Failed to write constrained delegation on <node> … Access is denied` (or it fails immediately). | The delegation script was run as SYSTEM / via your RMM instead of an interactive domain admin. | Re‑run it from an elevated, logged‑in **Domain Administrator** session on the domain controller (Environment Setup, Step 5). |
| Delegation script: `Invalid type System.Management.Automation.PSObject`. | An older version of the delegation script that did not filter null delegation values. | Re‑fetch the latest `Set-ClusterKerberosDelegation.ps1` from the content repository and re‑run. |
| The script aborts and rolls back. | A preflight, migration, or suspension step failed. | Read the specific message in the log, fix that issue, and re‑run. The node is returned to its pre‑run state automatically. |

## Investigating a live‑migration failure

The generic `Migration failed` error is a wrapper; the real reason is in the event logs. Check these on **both** the source and the destination node:

- `Microsoft-Windows-Hyper-V-VMMS/Admin` and `Microsoft-Windows-Hyper-V-VMMS/Operational`
- `Microsoft-Windows-Hyper-V-Worker/Admin` and `Microsoft-Windows-Hyper-V-Worker/Operational`

For Kerberos/delegation problems, also check the **Security** log on a domain controller for Kerberos service‑ticket events (event ID 4769) with a non‑zero status.

The three usual causes:

- **Kerberos delegation is not actually working.** Re‑run the Step 4 validation; if entries are missing, re‑run `Set-ClusterKerberosDelegation.ps1`. The definitive check is a live migration performed as SYSTEM — if it still fails with a delegation error after the standard setup, re‑run the delegation script with `-EnableProtocolTransition`.
- **The neighbor is not Kerberos‑ready.** Confirm the neighbor's authentication type is Kerberos (Step 6) and that its computer object has the `Microsoft Virtual System Migration Service` service principal name registered.
- **Incompatible processors.** `CompatibilityForMigrationEnabled` masks newer CPU features so an older host of the **same vendor** can accept the VM; it cannot bridge Intel↔AMD (and occasionally cannot bridge very distant generations). If the hosts are cross‑vendor, no per‑VM setting will help — matching hardware (or a save/quick migration) is required.

## Post‑reboot issues

- **A clustered VM is still on the neighbor (did not move back).** The post‑reboot log records a failure message that includes the exact manual command, for example `Move-ClusterVirtualMachineRole -Name '<role>' -Node <localNode>`. Run that command, or move the role back in Failover Cluster Manager. Confirm the neighbor and the cluster are healthy.
- **A non‑clustered VM did not resume.** Check its state: run `Resume-VM -Name '<VM>'` if it is Saved, or `Start-VM -Name '<VM>'` if it is Off. If it was Off (its state was not preserved), set its automatic stop action to save state for next time: `Set-VM -Name '<VM>' -AutomaticStopAction SaveIfRunning`.
- **The scheduled task is still present after a reboot.** The restore may not have completed — the task removes itself on success. Check the post‑reboot log, complete any remaining recovery manually (above), then remove the leftover task: `Unregister-ScheduledTask -TaskName 'Post Reboot - Restore-ClusterVMState' -Confirm:$false`.

## Rollback and Undo

## If the script aborts before the reboot (automatic rollback)

If any preflight, migration, or suspension step fails, the script **automatically rolls back** before rebooting: it moves any already‑migrated clustered VMs back to this node, resumes any suspended non‑clustered VMs, and removes the scheduled task and the post‑reboot script it created. The node is left in its pre‑run state, so in most cases **no manual cleanup is needed** — fix the reported issue and re‑run.

## Undoing the one‑time environment setup

If you need to revert the configuration made during Environment Setup:

**Active Directory delegation (Step 5).** The safest, most precise method is the graphical one, because it removes only the migration entries and leaves any unrelated delegation intact:

1. In **Active Directory Users and Computers** (Advanced View), open each node's computer object.
2. On the **Delegation** tab, remove the `cifs` and `Microsoft Virtual System Migration Service` entries for the peer nodes, or select **Do not trust this computer for delegation**.

PowerShell alternative — this clears **all** constrained‑delegation entries on the object, so use it only if the node has no other delegation you need to keep:

```powershell
foreach ($node in @('NodeA', 'NodeB')) {
    $computer = Get-ADComputer -Identity $node -Properties 'userAccountControl'
    $uac = [int]$computer.userAccountControl
    $uac = $uac -band (-bnot 16777216)
    Set-ADComputer -Identity $node -Clear 'msDS-AllowedToDelegateTo'
    Set-ADComputer -Identity $node -Replace @{ 'userAccountControl' = [int]$uac }
}
```

**Host live‑migration authentication type (Step 6).** Optional — leaving it set to Kerberos is harmless. To revert a node to CredSSP:

```powershell
Set-VMHost -VirtualMachineMigrationAuthenticationType CredSSP
```

**Per‑VM migration compatibility (Step 9).** Optional — leaving it enabled is harmless and generally recommended. To revert a VM (requires stopping it):

```powershell
Stop-ClusterGroup -Name '<VMName>'
Set-VMProcessor -VMName '<VMName>' -CompatibilityForMigrationEnabled $false
Start-ClusterGroup -Name '<VMName>'
```

## Manual recovery after a reboot if the restore did not complete

If the node rebooted but the post‑reboot restore did not finish (see **Post‑reboot issues**), recover manually:

- **Move clustered VMs back** to this node:

  ```powershell
  Move-ClusterVirtualMachineRole -Name '<role>' -Node '<localNode>'
  ```

  (or move the role in Failover Cluster Manager).

- **Resume non‑clustered VMs:**

  ```powershell
  Resume-VM -Name '<VM>'
  ```

  If a VM is Off rather than Saved, use `Start-VM -Name '<VM>'`.

- **Remove the leftover scheduled task** if it is still present:

  ```powershell
  Unregister-ScheduledTask -TaskName 'Post Reboot - Restore-ClusterVMState' -Confirm:$false
  ```

- **Review the post‑reboot log** at `C:\ProgramData\_Automation\Script\Restore-ClusterVMState\Restore-ClusterVMState-log.txt` to see what failed.

## Related Content

- **[Set-ClusterKerberosDelegation.ps1](/docs/7b34cb5e-5cd4-4257-82e3-bd2a6acd3934)** — the one‑time Active Directory delegation setup this script depends on (Environment Setup, Step 5). Must be run interactively as a domain administrator; see its README for details.
- **Per‑node host step** — `Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos` on each node (Environment Setup, Step 6); may run as SYSTEM.
- **Per‑VM step** — `Set-VMProcessor -VMName '<VMName>' -CompatibilityForMigrationEnabled $true` for clustered VMs that need it (Environment Setup, Step 9).

## Changelog

### 2026-07-24

- Initial version of the document
