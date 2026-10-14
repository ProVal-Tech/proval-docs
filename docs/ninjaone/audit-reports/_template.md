---
id: 'New GUID'
slug: /New GUID
title: 'Report Name'
title_meta: 'Report Name'
keywords: []
description: ''
tags: []
draft: true
unlisted: false
last_update:
  date: YYYY-MM-DD
---

## Summary

One to three sentences: what the report shows, who it helps, and which automation collects the data.

## Requirements

:::note  
The Knowledge Base articles need the **NinjaOne Documentation** app enabled in NinjaOne, as shown below. If your NinjaOne does not have it, set **Report Output** to **Local CSV Files** in the report automation. The report then creates only the CSV files, on the device that runs it.  
:::

![NinjaOne Documentation app enabled](../../../static/img/docs/e9f703e4-a9cc-4bf2-9272-b26f41a16294/ninjaone-documentation-enabled.webp)

## Where to Find the Report

| Report | Knowledge Base Article | CSV File |
| ------ | ---------------------- | -------- |
| Global | **Global Knowledge Base** > `Folder` > `Subfolder` > `Article Name` | `C:\ProgramData\_Automation\Report\<Local Folder Name>\<Local File Name>.csv` |
| Organization | **Organization Knowledge Base** > `Folder` > `Subfolder` > `Article Name` | `C:\ProgramData\_Automation\Report\<Local Folder Name>\Organization_Level_Reports\<Local File Name>_<Organization>.csv` |

:::note  
The articles and CSV files are replaced every time the report runs. CSV files are saved on the device that runs the report automation. An article that grows too large is split into `- Part 1`, `- Part 2` and so on.  
:::

## Report Columns

| Column Name | Appears In | Description |
| ----------- | ---------- | ----------- |
| Organization | Global only | The organization the device belongs to. |
| ColumnName | Both | One-sentence description. |

## Report Settings

Values used in the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation to build this report.

| Script Variable | Value |
| --------------- | ----- |
| Report Output | |
| Custom Field Name | |
| Report Scope | |
| Organization KB Article Name | |
| Organization KB Folder Name | |
| Organization Additional Columns | |
| Organization Exclude Columns | |
| Global KB Article Name | |
| Global KB Folder Name | |
| Global Additional Columns | |
| Global Exclude Columns | |
| Local Folder Name | |
| Local File Name | |
| Filter | |
| Device Category | |
| Multipart | |
| Instance Url | |

![Report Settings](../../../static/img/docs/New GUID/image1.webp)

## Dependencies

* [Automation: WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687)
* [Automation: Name](/docs/GUID)
* [Custom Field: Name](/docs/GUID)
* [Solution: Name](/docs/GUID)

## Global Article Sample Screenshot

![Global Article](../../../static/img/docs/New GUID/image2.webp)

## Organization Article Sample Screenshot

![Organization Article](../../../static/img/docs/New GUID/image3.webp)

## CSV Folder Sample Screenshot

The global CSV file, and the `Organization_Level_Reports` folder with one CSV file per organization.

![CSV Folder](../../../static/img/docs/New GUID/image4.webp)

## Changelog

### YYYY-MM-DD

- Initial version of the document
