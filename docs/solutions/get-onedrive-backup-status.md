---
id: '67648c92-1636-419d-a541-e5a7f496fc85'
slug: /67648c92-1636-419d-a541-e5a7f496fc85
title: 'Get OneDrive Backup Status'
title_meta: 'Get OneDrive Backup Status'
keywords: ['onedrive', 'onedrive-backup', 'known-folder-move', 'report', 'knowledge-base']
description: 'Shows, for every user on each Windows workstation, whether Desktop, Documents and Pictures are backed up to OneDrive, and reports it across all clients.'
tags: ['onedrive', 'backup', 'auditing', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **Get OneDrive Backup Status** solution answers a simple question: *whose files would be lost if this device failed?*

For every user on each Windows workstation, it shows whether the Desktop, Documents and Pictures folders are backed up to OneDrive. Use it to find users who still keep their files only on the device.

## How It Works

1. **Collect:** The [Get OneDrive Backup Status](/docs/6d7374c8-a485-4748-89d9-02f913514ab9) automation runs daily on Windows workstations and stores the result in [cPVAL OneDrive Backup Status](/docs/ba25e98b-3fed-432b-96a5-147a5ac1f321).
2. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation runs on one device and turns that field into organization and global Knowledge Base articles and CSV files.

## Key Capabilities

* **Every User Profile:** Users do not need to be signed in.
* **Clear Results:** `True` or `False` for Desktop, Documents and Pictures, with the OneDrive folder path when backed up.
* **Unprotected Users Visible:** Users without OneDrive are listed too.
* **Cross-Client View:** Optional Knowledge Base articles and CSV files per organization and for all clients.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL OneDrive Backup Status](/docs/ba25e98b-3fed-432b-96a5-147a5ac1f321) | *(blank)* | *HTML table* | Device | Automation | Stores the OneDrive backup status of every user profile on the device. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Optional. Only needed for the reports. Identifies the API application the report automation signs in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Optional. Only needed for the reports. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [Get OneDrive Backup Status](/docs/6d7374c8-a485-4748-89d9-02f913514ab9) | Checks every user profile and stores the backup status in the custom field. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from the custom field. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [OneDrive Backup Status](/docs/a15225e6-a949-475d-9e26-8b527d9db505) | Lists the OneDrive backup status of every user, per organization and for all clients. |

---

## Implementation

### Step 1: Create the Custom Field

* [Custom Field: cPVAL OneDrive Backup Status](/docs/ba25e98b-3fed-432b-96a5-147a5ac1f321)

### Step 2: Create the Automation

* [Automation: Get OneDrive Backup Status](/docs/6d7374c8-a485-4748-89d9-02f913514ab9)

Set **Run as** to `System`.

### Step 3: Schedule the Data Collection

Schedule the automation to run **once per day** against the **Windows Workstations** group.

### Step 4 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom field.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online. Run it after the data collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: OneDrive Backup Status](/docs/a15225e6-a949-475d-9e26-8b527d9db505)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It checks whether each user's Desktop, Documents and Pictures folders are backed up to OneDrive, and refreshes the result every day.

**Q. What counts as backed up?**  
**A:** A folder counts as backed up when OneDrive manages it, which happens when OneDrive folder backup is turned on for that folder.

**Q. Do users need to be signed in?**  
**A:** No. The automation reads every user profile on the device.

**Q. Why is a user listed with every folder set to False?**  
**A:** That user has no OneDrive folder backup. Either OneDrive is not set up for them, or folder backup is turned off.

**Q. Does it change any OneDrive settings?**  
**A:** No. It only reads the current settings.

**Q. Why does the device need internet access?**  
**A:** The automation downloads the Strapper PowerShell module it uses to read every user profile.

### Reports

**Q. Do I need the reports?**  
**A:** No. They are optional. Without them, the data is still collected and kept on each device in its custom field.

**Q. What do I need for the Knowledge Base articles?**  
**A:** The **NinjaOne Documentation** app, an API application with its credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), and the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation. Without the Documentation app, the report can create CSV files only.

**Q. How current are the reports?**  
**A:** They show the data from the last collection on each device. The `DataCollectionDate` column shows when each device reported. Schedule the report after the data collection so it picks up the latest data.

**Q. Where are the CSV files saved?**  
**A:** On the device that runs the report automation, under `C:\ProgramData\_Automation\Report`. The exact path is listed in each Audit Report document.

---

## Changelog

### 2026-10-14

- Initial version of the document.
