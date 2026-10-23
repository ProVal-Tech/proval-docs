---
id: 'b4d40cab-a530-45d5-b4db-337b87003868'
slug: /b4d40cab-a530-45d5-b4db-337b87003868
title: 'Memory Summary Report'
title_meta: 'Memory Summary Report'
keywords: ['memory', 'RAM', 'memory-summary', 'knowledge-base-report']
description: 'Reports installed memory, slot usage, maximum supported RAM capacity, and potential memory upgrade options for Windows devices.'
tags: ['memory', 'RAM', 'hardware', 'auditing', 'report', 'knowledge-base']
draft: true
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

Provides a consolidated summary of memory inventory for Windows servers and workstations, including installed RAM, memory slot usage, maximum supported capacity, and potential upgrade options. Use this report to review device memory capacity and support hardware refresh planning. The [Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76) automation collects the data and stores the summary in the `cPVAL Memory Summary` custom field.

## Requirements

:::note
The Knowledge Base articles need the **NinjaOne Documentation** app enabled in NinjaOne, as shown below. If your NinjaOne does not have it, set **Report Output** to **Local CSV Files** in the report automation. The report then creates only the CSV files, on the device that runs it.
:::

![NinjaOne Documentation app enabled](../../../static/img/docs/e9f703e4-a9cc-4bf2-9272-b26f41a16294/ninjaone-documentation-enabled.webp)

## Where to Find the Report

| Report | Knowledge Base Article | CSV File |
| ------ | ---------------------- | -------- |
| Global | **Global Knowledge Base** > `Dataviews` > `Memory details` > `Memory Summary Report` | `C:\ProgramData\_Automation\Report\Memory details\Get Detailed Memory details.csv` |
| Organization | **Organization Knowledge Base** > `Dataviews` > `Memory details` > `Memory Summary Report` | `C:\ProgramData\_Automation\Report\Memory details\Organization_Level_Reports\Get Detailed Memory details_<Organization>.csv` |

:::note
The articles and CSV files are replaced every time the report runs. CSV files are saved on the device that runs the report automation. An article that grows too large is split into `- Part 1`, `- Part 2` and so on.
:::

## Report Columns

| Column Name | Appears In | Description |
| ----------- | ---------- | ----------- |
| Organization | Global only | The organization the device belongs to. |
| Location | Both | The location assigned to the device. |
| Device | Both | The device name. |
| LastContact | Both | The last contact time reported by NinjaOne. |
| LastUser | Both | The last user associated with the device, as reported by NinjaOne. |
| DeviceType | Both | The device type reported by NinjaOne. |
| OS | Both | The operating system installed on the device. |
| OSBuild | Both | The operating system build number. |
| Manufacturer | Both | The device manufacturer. |
| Model | Both | The device model. |
| Memory Summary | Both | Consolidated memory information, including installed RAM, slot usage, maximum supported capacity, and potential upgrade options. |

## Report Settings

Values used in the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation to build this report.

| Script Variable | Value |
| --------------- | ----- |
| Report Output | Knowledge Base Articles and Local CSV Files |
| Custom Field Name | `cpvalMemorySummary` |
| Report Scope | All Organizations and Global |
| Organization Names | All organizations |
| Organization KB Article Name | Memory Summary Report |
| Organization KB Folder Name | Dataviews/Memory details |
| Organization Additional Columns | Location, Device, LastContact, LastUser, DeviceType, OS, OSBuild, Manufacturer, Model |
| Organization Exclude Columns | Leave Blank |
| Global KB Article Name | Memory Summary Report |
| Global KB Folder Name | Dataviews/Memory details |
| Global Additional Columns | Location, Device, LastContact, LastUser, DeviceType, OS, OSBuild, Manufacturer, Model |
| Global Exclude Columns | Leave Blank |
| Local Folder Name | Memory details |
| Local File Name | Get Detailed Memory details |
| Filter | Leave Blank |
| Device Category | All |
| Multipart | `True` |
| Instance URL | The NinjaOne instance of the partner, for example `us2.ninjarmm.com` |

![Report Settings](../../../static/img/docs/New GUID/image4.webp)

## Dependencies

- [Automation: WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687)
- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Custom Field: cPVAL Memory Summary](/docs/ca470e3b-6664-46ed-b2f8-31e281db0e2f)
- [Solution: Get Detailed Memory Information - NinjaOne](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)

## Global Article Sample Screenshot

![Global Article](../../../static/img/docs/New GUID/image1.webp)

## Organization Article Sample Screenshot

![Organization Article](../../../static/img/docs/New GUID/image2.webp)

## CSV Folder Sample Screenshot

The global CSV file, and the `Organization_Level_Reports` folder with one CSV file per organization.

![CSV Folder](../../../static/img/docs/New GUID/image3.webp)

## Changelog

### 2026-10-23

- Initial version of the document.
