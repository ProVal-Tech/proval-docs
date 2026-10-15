---
id: '9d68f747-b433-4e36-a948-6290a7c30355'
slug: /9d68f747-b433-4e36-a948-6290a7c30355
title: 'All Drives Audit [Windows]'
title_meta: 'All Drives Audit [Windows]'
keywords: ['drives', 'disk-space', 'fragmentation', 'storage-audit', 'report', 'knowledge-base']
description: 'Lists every drive on every Windows device with its size, free space, fragmentation, file system and model, and reports them across all clients.'
tags: ['disk', 'diskspace', 'storage', 'auditing', 'report']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Purpose

The **All Drives Audit [Windows]** solution answers a common question: *which drives are running out of space?*

It lists every drive on every Windows device with its size, free space, free space percentage, fragmentation, file system and model. Use it to find full or badly fragmented drives before they cause problems.

## How It Works

1. **Collect:** The [All Drives Audit [Windows]](/docs/2551b645-2fe7-47d2-9c24-41c79c1f7c35) automation runs daily on every Windows device and stores the drive list in [cPVAL Drive Details](/docs/c376d026-50bf-4f65-8743-99a774719d92).
2. **Report (optional):** The [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation runs on one device and turns that field into organization and global Knowledge Base articles and CSV files.

## Key Capabilities

* **Every Drive:** Local, removable, optical and mapped network drives.
* **Readable Sizes:** Sizes shown in the most readable unit, from bytes to terabytes.
* **Free Space Percentage:** A numeric column you can sort or filter to find full drives.
* **Fragmentation Check:** Measured on local fixed drives. The check only reads the drive and never defragments it.
* **Cross-Client View:** Optional Knowledge Base articles and CSV files per organization and for all clients.

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Drive Details](/docs/c376d026-50bf-4f65-8743-99a774719d92) | *(blank)* | *HTML table* | Device | Automation | Stores every drive on the device with its details. |
| [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) | *(blank)* | `8GIo0Y646lsxWXj5HBO6RcUoKY7` | System | Manual | Optional. Only needed for the reports. Identifies the API application the report automation signs in as. |
| [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) | *(blank)* | `67h5w58GIo0Y646lsxWXj5...` | System | Manual | Optional. Only needed for the reports. Authenticates that API application. |

### Automations

| Name | Function |
| :--- | :--- |
| [All Drives Audit [Windows]](/docs/2551b645-2fe7-47d2-9c24-41c79c1f7c35) | Collects every drive on the device and stores them in the custom field. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from the custom field. |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [All Drives Audit [Windows]](/docs/67c68be0-7c35-473f-8479-459d0e9b9406) | Lists every drive of every client, per organization and for all clients. |

---

## Implementation

### Step 1: Create the Custom Field

* [Custom Field: cPVAL Drive Details](/docs/c376d026-50bf-4f65-8743-99a774719d92)

### Step 2: Create the Automation

* [Automation: All Drives Audit [Windows]](/docs/2551b645-2fe7-47d2-9c24-41c79c1f7c35)

Set **Run as** to `System`.

### Step 3: Schedule the Data Collection

Schedule the automation to run **once per day** against the **All Windows Devices** group.

### Step 4 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom field.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation to run once per day against **one** device, such as a server that is always online. Run it after the data collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: All Drives Audit [Windows]](/docs/67c68be0-7c35-473f-8479-459d0e9b9406)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## Comprehensive FAQs

### General Usage

**Q. What does this solution do?**  
**A:** It lists every drive on every Windows device with its size, free space, fragmentation, file system and model, and refreshes the list every day.

**Q. Does it defragment my drives?**  
**A:** No. It only measures fragmentation. It never changes the drive.

**Q. Why are the fragmentation columns blank for some drives?**  
**A:** Fragmentation is only measured on local fixed drives. It is also blank when Windows cannot analyze the drive, for example while a scheduled optimization is running.

**Q. How do I find drives that are nearly full?**  
**A:** Sort or filter on `DriveFreeSpacePercent`. The size columns use mixed units, so they do not sort numerically.

**Q. Why does a DVD drive show 0 B?**  
**A:** The drive has no disc in it.

**Q. Does it support Mac or Linux?**  
**A:** No. It supports Windows devices only.

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
