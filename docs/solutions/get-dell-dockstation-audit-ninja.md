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

## Associated Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2)     | Custom field | This custom field stores the information of the Dell dockstation fetched by the script Get-DellDockstation. |
| [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4)     | Script | This script collects the Dell dock station information and stores it in the custom field "cpvalDellDockDetails" of type WYSIWYG in the tabular format. |
| [cPVAL Dell Machine](/docs/8247029e-d5d4-457f-9b0c-1df23ccadf66)     | Group | This group contains the Dell machines. |
| [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd)     | Task | This task will run the Dell Dockstation auditing based on the repeating schedule (Recommended weekly). |

## Additional Content

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/)     | Script | It reads one WYSIWYG custom field from every device through the NinjaOne Public API, merges the table rows from all devices into a single table, adds device details such as the organization, location and last contact to each row, and publishes the result |

## Implementation

- Create the custom field [cPVAL Dell Dock Details](/docs/01834db6-0e3c-404f-addf-9375722853b2)
- Create the group [cPVAL Dell Machine](/docs/8247029e-d5d4-457f-9b0c-1df23ccadf66)
- Create the script [Get Dell Dockstation](/docs/bdf95bc2-1b42-4436-a2f8-f2aca13678c4)
- Create the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd)
- Once the task is schedule weekly, please schedule the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) to one computer (please ensure to ask from the partner an internal machine that doesn't go offline) to gather the data from WYSIWYG from all devices and create a single global or organization level report as a `Knowledge Base Articles and Local CSV Files`.
- Note: There are options to create `Knowledge Base Articles`, `Local CSV Files`, or `Knowledge Base Articles and Local CSV Files` with all the device WYSIWYG data output. Please proceed as per the requirement asked by the partner among those or both.
- Parameters to set in the script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/)

**Run as:** `System`
**Preset parameter:** ""
**Report Output:** `Knowledge Base Articles and Local CSV Files`
**Custom Field Name:** `cPVAL Dell Dock Details`
**Report Scope:** `All Organizations and Global`
**Organization Names:** ""
**Organization KB Article Name:** `Org - Dell Dockstation Audit`
**Organization Folder Name:** `Dell Dockstation`
**Organization Additional Columns:** `Location, Device, Domain, LastContact, DaysSinceLastContact, LastUser, DeviceType, OS, OSBuild, Manufacturer, Model`
**Organization Exclude Columns:** ""
**Global KB Article Name:** `Global - Dell Dockstation Audit` 
**Global KB Folder Name:** `Dell Dockstation`
**Global Additional Columns:** `Organization, Location, Device, Domain, LastContact, DaysSinceLastContact, LastUser, DeviceType, OS, OSBuild, Manufacturer, Model`
**Global Exclude Columns:** ""
**Local Folder Name:** `Dell Dockstation`
**Local File Name:** `Get - Dell Dockstation Report`
**Device Category:** `All`
**Group By:** ""
**Sort By:** ""
**Filter:** ""
**Multipart:** true
**Instance URL:** `us2.ninjarmm.com` ## Provide client ninja URL

## FAQ

- Can we schedule the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd) and the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) at same time?

No scheduling both at same time is not recommended.
Assume you are scheduling the task [Get Dell Dockstation](/docs/ec56fd5e-8062-4cce-8199-390e09eefddd) at 10:30 AM EST every Monday, then schedule the additional script [WYSIWYG Custom field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687/) at 10:00 PM every Monday to collect all the data from the WYSIWYG custom field into one report.

## Changelog

### 2026-10-12

- Initial version of the document