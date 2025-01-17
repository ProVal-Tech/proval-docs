---
id: '070f3e8b-1365-4347-9fcb-43aad1d09d41'
title: 'Windows Server Backup Report'
title_meta: 'Windows Server Backup Report - Comprehensive Overview'
keywords: ['windows', 'backup', 'report', 'sql', 'audit', 'performance']
description: 'This document provides a detailed overview of the Windows Server Backup report, showcasing how backups are performed on a scheduled basis. It includes dependencies, column descriptions, and SQL representation for querying backup status and details.'
tags: ['backup', 'performance', 'report', 'sql', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview shows the complete Windows Server Backup report and it is useful to show how the Windows Server Backup is running on every schedule basis.

## Dependencies

- [plugin_proval_windows_server_backup](https://proval.itglue.com/DOC-5078775-12183969)
- [Windows Server Backup Audit](https://proval.itglue.com/DOC-5078775-12941262)
- [Windows Server Backup](https://proval.itglue.com/DOC-5078775-13083383)

## Columns

| Column                                      | Description                                                         |
|---------------------------------------------|---------------------------------------------------------------------|
| Client Name                                 | Client name of the agent                                           |
| Location Name                               | Location name of the agent                                         |
| Computer Name                               | Name of the agent                                                 |
| Operating System                            | Operating system name of the agent                                 |
| LastContact                                 | Last contact of the agent with the RMM                            |
| Next Backup Time                            | Next backup runtime                                               |
| Last Successful Backup Time                 | Last successful backup time                                       |
| Last Backup Time                            | Last backup runtime                                               |
| Last Backup Status                          | Last backup health                                                |
| Last Backup Target                          | Destination path where last backup stored                         |
| Backup Operation Status During ScriptRan    | This shows whether the backup is in progress or completed         |
| Backup Start Date                           | Backup schedule date                                              |
| Volumes To Backup                           | Volume which is backing up                                        |
| Files to Backup                             | Files which is backing up                                         |
| Exclude Files From Backup                   | Files which is excluded from backing                              |
| Components to Backup                        | Components which is backing up                                     |
| Bare Metal Recovery                         | It stands for a complete system restore, including the operating system and all system-specific configurations |
| SystemState Backup                          | It contains the critical system components, including the registry, Active Directory, and system files required for system recovery |
| Overwrite Old Format VHD                    | If enabled the old VHD files will be overwritten during subsequent backups |
| ScriptRanDate                               | Script last run time                                             |

## SQL Representation

```
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.name as `Client Name`, 
  l.name as `Location Name`, 
  c.name as `Computer Name`, 
  c.os as `Operating System`, 
  c.LastContact, 
  CONCAT(
    ROUND(c.uptime / 60 / 24, 0), 
    ' Day(s)'
  ) as `Agent Uptime`, 
  pw.`Next Backup Time`, 
  pw.`Last Successful Backup Time`, 
  pw.`Last Backup Time`, 
  case when pw.`Last Backup Status` = 0 then 'Success' ELSE 'Failed' END as `Last Backup Status`, 
  pw.`Last Backup Target`, 
  pw.`Backup Operation Status During ScriptRan`, 
  pw.`Backup Start Date` as `Backup Scheduled Date`, 
  pw.`Volumes To Backup`, 
  pw.`Files to Backup`, 
  pw.`Exclude Files From Backup`, 
  pw.`Components to Backup`, 
  pw.`Bare Metal Recovery`, 
  pw.`SystemState Backup`, 
  pw.`Overwrite Old Format VHD`, 
  pw.ScriptRanDate 
FROM 
  computers c 
  JOIN clients cl ON cl.clientid = c.clientid 
  JOIN locations l ON l.locationid = c.locationid 
  JOIN plugin_proval_windows_server_backup pw ON pw.computerid = c.computerid
```













