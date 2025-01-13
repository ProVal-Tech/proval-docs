---
id: 'cwa-hyperv-disk-space-record'
title: 'Hyper-V Disk Space Record'
title_meta: 'Hyper-V Disk Space Record'
keywords: ['hyper-v', 'disk', 'space', 'record', 'drive', 'data']
description: 'This document outlines the structure and purpose of the Hyper-V Disk Space Record table, which stores data related to the drives of Hyper-V machines at various schedules. It details the dependencies and the specific columns of the table, including their types and explanations.'
tags: ['database', 'disk-encryption', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This table stores the drive's data of the Hyper-Vs at different schedules of the script [Hyper-V Disk Space Record](https://proval.itglue.com/DOC-5078775-13294755).

## Dependencies

[Hyper-V Disk Space Record](https://proval.itglue.com/DOC-5078775-13294757)

## Tables

#### pvl_disk_record

| Column        | Type     | Explanation                                      |
|---------------|----------|--------------------------------------------------|
| ComputerID    | INT      | Computerid of the agent in RMM                  |
| DriveID       | INT      | DriveID of the drives                            |
| Volume        | VARCHAR  | Drive volume letter                              |
| Total Size    | INT      | Total size of the volume                         |
| Free Size     | INT      | Available free size of the volume                |
| FileSystem    | VARCHAR  | File System of the drive ex: NTFS               |
| Model         | VARCHAR  | Model of the drive                               |
| Missing       | TINYINT  | Drive status whether detected in Automate or not |
| Internal      | TINYINT  | Drive checks whether internal or external/removable |
| SSD           | TINYINT  | Disk checks whether SSD or not                   |




