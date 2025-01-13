---
id: 'cwa-disk-info-report'
title: 'EPM - Disk - Script - Crystal Disk Info Report'
title_meta: 'EPM - Disk - Script - Crystal Disk Info Report'
keywords: ['disk', 'info', 'report', 'crystal', 'epm', 'data']
description: 'This document provides an overview of the EPM - Disk - Script - Crystal Disk Info Report, detailing the data displayed by the script, its dependencies, and the various columns that represent different properties of disks. The report is essential for understanding disk performance and health metrics.'
tags: ['disk', 'report', 'performance', 'health', 'data', 'configuration']
draft: false
unlisted: false
---
## Summary

Dataview displays the data grabbed by the [EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045) script. It's not necessary for all the disks to show value for all the columns/properties as different drive models can return slightly different properties/results.

## Dependencies

- [EPM - Disk - Script - Crystal Disk Info Report](https://proval.itglue.com/DOC-5078775-12960045)  
- [EPM - Disk - Custom Table - pvl_crystal_disk_info](https://proval.itglue.com/DOC-5078775-12960038)  

## Columns

| Column                   | Description                                                    |
|-------------------------|---------------------------------------------------------------|
| clientid                | Clientid (Hidden)                                           |
| locationid              | LocationID (Hidden)                                        |
| Computerid              | Computerid                                                 |
| Client                  | Client Name                                                |
| Location                | Location Name                                              |
| Computer                | Computer Name                                              |
| Operating System        | Operating System                                           |
| Last Logged In User     | Last Logged In User                                        |
| Last Contact            | Last Contact with RMM                                      |
| Disk ID                 | Disk ID                                                   |
| Disk Model              | Disk Model                                                |
| Disk Serial Number      | Serial Number of the disk                                  |
| Firmware                | Firmware of the disk                                      |
| Disk Size               | Size of the Disk                                          |
| Buffer Size             | Buffer Size of the Disk returned by the Crystal Disk Info Tool |
| Queue Depth             | Queue Depth of the Disk returned by the Crystal Disk Info Tool |
| Number of Sectors       | Number of Sectors on the Disk returned by the Crystal Disk Info Tool |
| Rotation Rate           | Rotation Rate of the Disk returned by the Crystal Disk Info Tool |
| Interface               | Interface of the Disk                                      |
| Major Version           | Major Version of the Interface                              |
| Minor Version           | Minor Version of the Interface                              |
| Transfer Mode           | Transfer Mode(s) of the disk returned by the Crystal Disk Info Tool |
| Power On Hours          | Power On Hours                                            |
| Power On Count          | Power On Count                                            |
| Host Reads              | Host Reads                                                |
| Host Writes             | Host Writes                                               |
| Wear Level Count        | Wear Level Count                                          |
| Temperature             | Disk Temperature                                          |
| Health_Status           | Health Status of the Disk                                  |
| Health Percentage       | Life left for the disk in percentage                       |
| Features                | Features of the Disk                                       |
| APM Level               | APM Level                                                 |
| AAM Level               | AAM Level                                                 |
| Drive Letter            | Drive(s) on the Disk                                      |
| Script Run Time         | Data Collection Time                                       |

## Sample Screenshot

![Sample Screenshot](..\..\..\static\img\Crystal-Disk-Info-Report\image_1.png)


