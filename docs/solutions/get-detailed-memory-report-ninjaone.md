---
id: 'fd8c41d3-ecf7-4eb8-95f5-4317a787a579'
slug: /fd8c41d3-ecf7-4eb8-95f5-4317a787a579
title: 'Get Detailed Memory Information - NinjaOne'
title_meta: 'Get Detailed Memory Information - NinjaOne'
keywords: ['memory', 'ram', 'hardware-inventory', 'windows', 'custom-fields', 'audit-report', 'ninjaone']
description: 'Collects detailed memory information from Windows servers and workstations, stores memory inventory data in NinjaOne custom fields, and provides reports for reviewing installed memory and upgrade opportunities.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-26
---

## Purpose

The **Get Detailed Memory Information - NinjaOne** solution collects memory inventory information from Windows servers and workstations. It records installed memory capacity, module details, memory speeds, manufacturer information, and available memory slots, then stores the collected results in NinjaOne custom fields.

Use this solution to review installed memory across managed devices, identify memory configurations, assess available upgrade capacity, and generate organization-level or global reports for hardware inventory and refresh planning.

## How It Works

1. **Collect:** The [Get Detailed Memory Information](\/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) automation queries Windows system information and physical memory details.
2. **Store:** The automation writes the memory summary and memory module information to the [cPVAL Memory Summary](\/docs/ca470e3b-6664-46ed-b2f8-31e281db0e2f) and [cPVAL Memory Modules](\/docs/861c715f-e228-4342-b9f8-6f663917c902) custom fields.
3. **Determine Applicability:** Separate server and workstation compound conditions define the applicable Windows device scope for the memory inventory automation.
4. **Report:** The [Get memory Summary Report](\/docs/b4d40cab-a530-45d5-b4db-337b87003868) and [Get Memory Module Report](\/docs/fecd8d67-3944-4d87-9468-6ab2d3e62ee5) audit reports provide views of collected memory summary and module information.

## Key Capabilities

- **Memory Summary:** Collects total installed RAM, memory slot usage, and maximum supported memory capacity when available.
- **Memory Module Inventory:** Records module capacity, slot information, memory type, form factor, rated and running speeds, manufacturer, and part number.
- **HTML Custom Fields:** Stores the memory summary and module details in HTML-formatted custom fields for readable presentation in NinjaOne.
- **Virtual Machine Detection:** Identifies virtual machines using system manufacturer and model information, reports assigned memory, and skips physical memory module enumeration.
- **Upgrade Planning:** Helps technicians review installed memory and identify potential memory upgrade opportunities based on the collected hardware information.
- **Server and Workstation Support:** Uses separate compound conditions to define the applicable Windows server and workstation deployment scope.
- **Audit Reporting:** Provides separate reports for reviewing memory summaries and individual memory modules across organizations.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Get Memory Details](/docs/639be1ed-c056-4006-ba62-cf5083e39fd0) | *Blank* | Configured value | Device | Verify configuration | Associated with the memory inventory solution. Confirm its specific role in the automation configuration before deployment. |
| [cPVAL Memory Modules](/docs/861c715f-e228-4342-b9f8-6f663917c902) | *Blank* | HTML table | Device | Automation | Stores collected physical memory module details in HTML format. |
| [cPVAL Memory Summary](/docs/ca470e3b-6664-46ed-b2f8-31e281db0e2f) | *Blank* | HTML table | Device | Automation | Stores the collected memory summary in HTML format. |

### Automations

| Name | Function |
| :--- | :--- |
| [Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) | Collects memory inventory information and updates the memory summary and module custom fields. |

### Compound Conditions

| Name | Function |
| :--- | :--- |
| [Get Detailed Memory Information - Servers](/docs/3e5b56c4-7ac8-48ef-8332-ce6c683ff492) | Defines the applicable Windows server scope for the memory inventory automation. |
| [Get Detailed Memory Information - Workstations](/docs/62d1b964-0aca-4406-bfd7-c6f446418029) | Defines the applicable Windows workstation scope for the memory inventory automation. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Get memory Summary Report](/docs/b4d40cab-a530-45d5-b4db-337b87003868) | Presents collected memory summary information for inventory review and hardware refresh planning. |
| [Get Memory Module Report](/docs/fecd8d67-3944-4d87-9468-6ab2d3e62ee5) | Presents collected memory module details for reviewing individual installed memory modules. |

---

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields in NinjaOne:

- [cPVAL Get Memory Details](/docs/639be1ed-c056-4006-ba62-cf5083e39fd0)
- [cPVAL Memory Summary](/docs/ca470e3b-6664-46ed-b2f8-31e281db0e2f)
- [cPVAL Memory Modules](/docs/861c715f-e228-4342-b9f8-6f663917c902)

Ensure the memory summary and memory module fields support WYSIWYG HTML content and that the automation can update the required fields. Confirm the intended configuration and role of the **cPVAL Get Memory Details** field before deployment.

### Step 2: Create the Automation

Create the [Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) automation.

Configure **Run As** to `System` so the script can query Windows memory information and update the NinjaOne custom fields.

Verify that the script is configured to write the memory summary and module information to the correct custom fields.

### Step 3: Configure the Compound Conditions

Create the following compound conditions:

- [Get Detailed Memory Information - Servers](/docs/3e5b56c4-7ac8-48ef-8332-ce6c683ff492)
- [Get Detailed Memory Information - Workstations](/docs/62d1b964-0aca-4406-bfd7-c6f446418029)

Configure the conditions according to the intended server and workstation deployment scope. Use the appropriate condition to determine which devices should receive the memory inventory automation.

### Step 4: Schedule the Automation

Schedule the automation against the applicable Windows server and workstation groups using the configured compound conditions.

Choose a collection frequency that meets the organization's hardware inventory requirements. After the initial run, review the **cPVAL Memory Summary** and **cPVAL Memory Modules** custom fields to confirm that the collected information is displayed correctly.

### Step 5: Configure the Audit Reports (Optional)

Skip this step if the partner does not need reports. Memory inventory data can still be collected and stored in the device-level custom fields.

1. **API application and credentials:** Create the NinjaOne API application and configure the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If these credentials are already configured for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Configure report settings:** Use the **Report Settings** section in each audit report to configure the output. The supplied settings specify `Knowledge Base Articles and Local CSV Files` as the report output and `All Organizations and Global` as the report scope.
4. **Schedule:** Schedule the report automation on **one** device, such as a server that is consistently online. Run it after the memory inventory automation has collected the latest data.

Configure the report output using the settings documented in:

- [Get memory Summary Report](/docs/b4d40cab-a530-45d5-b4db-337b87003868)
- [Get Memory Module Report](/docs/fecd8d67-3944-4d87-9468-6ab2d3e62ee5)

:::note
Knowledge Base article creation requires the **NinjaOne Documentation** app. Without this app, configure **Report Output** to **Local CSV Files** to generate CSV files on the device running the report automation.
:::

:::note
If no physical memory modules are found, the automation reports a failure. If memory information is missing, verify that the device supports the required CIM queries and that the custom fields exist and can be updated. Virtual machines are handled separately, and physical module enumeration is skipped for them.
:::

---

## FAQ

### General Usage

**Q. What does this solution do?**

**A:** It collects memory inventory information from Windows servers and workstations and stores the results in NinjaOne custom fields for inventory review and reporting.

**Q. What information does the automation collect?**

**A:** It collects total installed memory, slot usage, maximum supported capacity when available, and physical memory module details such as capacity, memory type, form factor, speeds, manufacturer, and part number.

**Q. Does the automation modify the computer's memory configuration?**

**A:** No. The automation is intended to read memory inventory information and update NinjaOne custom fields. It does not install, remove, or reconfigure physical memory.

**Q. Where are the results stored?**

**A:** The memory summary is stored in the **cPVAL Memory Summary** custom field, and individual module details are stored in the **cPVAL Memory Modules** custom field.

**Q. How are virtual machines handled?**

**A:** The automation identifies virtual machines using system manufacturer and model information, reports assigned memory, and skips physical memory module enumeration.

**Q. What should I check if the automation fails?**

**A:** Review the automation output, confirm that the required custom fields exist and can be updated, and verify that Windows CIM queries return the required memory information. If no physical memory modules are found, review the device's reported hardware information.

### Reports

**Q. What are the audit reports used for?**

**A:** The memory summary report provides a consolidated view of memory inventory, while the memory module report provides details about individual installed memory modules.

**Q. Are the reports required?**

**A:** No. Reports are optional. The automation can still collect and store memory information in the device-level custom fields.

**Q. What is required to generate Knowledge Base articles?**

**A:** The **NinjaOne Documentation** app, a configured NinjaOne API application with the required credentials, and the **WYSIWYG Custom Field Report - Organization and Global KB** automation are required. Without the Documentation app, the report can generate local CSV files instead.

**Q. How can I ensure the reports contain current information?**

**A:** Run the report automation after the memory inventory automation so the report can use the latest information available in the custom fields.

---

## Changelog

### 2026-10-26

- Initial version of the document.
