---
id: '89182385-f98c-4e8b-ab62-1df0c73bbb1c'
slug: /89182385-f98c-4e8b-ab62-1df0c73bbb1c
title: 'pvl_crystal_disk_info'
title_meta: 'pvl_crystal_disk_info'
keywords: ['disk', 'info', 'report', 'database', 'structure']
description: 'This document outlines the structure of the table that stores information returned by the Crystal Disk Info Report script, including its columns, data types, and explanations for each field.'
tags: ['database', 'disk', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

The table stores the information returned by the [EPM - Disk - Script - Crystal Disk Info Report](<../scripts/Crystal Disk Info Report.md>) script.

## Dependencies

[EPM - Disk - Script - Crystal Disk Info Report](<../scripts/Crystal Disk Info Report.md>)

## Tables

#### pvl_crystal_disk_info

| Column               | Type        | Explanation                                                         |
|----------------------|-------------|---------------------------------------------------------------------|
| computerid           | int(11)    | Computer ID                                                         |
| ID                   | tinyint(4) | ID of the disk returned by the Crystal Disk Info Tool               |
| Model                | varchar(128)| Model of the disk                                                   |
| Firmware             | varchar(64) | Firmware of the disk                                               |
| Serial Number        | varchar(64) | Serial Number of the disk                                          |
| Disk Size            | varchar(32) | Size of the Disk                                                   |
| Buffer Size          | varchar(32) | Buffer Size of the Disk returned by the Crystal Disk Info Tool     |
| Queue Depth          | int(11)    | Queue Depth of the Disk returned by the Crystal Disk Info Tool     |
| # of Sectors         | varchar(64) | Number of Sectors on the Disk returned by the Crystal Disk Info Tool|
| Rotation Rate        | varchar(64) | Rotation Rate of the Disk returned by the Crystal Disk Info Tool   |
| Interface            | varchar(64) | Interface of the Disk                                              |
| Major Version        | varchar(64) | Major Version of the Interface                                     |
| Minor Version        | varchar(64) | Minor Version of the Interface                                     |
| Transfer Mode        | varchar(64) | Transfer Mode(s) of the disk returned by the Crystal Disk Info Tool|
| Power On Hours       | varchar(64) | Power On Hours                                                    |
| Power On Count       | varchar(64) | Power On Counts                                                   |
| Host Reads           | varchar(64) | Host Reads                                                        |
| Host Writes          | varchar(64) | Host Writes                                                       |
| Wear Level Count     | varchar(64) | Wear Level Count                                                  |
| Temperature          | varchar(64) | Disk Temperature                                                  |
| Health Status        | varchar(64) | Health Status of the Disk                                         |
| Health Percentage     | varchar(8)  | Health Percentage of the Disk                                     |
| Features             | varchar(128)| Features of the Disk                                              |
| APM Level            | varchar(64) | APM Level                                                        |
| AAM Level            | varchar(64) | AAM Level                                                        |
| Drive Letter         | varchar(64) | Drive(s) on Disk                                                 |
| Script Run Time      | datetime    | Data Collection Time                                              |



