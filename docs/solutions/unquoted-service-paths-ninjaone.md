---
id: '463a9e42-df91-406d-b53c-285f4cbdabac'
slug: /463a9e42-df91-406d-b53c-285f4cbdabac
title: 'Unquoted Service Paths - NinjaOne'
title_meta: 'Unquoted Service Paths - NinjaOne'
keywords: ['unquoted-service-path','services','vulnerability','audit','autofix','knowledge-base']
description: 'Finds Windows services with an unquoted executable path, fixes them on the device types you choose, and reports them per organization and for all clients in NinjaOne.'
tags: ['security','vulnerability','windows','custom-fields','auditing','report','knowledge-base']
draft: false
unlisted: false
last_update:
  date: 2026-10-27
---

## Purpose

An unquoted service path is a Windows service whose executable path contains a space and is not enclosed in quotation marks, for example `C:\Program Files\Vendor Agent\agent.exe`. Windows can then try to start an earlier part of the path, such as `C:\Program.exe`, so anyone who can save a program there can have it run with the service's rights, usually as SYSTEM. Security scans report these services as a privilege escalation risk.

This solution finds these services on Windows devices in NinjaOne and, where you allow it, encloses their paths in quotation marks. [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) sets what happens on workstations and servers. Two compound conditions run [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d), which records the services in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196), and run [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30) when the device type is set to be fixed. The optional [Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e) report collects the results from every client.

**Platform:** `NinjaOne`

### Key Capabilities

- **Audit or fix per device type** – Audit or fix workstations and servers separately, or leave one type untouched, for example to fix a client's workstations before its servers.
- **Accurate detection** – Only the executable part of the path is checked, so a space in the arguments is not reported, and paths that are already quoted are left alone.
- **No restarts** – The path is updated through the Windows service control manager. Running services keep running and use the new path the next time they start.
- **Results on each device** – cPVAL Unquoted Service Paths lists the services that need attention and is cleared when none is left. The `AutofixAttempted` column shows the services the autofix could not fix.
- **Signed scripts only** – Both automations verify their ProVal signature before they check or change anything.
- **Cross-client report (optional)** – The report publishes the data as Knowledge Base articles and CSV files per organization and for all clients, or as CSV files only.

### Important Caveats & Behavior

- **Check interval** – Devices are checked every 12 hours. A compound condition resets 6 hours after it triggers, so the next check picks up new services and services the autofix could not fix.
- **Protected services** – Some security products protect their own service from changes, so the autofix gets access denied. The service stays in cPVAL Unquoted Service Paths with `AutofixAttempted` set to `1`, and the autofix runs again and fails at every check until the path is fixed through the vendor.
- **Skipped devices keep their data** – When the mode skips a device, cPVAL Unquoted Service Paths is not changed, so it keeps the data recorded before. Set an audit option until the next check to refresh it.
- **Running the autofix on demand** – The autofix does not read the mode. Run on demand, it fixes the device whatever the mode is set to.
- **Domain controllers count as servers.**
- **Kernel drivers are not checked** – Windows loads them without the path search that makes unquoted paths a risk.

## How It Works

1. Every 12 hours, the [Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c) or [Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b) compound condition checks cPVAL Unquoted Service Path Mode. When the mode skips the device type, nothing runs.
2. Unquoted Service Paths - Detection finds the services with an unquoted path and records them in cPVAL Unquoted Service Paths with `AutofixAttempted` set to `0`. When none is found, it clears the field.
3. When the mode fixes the device type and services were found, the detection script exits with 1 and writes `Detected:`, and the compound condition runs Unquoted Service Paths - Autofix.
4. The autofix encloses the paths in quotation marks and checks the services again. It clears the field when none is left, or records the remaining services with `AutofixAttempted` set to `1`.
5. Optional: once per day, the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation collects [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) from every device into the report.

## Mode Options

| | Audit | Autofix |
|---|---|---|
| **What it does** | Lists the services in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196). | Lists the services and encloses their paths in quotation marks. |
| **Changes on the device** | None. | The service path only. No service or device is restarted. |
| **Best for** | Reviewing the services before changing anything, or devices where changes need approval. | Devices you want fixed without manual work. |

**How to choose:**

- Pick **Audit** if you want to review the services first, for example during the first rollout at a client.
- Pick **Autofix** if the services can be fixed as soon as they are found.

Each device type gets its own choice:

| Option | Workstations | Servers |
|---|---|---|
| `Disabled` or blank | Skipped | Skipped |
| `Audit All` | Audit | Audit |
| `Audit Workstations Only` | Audit | Skipped |
| `Audit Servers Only` | Skipped | Audit |
| `Autofix All` | Autofix | Autofix |
| `Autofix Workstations Only` | Autofix | Skipped |
| `Autofix Servers Only` | Skipped | Autofix |
| `Autofix Workstations and Audit Servers` | Autofix | Audit |
| `Autofix Servers and Audit Workstations` | Audit | Autofix |

## Prerequisites

- Windows devices with Windows PowerShell 5.1. The automations run as System.
- Access to `contentrepo.net` from the devices, for the signature check.
- For the optional report: a NinjaOne API application, and the **NinjaOne Documentation** app for Knowledge Base articles. Without the Documentation app, the report creates CSV files only.

## Associated Content

### Custom Fields

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) | System, Organization, Location, Device | Drop-down | Sets, per device type, whether the solution skips, audits or fixes the device. |
| [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) | Device | WYSIWYG | Lists the services with an unquoted path. Written by the automations. |

### Automations

| Name | Purpose |
|---|---|
| [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d) | Runs as the condition of the compound conditions. Records the services without changing them, and exits with 1 and a `Detected:` line when the device type is set to be fixed and a service is found. |
| [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30) | Runs when the detection script exits with 1, or on demand. Encloses the paths in quotation marks, then clears [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) or records the services it could not fix. |

### Compound Conditions

| Name | Type | Purpose |
|---|---|---|
| [Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c) | Compound Condition | Runs the detection script every 12 hours on workstations that the mode audits or fixes, and the autofix when the detection script finds services to fix. Added to `Windows Workstation Policy [Default]`. |
| [Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b) | Compound Condition | Runs the detection script every 12 hours on servers, including domain controllers, that the mode audits or fixes, and the autofix when the detection script finds services to fix. Added to `Windows Server Policy [Default]`. |

### Custom Fields: Report (optional)

These fields hold the NinjaOne API credentials the report uses. Reuse them if another ProVal reporting solution already set them up.

| Name | Level | Type | Purpose |
|---|---|---|---|
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | System | Secure | Client ID of the NinjaOne API application. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | System | Secure | Client secret of the NinjaOne API application. |

### Automation: Report (optional)

| Name | Purpose |
|---|---|
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Builds the Unquoted Service Paths Knowledge Base articles and CSV files from [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196). Scheduled once per day against one device. |

### Report (optional)

| Name | Purpose |
|---|---|
| [Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e) | Lists the services with an unquoted path on each device, including the services the autofix could not fix, per organization and for all clients. |

## Implementation

### Step 1: Create the Custom Fields

Create the fields as described in their documentation.

- [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387)
- [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196)

### Step 2: Create the Automations

Create both automations as described in their documentation.

- [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d)
- [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30)

### Step 3: Create the Compound Conditions

Add each compound condition to its agent policy as described in its documentation.

- [Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c)
- [Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b)

### Step 4: Set the Mode

Set [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) at the system, organization, location or device level. To review the services before anything changes, start with an audit option and switch to an autofix option later.

### Step 5: Set Up the Report (optional)

Skip this step if the partner does not need the report. The compound conditions still keep the data on each device.

1. Create the NinjaOne API application and fill [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687).
2. Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. Schedule it once per day against **one** device, such as a server that is always online, with the values in the **Report Settings** section of [Report: Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e). Without the **NinjaOne Documentation** app, set **Report Output** to **Local CSV Files**.

You'll know it worked when, within 12 hours of setting the mode, devices with unquoted service paths show them in cPVAL Unquoted Service Paths, and on device types set to Autofix the field is cleared or lists only services with `AutofixAttempted` set to `1`.

## FAQ

### Q: What is an unquoted service path, and why does it matter?

> It is a service whose executable path contains a space and is not in quotation marks, for example `C:\Program Files\Vendor Agent\agent.exe`. Windows treats the space as the end of the program name and tries `C:\Program.exe` first. Anyone who can save a program at that location can have it run with the service's rights, usually as SYSTEM. With the default folder permissions this is hard to exploit, but security scans still report it, and adding the quotation marks removes the risk.

### Q: How do I enable the solution for a client's workstations without touching its servers?

> Set **cPVAL Unquoted Service Path Mode** at the organization or location level to `Audit Workstations Only` or `Autofix Workstations Only`. Servers are not checked, and their cPVAL Unquoted Service Paths field is not changed.

### Q: Can I set the mode once for every client?

> Yes. Set it at the system level, then override it at the organization, location or device level where needed.

### Q: How do I exclude a location or a device?

> Set **cPVAL Unquoted Service Path Mode** to `Disabled` at that level. The setting applies to every device below it unless a lower level overrides it.

### Q: Which services does the solution change?

> Only services whose executable path, the text up to the first `.exe`, contains a space and is not in quotation marks. The solution adds the quotation marks around that part and keeps the arguments as they are.

### Q: What does the AutofixAttempted column mean?

> `0` means the detection script recorded the service. `1` means the autofix ran and the path is still unquoted.

### Q: The autofix could not fix a service. What should I do?

> Open the activity log of the autofix run on the device; it lists each service that could not be fixed. A common cause is a security product that protects its own service from changes. Fix the path through the vendor's tools or support.

### Q: I changed the mode, but nothing happened. Why?

> The change is picked up at the next check, within 12 hours. To fix a device right away, run **Unquoted Service Paths - Autofix** on it.

### Q: Can I use the report without the NinjaOne Documentation app?

> Yes. Set **Report Output** to **Local CSV Files** in the report automation. The report then creates only the CSV files, on the device that runs it, in `C:\ProgramData\_Automation\Report\Security`.

### Q: Does the report list devices without unquoted service paths?

> No. Their cPVAL Unquoted Service Paths field is empty, so they do not appear.

### Q: What do the detection script's exit codes mean?

> - **0:** No action needed. The device type is skipped, no service was found, or the services were found and only audited.
> - **1:** The device type is set to be fixed and services were found. The output has a line that begins with `Detected:` and lists the services, and the compound condition runs the autofix.
> - **2:** The script could not finish, for example because a custom field could not be read or updated, or the signature check failed. The output gives the reason.

### Q: Where can I see the logs?

> In the NinjaOne activity log of each run. The automations do not write log files on the device.

### Q: What does Invalid Signature in the activity log mean?

> The automation is not signed by ProVal, so it stopped before checking or changing anything. Import the latest version of the automation from its documentation.

### Q: Does this solution support Mac or Linux devices?

> No. Unquoted service paths are a Windows issue, and the solution runs only on Windows devices.

### Q: cPVAL Unquoted Service Paths stays empty on a device I expect to have unquoted paths. What should I check?

> 1. **Mode:** The value of **cPVAL Unquoted Service Path Mode** that applies to the device covers its type. Check the device, location, organization and system levels.
> 2. **Policy:** The device's agent policy has the matching compound condition.
> 3. **Timing:** A check has run since the mode was set, which can take up to 12 hours.
> 4. **Detection result:** The activity log of **Unquoted Service Paths - Detection** on the device. Exit code 2 gives the reason, for example missing custom field permissions, no access to `contentrepo.net`, or Invalid Signature.
> 5. **The path itself:** Only paths whose executable part contains a space and has no quotation marks are reported. A space in the arguments alone is not.

## Changelog

### 2026-10-27

- Initial version of the document
