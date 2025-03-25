---
id: '0df580b1-4b36-4988-b192-574a001a7323'
slug: /0df580b1-4b36-4988-b192-574a001a7323
title: 'Crystal Disk Info'
title_meta: 'Crystal Disk Info'
keywords: ['disk', 'health', 'monitoring', 'crystal', 'info', 'windows']
description: 'This document outlines the process for monitoring the disk health of physical machines using the Crystal Disk Info tool. It includes prerequisites, implementation steps, and troubleshooting FAQs related to disk monitoring and reporting.'
tags: ['disk', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to monitor the disk health of physical machines using the [Crystal Disk Info tool](https://crystalmark.info/en/software/crystaldiskinfo/).

**Note:** If you installed the solution before **`2023-07-21`**, you will need to update it to the latest version and run the script once against any online physical Windows machine to create the system properties and configure them as needed. Refer to the [Script's](<../cwa/scripts/Crystal Disk Info Report.md>) document for more information on the system properties.

## Associated Content

| Content                                                                                 | Type                | Function                                                                                          |
|-----------------------------------------------------------------------------------------|---------------------|---------------------------------------------------------------------------------------------------|
| [Agnostic - Get-CrystalDiskInfo](<../powershell/Get-CrystalDiskInfo.md>)             | Agnostic Scripts     | Executes the tool on the end machine and returns the result into an object.                     |
| [Script - Crystal Disk Info Report](<../cwa/scripts/Crystal Disk Info Report.md>)   | Script               | Executes the agnostic script on the end machines and fetches the data into Automate. Also creates a ticket for computers with unhealthy disks. |
| [Custom Table - pvl_crystal_disk_info](<../cwa/tables/pvl_crystal_disk_info.md>)     | Custom Table        | Stores the data fetched by the script.                                                            |
| [Dataview - Crystal Disk Info Report](<../cwa/dataviews/Crystal Disk Info Report.md>) | Dataview            | Displays the data stored in the Custom Table.                                                   |
| [Internal Monitor - Execute Script - Crystal Disk Info Report](<../cwa/monitors/Execute Script - Crystal Disk Info Report.md>) | Internal Monitor     | Executes the script once per week against the supported Windows machines.                        |
| △ CUSTOM - Execute Script - Crystal Disk Info Report                                    | Alert Template      | Executes the script against the machines detected by the alert template.                        |

## Implementation

- Read all the associated/related documents carefully to fully understand the workings of the solution.
- **Before moving forward, remove all the contents related to the [EPM - Disk - Solution - Disk - Critical Data](<./Disk - Critical Data.md>) solution from the environment.**
- Import the [EPM - Disk - Script - Crystal Disk Info Report](<../cwa/scripts/Crystal Disk Info Report.md>) script.
- Execute the script against an online physical Windows machine with PowerShell v5 to create the [EPM - Disk - Custom Table - pvl_crystal_disk_info](<../cwa/tables/pvl_crystal_disk_info.md>) table.
- Execute the script "[MySQL - Permission - Set Custom Table Permissions](https://proval.itglue.com/5078775/docs/8056027)" (make sure this script is updated).
- Import the [EPM - Disk - Dataview - Crystal Disk Info Report](<../cwa/dataviews/Crystal Disk Info Report.md>) dataview.
- Ensure that the dataview is displaying the data for the computer you just executed the script on.
- Import the [EPM - Disk - Internal Monitor - Execute Script - Crystal Disk Info Report](<../cwa/monitors/Execute Script - Crystal Disk Info Report.md>) internal monitor.
- Create/import the `△ CUSTOM - Execute Script - Crystal Disk Info Report` alert template.
- Ensure that the template is executing the [EPM - Disk - Script - Crystal Disk Info Report](<../cwa/scripts/Crystal Disk Info Report.md>) script on failure.
- Set the monitor set to the concerned groups.
- Apply the alert template to the monitor set and ensure that the solution is working as desired.
- Set the required values for the system properties `Crystal_Disk_Info_Disable_Caution_Tickets` and `Crystal_Disk_Info_Disable_Tickets`. Refer to the [Script's](<../cwa/scripts/Crystal Disk Info Report.md>) document for more information on the system properties.

![Image](../../static/img/Crystal-Disk-Info/image_1.png)

## FAQ

**Q**: Why is the script not gathering any information for some servers, even when running the tool manually returns `Disk Not Found`?  
**A**: It's quite possible that the server's disk is not supported by the tool itself.

- `CrystalDiskInfo supports only IDE (Parallel ATA) and Serial ATA disks connected to an internal ATA controller (Chipset included).`
- `CrystalDiskInfo supports a part of USB-HDD.`
- `CrystalDiskInfo does not support RAID disks or IDE (Parallel ATA) and Serial ATA disks connected to an external ATA controller.`

Reference: [Crystal Disk Info FAQ](https://crystalmark.info/en/software/crystaldiskinfo/crystaldiskinfo-faq/)



