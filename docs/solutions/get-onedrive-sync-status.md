---
id: '22d8abe0-2ea4-48e9-8b02-6108cd2de889'
slug: /22d8abe0-2ea4-48e9-8b02-6108cd2de889
title: 'Get OneDrive Sync Status'
title_meta: 'Get OneDrive Sync Status'
keywords: ['onedrive', 'sync', 'onedrive-quota', 'odsyncutil', 'report', 'knowledge-base']
description: 'Shows the OneDrive sync status and storage quota of the signed-in user on each Windows workstation, groups devices with sync problems, and reports the status across all clients.'
tags: ['onedrive', 'sync', 'auditing', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **Get OneDrive Sync Status** solution answers a question that usually comes up only after files are lost: *is OneDrive actually syncing for this user?*

It shows the OneDrive sync status and storage quota of the user signed in to each Windows workstation. Devices where OneDrive is not syncing, or where the user is not signed in to OneDrive, are collected in a group for follow-up. Use it to catch sync problems and full OneDrive storage before users notice.

## How It Works

1. **Collect:** The [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915) automation runs on Windows workstations. It uses the [ODSyncUtil](https://github.com/rodneyviana/ODSyncUtil/tree/master/ODSyncUtil) tool in the session of the signed-in user, silently, and stores the result in [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) and [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56).
2. **Group:** The [OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7) and [OneDrive Sync Audit](/docs/156a5913-4d5d-45ad-9cfc-313bb3b7a21d) groups use [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) to show which devices need attention.
3. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation runs on one device and turns [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) into organization and global Knowledge Base articles and CSV files.

## Key Capabilities

* **Sync Health per Account:** Shows the sync state of each OneDrive account, for example `UpToDate`, `Syncing` or `Error`.
* **Storage Quota:** Total and used OneDrive storage in GB, so nearly full accounts stand out.
* **Silent for the User:** The check runs in the background. The user sees no window.
* **Follow-Up Groups:** Devices with sync problems, or where the user is not signed in to OneDrive, are grouped automatically.
* **Cross-Client View:** Optional Knowledge Base articles and CSV files per organization and for all clients.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) | *(blank)* | *HTML table* | Device | Automation | Stores the OneDrive sync status and storage quota of the signed-in user. |
| [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) | *(blank)* | - | Device | Automation | Stores the OneDrive sync status for the audit groups. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Optional. Only needed for the reports. Identifies the API application the report automation signs in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Optional. Only needed for the reports. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915) | Retrieves the OneDrive sync status and storage quota of the signed-in user and stores them in the custom fields. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f). |

### Groups

| Name | Function |
| :--- | :--- |
| [OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7) | Includes devices where OneDrive is not syncing properly or the user is not signed in to OneDrive. |
| [OneDrive Sync Audit](/docs/156a5913-4d5d-45ad-9cfc-313bb3b7a21d) | Shows the sync status from [cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56) for every device, for OneDrive sync auditing. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [OneDrive Sync Status](/docs/497eb371-29a6-4049-b96d-6d19f3e5cb09) | Lists the OneDrive sync status and storage quota of every signed-in user, per organization and for all clients. |

---

## Implementation

### Step 1: Create the Custom Fields

* [Custom Field: cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f)
* [Custom Field: cPVAL OneDrive Sync Status Audit](/docs/cec3c5c0-10cc-4767-aea2-659f72b5bd56)

### Step 2: Create the Automation

* [Automation: Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915)

Set **Run as** to `System`.

### Step 3: Create the Groups

* [Group: OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7)
* [Group: OneDrive Sync Audit](/docs/156a5913-4d5d-45ad-9cfc-313bb3b7a21d)

### Step 4: Schedule the Data Collection

Schedule the automation to run **weekly** (recommended) against the **Windows Workstations** group, or the devices the client asks for. Schedule it at a time when users are usually signed in.

:::note  
The sync status table is only collected while a user is signed in and OneDrive is running. Otherwise the run ends with a warning and [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) keeps its last value.  
:::

### Step 5 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom fields.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation against **one** device, such as a server that is always online. Run it after the sync status collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: OneDrive Sync Status](/docs/497eb371-29a6-4049-b96d-6d19f3e5cb09)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It shows whether OneDrive is syncing for the user signed in to each Windows workstation, with the storage they use, and groups the devices that need attention.

**Q. Why does a user need to be signed in?**  
**A:** OneDrive only reports its sync status to the user who runs it. Without a signed-in user, there is no status to collect.

**Q. Does the user see anything when it runs?**  
**A:** No. The check runs silently in the background.

**Q. Does this capture the status when OneDrive is running but no account is signed in to it?**  
**A:** Yes. Those devices also appear in the [OneDrive Sync Failure Audit](/docs/301bd2d5-ba87-4bf2-ae1b-c1165c7347e7) group.

**Q. Which devices are included?**  
**A:** Windows workstations. Macs and Linux devices are not supported.

**Q. Why does a device show an old status?**  
**A:** The last run found no signed-in user or OneDrive was not running, so [cPVAL OneDrive Sync Status](/docs/03102a1f-7b86-4528-be18-c30333e6742f) kept its previous value. The `DataCollectionTime` column shows when the status was collected.

### Reports

**Q. Do I need the reports?**  
**A:** No. They are optional. Without them, the sync status is still collected and kept on each device in its custom fields.

**Q. What do I need for the Knowledge Base articles?**  
**A:** The **NinjaOne Documentation** app, an API application with its credentials in [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e), and the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation. Without the Documentation app, the report can create CSV files only.

**Q. How current are the reports?**  
**A:** They show the data from the last collection on each device. Schedule the report after the sync status collection so it picks up the latest data.

**Q. Where are the CSV files saved?**  
**A:** On the device that runs the report automation, under `C:\ProgramData\_Automation\Report\OneDrive`. The exact path is listed in the [OneDrive Sync Status](/docs/497eb371-29a6-4049-b96d-6d19f3e5cb09) Audit Report.

---

## Changelog

### 2026-10-14

- Rewrote the document in the current solution format.
- Added the optional [OneDrive Sync Status](/docs/497eb371-29a6-4049-b96d-6d19f3e5cb09) report, built by the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation, with the optional credential fields it needs.

### 2026-06-08

- Updated the [Get OneDrive Sync Status](/docs/29e62bb2-d641-472d-a92b-11404471b915) to update custom field "cPVAL OneDrive Sync Status Audit" if onedrive process is not running.
- Updated Group configuration to include the computers where OneDrive process is not running.

### 2026-04-08

- Initial version of the document
