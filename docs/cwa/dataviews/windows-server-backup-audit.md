---
id: '070f3e8b-1365-4347-9fcb-43aad1d09d41'
slug: /070f3e8b-1365-4347-9fcb-43aad1d09d41
title: 'Windows Server Backup Audit'
title_meta: 'Windows Server Backup Audit'
keywords: ['windows', 'backup', 'report', 'sql', 'audit', 'performance']
description: 'This document provides a detailed overview of the Windows Server Backup report, showcasing how backups are performed on a scheduled basis. It includes dependencies, column descriptions, and SQL representation for querying backup status and details.'
tags: ['backup', 'performance', 'report', 'sql', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview shows the complete Windows Server Backup report and is useful for demonstrating how the Windows Server Backup operates on a scheduled basis.

## Dependencies

- [plugin_proval_windows_server_backup](/docs/02ccf50f-d283-43a0-9130-1b3e23b56180)
- [Windows Server Backup Audit](/docs/070f3e8b-1365-4347-9fcb-43aad1d09d41)
- [Windows Server Backup](/docs/5cd09bd8-bf3c-431a-8ee6-e56bff349e50)

## Columns

| Column                                      | Description                                                         |
|---------------------------------------------|---------------------------------------------------------------------|
| Client Name                                 | Client name of the agent                                           |
| Location Name                               | Location name of the agent                                         |
| Computer Name                               | Name of the agent                                                 |
| Operating System                            | Operating system name of the agent                                 |
| Last Contact                                | Last contact of the agent with the RMM                            |
| Next Backup Time                            | Next backup runtime                                               |
| Last Successful Backup Time                 | Last successful backup time                                       |
| Last Backup Time                            | Last backup runtime                                               |
| Last Backup Status                          | Last backup health                                                |
| Last Backup Target                          | Destination path where the last backup is stored                  |
| Backup Operation Status During Script Ran   | Indicates whether the backup is in progress or completed          |
| Backup Start Date                           | Backup schedule date                                              |
| Volumes To Backup                           | Volumes that are being backed up                                   |
| Files to Backup                             | Files that are being backed up                                     |
| Exclude Files From Backup                   | Files that are excluded from backup                                |
| Components to Backup                        | Components that are being backed up                                 |
| Bare Metal Recovery                         | Refers to a complete system restore, including the operating system and all system-specific configurations |
| System State Backup                         | Contains critical system components, including the registry, Active Directory, and system files required for system recovery |
| Overwrite Old Format VHD                    | If enabled, old VHD files will be overwritten during subsequent backups |
| Script Ran Date                             | Last run time of the script                                       |

## SQL Representation

```sql
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.name AS `Client Name`, 
  l.name AS `Location Name`, 
  c.name AS `Computer Name`, 
  c.os AS `Operating System`, 
  c.LastContact, 
  CONCAT(
    ROUND(c.uptime / 60 / 24, 0), 
    ' Day(s)'
  ) AS `Agent Uptime`, 
  pw.`Next Backup Time`, 
  pw.`Last Successful Backup Time`, 
  pw.`Last Backup Time`, 
  CASE WHEN pw.`Last Backup Status` = 0 THEN 'Success' ELSE 'Failed' END AS `Last Backup Status`, 
  pw.`Last Backup Target`, 
  pw.`Backup Operation Status During ScriptRan`, 
  pw.`Backup Start Date` AS `Backup Scheduled Date`, 
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

