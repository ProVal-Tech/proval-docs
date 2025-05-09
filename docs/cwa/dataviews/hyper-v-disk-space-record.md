---
id: 'cc5a2747-6286-4783-b3f6-862aaa19a1c1'
slug: /cc5a2747-6286-4783-b3f6-862aaa19a1c1
title: 'Hyper-V Disk Space Record'
title_meta: 'Hyper-V Disk Space Record'
keywords: ['hyper-v', 'disk', 'report', 'client', 'location', 'computer', 'os', 'lastcontact', 'volume', 'size', 'filesystem', 'model', 'status', 'internal', 'ssd']
description: 'This document provides a detailed report of the Hyper-V disk records from the custom table pvl_disk_record, including information on client names, locations, computer names, operating systems, and various disk attributes such as total size, free size, and status.'
tags: ['disk', 'hyper-v', 'report']
draft: false
unlisted: false
---

## Summary

This dataview shows the report of the Hyper-V disk records from the custom table [pvl_disk_record](/docs/0b6f4746-2fac-46c7-bfb2-db23e734c9fc).

## Dependencies

- [pvl_disk_record](/docs/0b6f4746-2fac-46c7-bfb2-db23e734c9fc) 
- [Hyper-V Disk Space Record](/docs/cc5a2747-6286-4783-b3f6-862aaa19a1c1) 

## Columns

| Column            | Description                                             |
|-------------------|---------------------------------------------------------|
| Client Name       | Client name of the agent                                |
| Location Name     | Location name of the agent                              |
| Computer Name     | Name of the agent                                      |
| Operating System   | Operating system name of the agent                      |
| Last Contact      | Last contact of the agent with RMM                      |
| Volume            | Assigned letter of the drives                           |
| Total Size        | Total size of the drive                                 |
| Free Size         | Available free space of the drive                       |
| File System       | File system of the drive (e.g., NTFS)                  |
| Model             | Model of the drive                                      |
| Missing           | Drive status indicating whether detected in Automate or not |
| Internal          | Indicates whether the drive is internal or external/removable |
| SSD               | Indicates whether the disk is SSD or not                |

