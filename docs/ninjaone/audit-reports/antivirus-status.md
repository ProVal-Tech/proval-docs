---
id: '460013c8-7bb9-4773-ac6b-a03689575e79'
slug: /460013c8-7bb9-4773-ac6b-a03689575e79
title: 'Antivirus Status'
title_meta: 'Antivirus Status'
keywords: ['antivirus', 'antivirus-status', 'definition-status', 'knowledge-base-report']
description: 'Lists the antivirus products NinjaOne reports on each Windows and Mac device, with their definition status and state.'
tags: ['antivirus', 'auditing', 'security', 'report', 'knowledge-base']
draft: false
unlisted: false
last_update:
  date: 2026-10-14
---

## Summary

Lists the antivirus products on each Windows and Mac device, with their definition status and whether they are switched on. Use it to find antivirus that is switched off or has outdated definitions. Devices without antivirus are listed in the [Antivirus Missing](/docs/08cc8eb4-7a6f-4a17-a34e-218e5ff5e547) report instead. The [Antivirus Status Audit](/docs/3724a85b-929e-4f55-9b3a-bd13a21e1d05) automation collects the data from NinjaOne.

## Requirements

:::note  
The Knowledge Base articles need the **NinjaOne Documentation** app enabled in NinjaOne, as shown below. If your NinjaOne does not have it, set **Report Output** to **Local CSV Files** in the report automation. The report then creates only the CSV files, on the device that runs it.  
:::

![NinjaOne Documentation app enabled](../../../static/img/docs/e9f703e4-a9cc-4bf2-9272-b26f41a16294/ninjaone-documentation-enabled.webp)

## Where to Find the Report

| Report | Knowledge Base Article | CSV File |
| ------ | ---------------------- | -------- |
| Global | **Global Knowledge Base** > `Dataviews` > `Antivirus` > `Antivirus Status` | `C:\ProgramData\_Automation\Report\Antivirus\Antivirus Status.csv` |
| Organization | **Organization Knowledge Base** > `Dataviews` > `Antivirus` > `Antivirus Status` | `C:\ProgramData\_Automation\Report\Antivirus\Organization_Level_Reports\Antivirus Status_<Organization>.csv` |

:::note  
The articles and CSV files are replaced every time the report runs. CSV files are saved on the device that runs the report automation. An article that grows too large is split into `- Part 1`, `- Part 2` and so on. Only devices with antivirus are listed. A device with two antivirus products has two rows.  
:::

## Report Columns

| Column Name | Appears In | Description |
| ----------- | ---------- | ----------- |
| Organization | Global only | The organization the device belongs to. |
| Location | Both | The location the device belongs to. |
| Device | Both | The device name. |
| OS | Both | The operating system of the device. |
| DeviceType | Both | The device type: `Physical Server`, `Virtual Server`, `Laptop`, `Desktop` or `Virtual Workstation`. |
| LastContact | Both | When the device last checked in with NinjaOne. |
| AV Name | Both | The antivirus product, for example `Microsoft Defender Antivirus`. |
| Definition Status | Both | Whether the virus definitions are current, for example `Up-to-Date`. |
| Product State | Both | Whether the antivirus is switched on: `ON` or `OFF`. |
| Is Installed | Both | Always `Yes` in this report. |
| DataCollectionDate | Both | When NinjaOne collected the antivirus information. Blank when NinjaOne has none for the device. |

## Report Settings

Values used in the [WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687) automation to build this report.

| Script Variable | Value |
| --------------- | ----- |
| Report Output | Knowledge Base Articles and Local CSV Files |
| Custom Field Name | `cpvalAntivirusStatus` |
| Report Scope | All Organizations and Global |
| Organization KB Article Name | Antivirus Status |
| Organization KB Folder Name | Dataviews/Antivirus |
| Organization Additional Columns | Location, Device, OS, DeviceType, LastContact |
| Global KB Article Name | Antivirus Status |
| Global KB Folder Name | Dataviews/Antivirus |
| Global Additional Columns | Organization, Location, Device, OS, DeviceType, LastContact |
| Local Folder Name | Antivirus |
| Local File Name | Antivirus Status |
| Filter | `[Is Installed] equals Yes` |
| Device Category | All |
| Multipart | True |
| Instance Url | The NinjaOne instance of the partner, for example `us2.ninjarmm.com` |

![Report Settings](../../../static/img/docs/460013c8-7bb9-4773-ac6b-a03689575e79/image4.webp)

## Dependencies

* [Automation: WYSIWYG Custom Field Report - Organization and Global KB](/docs/67df14cd-3c20-4a40-bb7a-80caae242687)
* [Automation: Antivirus Status Audit](/docs/3724a85b-929e-4f55-9b3a-bd13a21e1d05)
* [Custom Field: cPVAL Antivirus Status](/docs/20cf7c66-038f-4e83-857e-4c68ac5de358)
* [Solution: Antivirus Status Audit](/docs/d613b809-a8cf-4dde-b3fa-e36b13223eeb)

## Global Article Sample Screenshot

![Global Article](../../../static/img/docs/460013c8-7bb9-4773-ac6b-a03689575e79/image1.webp)

## Organization Article Sample Screenshot

![Organization Article](../../../static/img/docs/460013c8-7bb9-4773-ac6b-a03689575e79/image2.webp)

## CSV Folder Sample Screenshot

The global CSV file, and the `Organization_Level_Reports` folder with one CSV file per organization.

![CSV Folder](../../../static/img/docs/460013c8-7bb9-4773-ac6b-a03689575e79/image3.webp)

## Changelog

### 2026-10-14

- Initial version of the document
