---
id: 'eae2fab9-4697-4e1e-ad8f-93f8a09d7056'
slug: /eae2fab9-4697-4e1e-ad8f-93f8a09d7056
title: 'Installed Remote Access Tool Audit'
title_meta: 'Installed Remote Access Tool Audit'
keywords: ['installed-tools', 'remote-access', 'remote-access-tools-auditing', 'rmm', 'unauthorized-tools', 'report', 'knowledge-base']
description: 'Finds remote access, RMM and other management tools on Windows devices, raises tickets for unapproved tools, and reports them across all clients.'
tags: ['windows', 'auditing', 'security', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **Installed Remote Access Tool Audit** solution answers a key security question: *which tools can reach this device from outside?*

It finds remote access, RMM and other management tools on Windows workstations and servers, such as TeamViewer, AnyDesk, ScreenConnect, Kaseya or Datto. Approved tools can be excluded, and unapproved ones can raise a ConnectWise Manage ticket. Use it to spot shadow IT, confirm old RMM agents were removed after a migration, and keep outside access under control.

## How It Works

1. **Detect:** The [Audit Installed Remote Tools (with Ticketing) - Workstation](/docs/fcff5bd0-198e-4b40-a877-61efa4bec69e) and [Audit Installed Remote Tools (with Ticketing) - Servers](/docs/d19f2a89-9667-41df-93ce-797295aa542a) compound conditions run the [Installed Remote Tool Audits](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) automation on Windows devices. It checks installed programs, running processes, services and known program paths, then stores the findings in [cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66) and the tool names in [cPVAL Detected Remote Tool Names](/docs/6238b6b2-1e19-4840-8f54-0d952a694c8a).
2. **Alert:** When a tool is found, the automation reports as failed. If ticketing is turned on in [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651), the compound conditions create a ticket from the [Unauthorized Remote Tools](/docs/d733a553-e69b-4c4e-b209-f05102bae6e5) template.
3. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation runs on one device and turns [cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66) into organization and global Knowledge Base articles and CSV files.

## Key Capabilities

* **Wide Coverage:** Detects 43 remote access, RMM and management tools, listed below.
* **Several Detection Methods:** Installed programs, running processes, services and program paths, so portable and partly removed tools are found too.
* **ScreenConnect per Instance:** Each ScreenConnect instance gets its own row, so your own instance can be approved while others are flagged.
* **Flexible Exclusions:** Approve tools for all clients, or per organization, location or device.
* **Ticketing:** Unapproved tools can raise a ConnectWise Manage ticket automatically.
* **Groups and Exports:** Detected tool names are stored as plain text for dynamic groups and exports.
* **Cross-Client View:** An optional Knowledge Base article and CSV files per organization and for all clients.

### Supported Tools

NinjaOne is not on the list, because the audit runs through it.

1. AeroAdmin
2. Ammyy Admin
3. AnyDesk
4. Atera
5. Automate (ConnectWise Automate)
6. Auvik
7. BeyondTrust
8. Chrome Remote Desktop
9. Continuum
10. CW RMM (ConnectWise RMM)
11. DameWare
12. Datto (other Datto products)
13. Datto RMM
14. DWService
15. GoToAssist
16. GoToMyPC
17. ITSPlatform
18. Kaseya
19. Kaseya VSA (VSA)
20. LiteManager
21. LogMeIn
22. Malwarebytes
23. ManageEngine
24. N-Able N-Central
25. N-Able N-Sight
26. Naverisk
27. NoMachine
28. Parsec
29. PRTG
30. Rapid7 Insight Agent
31. Remote Utilities
32. RemotePC
33. ScreenConnect / ConnectWise Control (one row per instance)
34. SolarWinds
35. Splashtop
36. Supremo
37. Syncro
38. TeamViewer
39. TightVNC
40. UltraVNC
41. VNC (generic detection)
42. VNC Connect (RealVNC)
43. Zoho Assist

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651) | *(blank)* | `Windows (with Ticketing)` | Organization, Location, Device | Manual | Turns on ticketing for detected tools, for Windows devices, workstations only or servers only. |
| [cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47) | *(blank)* | `TeamViewer; AnyDesk` | Organization, Location, Device | Manual | Optional list of tools to ignore. Use `ScreenConnect Client (<instance ID>)` to ignore one ScreenConnect instance. |
| [cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66) | *(blank)* | *HTML table* | Device | Automation | Stores the detected tools with their details. |
| [cPVAL Detected Remote Tool Names](/docs/6238b6b2-1e19-4840-8f54-0d952a694c8a) | *(blank)* | `TeamViewer` | Device | Automation | Stores the detected tool names, one per line, for groups and exports. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Optional. Only needed for the report. Identifies the API application the report automation signs in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Optional. Only needed for the report. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [Installed Remote Tool Audits](/docs/8111fecc-61de-4c72-933c-b719351b7a1e) | Checks the device for remote access, RMM and management tools and stores the findings in the custom fields. Reports as failed when a tool is found. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from [cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66). |

### Compound Conditions

| Name | Function |
| :--- | :--- |
| [Audit Installed Remote Tools (with Ticketing) - Workstation](/docs/fcff5bd0-198e-4b40-a877-61efa4bec69e) | Runs the audit on Windows workstations. Creates a ticket for detected tools when `Windows (with Ticketing)` or `Windows Workstations (with Ticketing)` is selected in [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651). |
| [Audit Installed Remote Tools (with Ticketing) - Servers](/docs/d19f2a89-9667-41df-93ce-797295aa542a) | Runs the audit on Windows servers. Creates a ticket for detected tools when `Windows (with Ticketing)` or `Windows Servers (with Ticketing)` is selected in [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651). |

### Ticket Template

| Name | Function |
| :--- | :--- |
| [Unauthorized Remote Tools](/docs/d733a553-e69b-4c4e-b209-f05102bae6e5) | Sets how the ConnectWise Manage ticket is created by the [Audit Installed Remote Tools (with Ticketing) - Workstation](/docs/fcff5bd0-198e-4b40-a877-61efa4bec69e) and [Audit Installed Remote Tools (with Ticketing) - Servers](/docs/d19f2a89-9667-41df-93ce-797295aa542a) compound conditions. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Admin - RMM or Other Management Software](/docs/68d77a2d-3fa9-4244-931b-e7eeb46962d7) | Lists the detected tools of every client, per organization and for all clients. |

---

## Implementation

### Step 1: Create the Custom Fields

* [Custom Field: cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651)
* [Custom Field: cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47)
* [Custom Field: cPVAL Installed Remote Access Tools](/docs/62487ab1-8f55-426d-8127-f0ba0fcf4f66)
* [Custom Field: cPVAL Detected Remote Tool Names](/docs/6238b6b2-1e19-4840-8f54-0d952a694c8a)

### Step 2: Create the Automation

* [Automation: Installed Remote Tool Audits](/docs/8111fecc-61de-4c72-933c-b719351b7a1e)

Set **Run as** to `System`.

### Step 3: Create the Ticket Template

* [Ticket Template: Unauthorized Remote Tools](/docs/d733a553-e69b-4c4e-b209-f05102bae6e5)

### Step 4: Create the Compound Conditions

* [Compound Condition: Audit Installed Remote Tools (with Ticketing) - Workstation](/docs/fcff5bd0-198e-4b40-a877-61efa4bec69e)
* [Compound Condition: Audit Installed Remote Tools (with Ticketing) - Servers](/docs/d19f2a89-9667-41df-93ce-797295aa542a)

:::note  
Importing the compound conditions starts the audit on Windows devices right away. Tickets are created only where `Windows (with Ticketing)`, `Windows Workstations (with Ticketing)` or `Windows Servers (with Ticketing)` is selected in [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651).  
:::

### Step 5: Approve Known Tools

List the tools the partner uses on purpose, such as their own ScreenConnect instance, in [cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47) at the organization, location or device level. Approved tools are not reported and do not raise tickets.

### Step 6 (Optional): Set Up the Report

Skip this step if the partner does not need the report. The audit still runs and keeps its findings on each device in the custom fields.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online. Run it after the audit. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: Admin - RMM or Other Management Software](/docs/68d77a2d-3fa9-4244-931b-e7eeb46962d7)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It finds remote access, RMM and other management tools on Windows devices, lists them in custom fields, and can raise a ticket when an unapproved tool is found.

**Q. Does it remove the tools it finds?**  
**A:** No. It only reports them. Removal is a separate decision for the partner.

**Q. Why does the automation show as failed?**  
**A:** That is by design. It reports as failed when it finds at least one tool, so the compound conditions can create a ticket.

**Q. Why is NinjaOne not detected?**  
**A:** NinjaOne runs the audit, so it is left out on purpose.

**Q. Does it support Mac or Linux?**  
**A:** No. It supports Windows devices only.

### Exclusions

**Q. How do I stop an approved tool from being reported?**  
**A:** Add its name, as shown in the supported tools list, to [cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47). Separate several names with commas or semicolons.

**Q. Can I approve only our own ScreenConnect instance?**  
**A:** Yes. Add `ScreenConnect Client (<instance ID>)` to [cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47). Other ScreenConnect instances are still reported. Add `ScreenConnect` to ignore every instance.

**Q. Can exclusions differ per client?**  
**A:** Yes. Set [cPVAL Whitelisted Remote Access Tools](/docs/d345df22-5ef0-4da0-8d71-bcfe53c2fe47) at the organization, location or device level. The automation's `Whitelisted Remote Access Tools` parameter applies to all clients, and both lists are combined.

### Ticketing

**Q. How do I turn on tickets?**  
**A:** Select `Windows (with Ticketing)`, `Windows Workstations (with Ticketing)` or `Windows Servers (with Ticketing)` in [cPVAL Enable Remote Tools Detection](/docs/175e9426-65df-4a50-a0d6-e134fa9d9651).

**Q. Does the audit run without ticketing?**  
**A:** Yes. Once the compound conditions are imported, the audit runs on Windows devices and fills the custom fields. Tickets are only created where ticketing is selected.

### Reports

**Q. Do I need the report?**  
**A:** No. It is optional. Without it, the findings are still kept on each device in the custom fields.

**Q. What do I need for the Knowledge Base articles?**  
**A:** The **NinjaOne Documentation** app, an API application with its credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), and the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation. Without the Documentation app, the report can create CSV files only.

**Q. Which devices appear in the report?**  
**A:** Only devices with at least one detected tool. Devices without tools are left out.

---

## Changelog

### 2026-10-14

- Rewrote the document in the current solution format.
- Added detection for SolarWinds, Rapid7 Insight Agent, Continuum, PRTG, Auvik, Naverisk and other Datto products. Kaseya detection now covers every Kaseya product.
- Added the optional [Admin - RMM or Other Management Software](/docs/68d77a2d-3fa9-4244-931b-e7eeb46962d7) report, built by the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation, with the optional credential fields it needs.
- The [Unauthorized Remote Tools](/docs/d733a553-e69b-4c4e-b209-f05102bae6e5) ticket template now links to the current ticketing compound conditions.

### 2026-08-27

- Updated the script to exclude NinjaRMM from detection and modified the exit behavior so that the script returns exit code 1 instead of exit code 2 when an unauthorized remote access tool is detected.
- Updated both compound conditions to create a ticket when the script exits with exit code 1, replacing the previous logic that triggered ticket creation on exit code 2.

### 2026-08-04

- Updated the `cPVAL Enable Remote Tools Detection` custom field to include only ticketing options, as the audit is automatically performed by the ticketing compound conditions.
- Removed the audit compound conditions `Audit Installed Remote Tools - Workstations` and `Audit Installed Remote Tools - Server`, as the ticketing compound conditions execute the script regardless of whether the custom fields are selected. If ticketing conditions are imported into the environment, the audit will run automatically, and tickets will only be generated when the ticketing options are enabled in the `cPVAL Enable Remote Tools Detection` custom field.

### 2026-07-27

- Added new Multi-Line Text field `cPVAL Detected Remote Tool Names` to store only the detected tool names.
- Updated script to populate this new field, allowing results to be used in dynamic groups and exports.

### 2026-06-24

- Initial version of the document
