---
id: '8a8440f2-4451-4aa5-ada1-1187a22b26a4'
slug: /8a8440f2-4451-4aa5-ada1-1187a22b26a4
title: 'Get Dell Dockstation'
title_meta: 'Get Dell Dockstation'
keywords: ['dock', 'dell', 'station']
description: 'This solution is build to perform the Dell Dockstation auditing.'
tags: ['dell', 'windows', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Purpose

This solution is build to perform the Dell Dockstation auditing.

## How It Works

1. **Collect**: The [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4) automation runs on Dell Machines. It uses the Dell Command tool to scan the Dell Dockstation details, and stores the result in [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2).

---

## Associated Content

### Custom Fields

| Name | Default | Example | Level | Managed By | Function |
| :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2) | *(blank)* | *HTML table* | Device | Automation | This custom field stores the information of the Dell dockstation fetched by the script [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4).  |

### Automations

| Name | Function |
| :--- | :--- |
| [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4) | This script collects the Dell dock station information and stores it in the custom field "cpvalDellDockDetails" of type WYSIWYG in the tabular format. |
| [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) | Optional. Builds the Knowledge Base articles and CSV files from [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2). |

### Groups

| Name | Function |
| :--- | :--- |
| [cPVAL Dell Machine](/docs/8247029e-d5d4-457f-9b0c-1df23ccadf66) | This group contains the Dell machines. |

### Tasks

| Name | Function |
| :--- | :--- |
|[Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd) | This task will run the Dell Dockstation auditing based on the repeating schedule (Recommended weekly). |

### Audit Reports

| Name | Function |
| :--- | :--- |
| [Get Dell DockStation Details](/docs/1c104082-db0d-4bd8-a51c-58fda218febb) | This knowledge article is build to derive the Dell Dock Stations report of all Dell machines. |

---

## Implementation

### Step 1: Create the Custom Field

- [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2)

### Step 2: Create the Automation

- [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4)

### Step 3: Create the Group

- [cPVAL Dell Machine](/docs/8247029e-d5d4-457f-9b0c-1df23ccadf66)

### Step 4: Create the Task

- Create the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd)

### Step 5: Schedule the Data Collection

Schedule the task to run **weekly** (recommended) against the [cPVAL Dell Machine](/docs/8247029e-d5d4-457f-9b0c-1df23ccadf66) group.

### Step 5 (Optional): Set Up the Reports

Skip this step if the partner does not need reports. The data is still collected and kept on each device in the custom fields.

1. **API application and credentials:** Create the NinjaOne API application and fill the [cPVAL Ninja API Client ID](/docs/32142af2-d352-4d0d-9ec3-9dae0a5fef88) and [cPVAL Ninja API Client Secret](/docs/58b01634-4e1a-4793-aafd-18526ea8c80e) fields, as described in [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687). If they are already set up for another ProVal reporting solution, reuse them.
2. **Report automation:** Create the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation.
3. **Schedule:** Schedule the report automation against **one** device, such as a server that is always online. Run it after the sync status collection. Use the values listed in the **Report Settings** section of the Audit Report:
   * [Audit Report: Get Dell DockStation Details](/docs/1c104082-db0d-4bd8-a51c-58fda218febb)

:::note  
Knowledge Base articles need the **NinjaOne Documentation** app. Without it, set **Report Output** to **Local CSV Files** to create only the CSV files on the device that runs the report.  
:::

---

## FAQ

- Can we schedule the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd) and the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) at same time?

No scheduling both at same time is not recommended.
Assume you are scheduling the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd) at 10:30 AM EST every Monday, then schedule the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) at 10:00 PM every Monday to collect all the data from the WYSIWYG custom field into one report.

## Changelog

### 2026-10-12

- Initial version of the document

### 2026-10-20

- Addition of the Knowledge article audit report