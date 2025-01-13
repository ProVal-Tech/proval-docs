---
id: 'cwa-hyper-v-disk-report'
title: 'Hyper-V Disk Report'
title_meta: 'Hyper-V Disk Report'
keywords: ['hyper-v', 'disk', 'report', 'client', 'location', 'computer', 'os', 'lastcontact', 'volume', 'size', 'filesystem', 'model', 'status', 'internal', 'ssd']
description: 'This document provides a detailed report of the Hyper-V disk records from the custom table pvl_disk_record, including information on client names, locations, computer names, operating systems, and various disk attributes such as total size, free size, and status.'
tags: ['hyper-v', 'disk', 'report', 'client', 'location', 'computer', 'os', 'size', 'filesystem', 'model', 'status', 'internal', 'ssd']
draft: false
unlisted: false
---
## Summary

This dataview shows the report of the Hyper-Vs disk record from the custom table [pvl_disk_record](https://proval.itglue.com/DOC-5078775-13294756).

## Dependencies

- [pvl_disk_record](https://proval.itglue.com/DOC-5078775-13294756) 
- [Hyper-V Disk Space Record](https://proval.itglue.com/DOC-5078775-13294757) 

## Columns

| Column           | Description                                             |
|------------------|---------------------------------------------------------|
| Client Name      | Client Name of the agent                                |
| Location Name    | Location Name of the agent                              |
| Computer Name    | Name of the agent                                      |
| Operating System  | Operating system name of the agent                      |
| LastContact      | Last contact of agent with RMM                          |
| Volume           | Assigned letter of the drives                           |
| Total Size       | Total size of the drive                                 |
| Free Size        | Available free space of the drive                       |
| FileSystem       | File System of the drive ex: NTFS                       |
| Model            | Model of the drive                                      |
| Missing          | Drive status whether detected in Automate or not        |
| Internal         | Drive check whether internal or external/removable      |
| SSD              | Disk check whether SSD or not                           |



