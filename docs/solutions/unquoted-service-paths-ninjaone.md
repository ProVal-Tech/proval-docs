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

This solution finds these services on Windows devices in NinjaOne and, where you allow it, encloses their paths in quotation marks. You choose what happens on workstations and servers with [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387). Compound conditions run [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d) every 12 hours, which records the services in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196). When the option fixes that device type, the compound condition runs [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30), which fixes the paths and records any service it could not fix.

Key capabilities:

- **Audit or fix per device type**: Audit or fix workstations and servers separately, or leave one type untouched, for example to fix a client's workstations before its servers.
- **Accurate detection**: Only the executable part of the path is checked, so a space in the arguments is not reported, and paths that are already quoted are left alone.
- **No restarts**: The path is updated through the Windows service control manager. Running services keep running and use the new path the next time they start.
- **Results on each device**: cPVAL Unquoted Service Paths lists the services that need attention and is cleared when none is left. The `AutofixAttempted` column shows the services the autofix could not fix.
- **Signed scripts only**: Both automations verify their ProVal signature before they run.
- **Cross-client report (optional)**: The [Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e) report publishes the data as Knowledge Base articles and CSV files per organization and for all clients, or as CSV files only.

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Required | Managed By |
| --- | --- | --- | --- | --- | --- |
| [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) | - | `Autofix Workstations Only` | System, Organization, Location, Device | Yes | Manual |
| [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) | - | *HTML Table* | Device | Yes | Automation |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | - | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | No (reports only) | Manual |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | - | `67h5w58GIo0Y646lsxWXj5...` | System | No (reports only) | Manual |

### Automations

| Name | Function |
| --- | --- |
| [Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d) | Records the services with an unquoted path in cPVAL Unquoted Service Paths without changing them. Exits with 1 and a `Detected:` line when the device type is set to be fixed and a service is found. |
| [Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30) | Encloses the unquoted paths in quotation marks, then clears cPVAL Unquoted Service Paths or records the services it could not fix. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Unquoted Service Paths Knowledge Base articles and CSV files from cPVAL Unquoted Service Paths. |

### Audit Reports

| Name | Function |
| --- | --- |
| [Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e) | Lists the services with an unquoted path on each device, including the services the autofix could not fix, per organization and for all clients. |

### Compound Conditions

| Name | Function |
| --- | --- |
| [Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c) | Runs the detection script every 12 hours on workstations that cPVAL Unquoted Service Path Mode audits or fixes, and the autofix when the detection script finds services to fix. |
| [Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b) | Runs the detection script every 12 hours on servers, including domain controllers, that cPVAL Unquoted Service Path Mode audits or fixes, and the autofix when the detection script finds services to fix. |

## Implementation

### Step 1

Create the following custom fields as described in the documentation:

- [Custom Field: cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387)
- [Custom Field: cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196)

### Step 2

Create the following automations as described in the documentation:

- [Automation: Unquoted Service Paths - Detection](/docs/73387129-5472-4b0e-945e-f7822c57185d)
- [Automation: Unquoted Service Paths - Autofix](/docs/2b0fa58e-fc89-45fd-a1d5-7e7e64096e30)

### Step 3

Create the following compound conditions as described in the documentation:

- [Compound Condition: Unquoted Service Paths - Workstations](/docs/ed45bd74-48ec-4463-b012-1dfac05e9a1c)
- [Compound Condition: Unquoted Service Paths - Servers](/docs/2d18a56f-bbec-46ef-84c7-229643a76c4b)

### Step 4

Set [cPVAL Unquoted Service Path Mode](/docs/624406be-6c89-4ed4-a47c-14749752b387) at the system, organization, location or device level. To review the services before anything is changed, start with an audit option and switch to an autofix option later.

### Step 5 (Optional): Set Up the Report

Skip this step if the partner does not need the report. The compound conditions in Step 3 still keep the data on each device.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online, with the values listed in the **Report Settings** section of [Audit Report: Unquoted Service Paths](/docs/cfc2e3ef-c8f1-4182-ada3-f4e55b7f0d1e).

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

## FAQs

### **Q.** What is an unquoted service path, and why does it matter?

**A:** It is a service whose executable path contains a space and is not in quotation marks, for example `C:\Program Files\Vendor Agent\agent.exe`. Windows treats the space as the end of the program name and tries `C:\Program.exe` first. Anyone who can save a program at that location can have it run with the service's rights, usually as SYSTEM. With the default folder permissions this is hard to exploit, but security scans still report it, and adding the quotation marks removes the risk.

### **Q.** Which option should I start with?

**A:** `Audit All`. Review the services in [cPVAL Unquoted Service Paths](/docs/b3d517ef-c7e4-4dc7-aa10-1e52b6edb196) or the report, then switch to an autofix option.

### **Q.** How do I enable the solution for a client's workstations without touching its servers?

**A:** Set **cPVAL Unquoted Service Path Mode** at the organization or location level to `Audit Workstations Only` or `Autofix Workstations Only`. Servers are not checked, and their cPVAL Unquoted Service Paths field is not changed.

### **Q.** Can I set the mode once for every client?

**A:** Yes. Set it at the system level, then override it at the organization, location or device level where needed.

### **Q.** How do I exclude a location or a device?

**A:** Set **cPVAL Unquoted Service Path Mode** to `Disabled` at that level. The setting applies to every device below it unless a lower level overrides it.

### **Q.** Do servers include domain controllers?

**A:** Yes.

### **Q.** Which services does the solution change?

**A:** Only services whose executable path, the text up to the first `.exe`, contains a space and is not in quotation marks. The solution adds the quotation marks around that part and keeps the arguments as they are. Kernel drivers are not checked, because Windows loads them without the path search that makes unquoted paths a risk.

### **Q.** Will the solution restart services or the device?

**A:** No. Running services keep running and use the new path the next time they start, for example after the next restart of the device.

### **Q.** How often does the solution check devices?

**A:** Every 12 hours. A compound condition resets 6 hours after it triggers, so the next check picks up new services and services the autofix could not fix.

### **Q.** What does the AutofixAttempted column mean?

**A:** `0` means the detection script recorded the service. `1` means the autofix ran and the path is still unquoted.

### **Q.** The autofix could not fix a service. What should I do?

**A:** Open the activity log of the autofix run on the device; it gives the reason for each service. A common cause is a security product that protects its own service from changes. Fix the path through the vendor's tools or support. The solution tries again at every check until the path is fixed.

### **Q.** Why is cPVAL Unquoted Service Paths empty?

**A:** Either no service on the device has an unquoted path, which clears the field, or the device has not been checked yet, or **cPVAL Unquoted Service Path Mode** skips the device.

### **Q.** Why does a device show services even though its mode is Disabled?

**A:** When the mode skips a device, the field keeps the data recorded before. To refresh it, set an audit option for the device until the next check, then set it back.

### **Q.** I changed the mode, but nothing happened. Why?

**A:** The change is picked up at the next check, within 12 hours. To fix a device right away, run **Unquoted Service Paths - Autofix** on it. The autofix does not read the mode, so it fixes the device whatever the mode is set to.

### **Q.** Can I see the unquoted service paths of all clients in one place?

**A:** Yes, with the optional report in Step 5. It publishes the data as Knowledge Base articles and CSV files per organization and for all clients.

### **Q.** Can I use the report without the NinjaOne Documentation app?

**A:** Yes. Set **Report Output** to **Local CSV Files** in the report automation. The report then creates only the CSV files, on the device that runs it, in `C:\ProgramData\_Automation\Report\Security`.

### **Q.** Does the report list devices without unquoted service paths?

**A:** No. Their cPVAL Unquoted Service Paths field is empty, so they do not appear.

### **Q.** What do the detection script's exit codes mean?

**A:**

- **0:** No action needed. The device type is skipped, no service was found, or the services were found and only audited.
- **1:** The device type is set to be fixed and services were found. The output has a line that begins with `Detected:` and lists the services, and the compound condition runs the autofix.
- **2:** The script could not finish, for example because a custom field could not be read or updated, or the signature check failed. The output gives the reason.

### **Q.** Where can I see the logs?

**A:** In the NinjaOne activity log of each run. The automations do not write log files on the device.

### **Q.** What does Invalid Signature in the activity log mean?

**A:** The automation is not signed by ProVal, so it stopped before checking or changing anything. Import the latest version of the automation from its documentation.

### **Q.** Does this solution support Mac or Linux devices?

**A:** No. Unquoted service paths are a Windows issue, and the solution runs only on Windows devices.

## Changelog

### 2026-10-27

- Initial version of the document
