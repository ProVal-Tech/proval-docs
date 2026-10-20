---
id: 'b5c871cf-f8fc-4fde-b20c-5aabd7341ade'
slug: /b5c871cf-f8fc-4fde-b20c-5aabd7341ade
title: 'Get Printer Details'
title_meta: 'Get Printer Details'
keywords: ['printer', 'print']
description: 'This solution is built to fetch the attached Printer Details from the endpoint.'
tags: ['print', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-13
---

## Purpose

This solution is built to fetch the attached Printer Details of the Windows endpoint.

## How It Works

**Collect:** The [Script - Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412) runs on Windows machines. It executes PowerShell to collect the information and stores it in [Custom Field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f).

**Report (optional):** The [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) automation runs on one device and turns [Custom Field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f) into organization and global Knowledge Base articles and CSV files.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f) | *(blank)* | *HTML table* | Device | Automation |  This custom field stores the information of the printers fetched using the [Script - Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412). |
| [cPVAL Get Printer Details](/docs/0009fe9a-7fce-4edd-8a4f-b202704dc6bf)  | *(blank)* | - | Device | Automation | elect the options at `Organization`, `Location` or `Device` level to enable or disable auditing of printer details on endpoints. |

### Automations

| Name | Function |
| :--- | :--- |
| [Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412) | Collects detailed printer information from the local machine and stores it to the [Custom field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f) in the tabular format. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from [cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f). |

### Create the Compound Conditions:

| Name | Function |
| :--- | :--- |
| [Get Printer Details - Workstations](/docs/350c2f3e-7c5e-497d-a397-99465e65afe0) | This compound condition is built to deploy the Printer auditing on the Windows workstations where the custom field is set to 'Windows' or 'Windows Workstation'. |
| [Get Printer Details - Server](/docs/980413bc-e97a-4d6b-92d5-fe19fa69422c) | This compound condition is built to deploy the Printer auditing on the Windows servers where the custom field is set to 'Windows' or 'Windows Server'. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Get Printer Details](/docs/26e34f79-5800-4279-b22d-268de2b596ac) | The report shows the active printers detail of the endpoint. Use  this report to find the number of active printers of the agent. The [Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412) automation collects the data on each Windows device. |

---

## Implementation

### Step 1: Create the Custom Fields

- [Custom field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f)
- 
- [Custom field - cPVAL Get Printer Details](/docs/0009fe9a-7fce-4edd-8a4f-b202704dc6bf)

### Step 2: Create the Automation

- [Script - Get Printer Details](/docs/b97ba03c-ce1a-4337-a42b-d07dabc59412)
  
### Step 3: Create the Compound Condition

- [Compound Condition - Get Printer Details - Server](/docs/980413bc-e97a-4d6b-92d5-fe19fa69422c)

- [Compound Condition - Get Printer Details - Workstation](/docs/350c2f3e-7c5e-497d-a397-99465e65afe0)

### Step 4: Schedule the data collection

- Enable the compound conditions to run every 24 hours

### Step 5 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the [Custom field - cPVAL Printer Details](/docs/4d6e483c-28b6-43ed-a83e-9f503166de5f).

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation against **one** device, such as a server that is always online. Run it after the sync status collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit - Get Printer Details](/docs/26e34f79-5800-4279-b22d-268de2b596ac)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Changelog

### 2026-10-13

- Initial version of the document

### 2026-10-20

- Addition of Knowledge Article and CSV file that contains Global and Organization level report.
- Audit report creation and Solution modification