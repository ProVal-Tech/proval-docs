---
id: 'a1a0fea8-a255-45e3-98c6-1bbe094f5693'
slug: /a1a0fea8-a255-45e3-98c6-1bbe094f5693
title: 'SMB Share Permission Audit - NinjaOne'
title_meta: 'SMB Share Permission Audit - NinjaOne'
keywords: ['smb', 'share-permissions', 'windows', 'security-audit', 'access-control', 'report', 'custom-fields']
description: 'Audits SMB share permissions on Windows devices, stores the results in a NinjaOne custom field, and provides an organization-wide and global report for reviewing share access.'
tags: ['auditing', 'custom-fields', 'report', 'knowledge-base', 'smb']
draft: false
unlisted: false
last_update:
  date: 2026-10-21
---

## Purpose

The **SMB Share Permission Audit - NinjaOne** solution collects SMB share details and their access permissions from Windows devices. It records the share name, resource path, description, account name, access control type, and access rights, then stores the results in an HTML-formatted NinjaOne custom field.

Use this solution to review SMB share access across Windows devices, identify which users and groups have access to shared resources, and generate organization-level or global audit reports for security reviews.

## How It Works

1. **Collect:** The [SMB Share Permissions Audit [Windows]](/docs/1e4a0ce1-e3a0-47b1-8574-4be31b24bc2a) automation collects SMB share details and permissions and stores the results in the [cPVAL SMB Share Details](/docs/751a00ed-8de0-4146-8722-75629788411b) custom field.
2. **Determine Applicability:** The server and workstation compound conditions determine whether the automation should run on the applicable Windows devices.
3. **Report:** The [SMB Share Permission Audit](/docs/bc81efc9-c4f1-4943-8139-a6a2682fc7e4) audit report presents SMB share permission data for reviewing devices and organizations.

## Key Capabilities

- **SMB Share Inventory:** Collects SMB share names, resource paths, and descriptions.
- **Permission Details:** Records the account name, Allow/Deny access control type, and access right, such as Read, Change, or Full.
- **HTML Custom Field:** Stores the collected data in an HTML table for readable presentation in NinjaOne.
- **Collection Timestamp:** Includes the data collection date and time to help identify when the information was gathered.
- **Server and Workstation Support:** Uses separate compound conditions for servers and workstations.
- **Audit Reporting:** Provides a report for reviewing SMB share permissions across organizations.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL SMB Folder Audit](/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29) | *Blank* | Configured value | Device | Compound Condition | Supports the compound condition used to determine whether the automation should run. |
| [cPVAL SMB Share Details](/docs/751a00ed-8de0-4146-8722-75629788411b) | *Blank* | HTML table | Device | Automation | Stores the collected SMB share details and permission entries in HTML format. |

### Automations

| Name | Function |
| :--- | :--- |
| [SMB Share Permissions Audit [Windows]](/docs/1e4a0ce1-e3a0-47b1-8574-4be31b24bc2a) | Collects SMB share details and permissions and writes the results to the custom field. |

### Compound Conditions

| Name | Function |
| :--- | :--- |
| [SMB Share Permission Audit - Servers](/docs/afae9276-7fce-4ed7-af87-c87589653234) | Determines whether the SMB share permission audit automation should run on applicable Windows servers. |
| [SMB Share Permission Audit - Workstations](/docs/728b7519-dd3f-4e98-9f24-32b981bc00b3) | Determines whether the SMB share permission audit automation should run on applicable Windows workstations. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [SMB Share Permission Audit](/docs/bc81efc9-c4f1-4943-8139-a6a2682fc7e4) | Presents collected SMB share permission details for audit and review across organizations. |

---

## Implementation

### Step 1: Create the Custom Fields

Create the following custom fields in NinjaOne:

- [cPVAL SMB Folder Audit](/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29)
- [cPVAL SMB Share Details](/docs/751a00ed-8de0-4146-8722-75629788411b)

Ensure the share details field supports WYSIWYG HTML content and that the automation has permission to read and update the required fields.

### Step 2: Create the Automation

Create the [SMB Share Permissions Audit [Windows]](/docs/1e4a0ce1-e3a0-47b1-8574-4be31b24bc2a) automation.

Configure **Run As** to `System` so the script can access SMB share information and update the NinjaOne custom field.

### Step 3: Configure the Compound Conditions

Create the following compound conditions:

- [SMB Share Permission Audit - Servers](/docs/afae9276-7fce-4ed7-af87-c87589653234)
- [SMB Share Permission Audit - Workstations](/docs/728b7519-dd3f-4e98-9f24-32b981bc00b3)

Configure the conditions according to the intended server and workstation deployment scope. Use them to determine where the audit automation should run.

### Step 4: Schedule the Automation

Schedule the automation against the applicable Windows server and workstation groups using the configured compound conditions.

Choose a collection frequency that meets the organization's audit requirements. Review the custom field after the first run to confirm that the share details and permissions are being collected correctly.

### Step 5: Configure the Audit Report

Create the [SMB Share Permission Audit](/docs/bc81efc9-c4f1-4943-8139-a6a2682fc7e4) report and configure its settings as documented in the audit report configuration.

Review the report to inspect SMB share permissions across the required organizations. Run the report after data collection so it includes the latest available device data.

:::note
The automation reports a failure if no SMB shares are found, no SMB share permissions can be read, or the custom field cannot be updated. Verify the device's SMB share configuration and custom field permissions when troubleshooting a failure.
:::

---

## FAQ

### General Usage

**Q. What does this solution do?**

**A:** It collects SMB share details and permissions from Windows devices and stores them in a NinjaOne custom field for auditing and reporting.

**Q. What information does the automation collect?**

**A:** It collects the share name, resource path, description or remark, account name, access control type (Allow or Deny), access right, and data collection date.

**Q. Does the automation change SMB share permissions?**

**A:** No. The script reads SMB share and permission information. Its intended change is updating the NinjaOne custom field with the collected results.

**Q. Where are the results stored?**

**A:** The results are stored as an HTML table in the **cPVAL SMB Share Details** custom field on the device.

**Q. When does the automation report a failure?**

**A:** It reports a failure if it cannot read SMB shares, no shares are found, no share permission entries can be collected, or the custom field update fails.

### Reports

**Q. What is the audit report used for?**

**A:** The report provides a consolidated view of collected SMB share permission details for auditing and reviewing access across organizations.

**Q. How can I ensure the report contains current information?**

**A:** Run the report after the device-level collection automation so it can use the latest data available in the custom fields.

---

## Changelog

### 2026-10-21

- Initial version of the document.
