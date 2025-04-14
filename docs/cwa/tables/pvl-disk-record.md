---
id: '0b6f4746-2fac-46c7-bfb2-db23e734c9fc'
slug: /0b6f4746-2fac-46c7-bfb2-db23e734c9fc
title: 'pvl_disk_record'
title_meta: 'pvl_disk_record'
keywords: ['hyper-v', 'disk', 'space', 'record', 'drive', 'data']
description: 'This document outlines the structure and purpose of the Hyper-V Disk Space Record table, which stores data related to the drives of Hyper-V machines at various schedules. It details the dependencies and the specific columns of the table, including their types and explanations.'
tags: ['database', 'disk-encryption', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

This table stores the drive data of the Hyper-V machines at different schedules of the script [Hyper-V Disk Space Record](/docs/cc5a2747-6286-4783-b3f6-862aaa19a1c1).

## Dependencies

[Hyper-V Disk Space Record](/docs/cc5a2747-6286-4783-b3f6-862aaa19a1c1)

## Tables

#### pvl_disk_record

| Column        | Type     | Explanation                                      |
|---------------|----------|--------------------------------------------------|
| ComputerID    | INT      | Computer ID of the agent in RMM                  |
| DriveID       | INT      | Drive ID of the drives                            |
| Volume        | VARCHAR  | Drive volume letter                              |
| Total Size    | INT      | Total size of the volume                         |
| Free Size     | INT      | Available free size of the volume                |
| FileSystem    | VARCHAR  | File system of the drive (e.g., NTFS)           |
| Model         | VARCHAR  | Model of the drive                               |
| Missing       | TINYINT  | Drive status indicating whether detected in Automate or not |
| Internal      | TINYINT  | Indicates whether the drive is internal or external/removable |
| SSD           | TINYINT  | Indicates whether the disk is SSD or not        |


