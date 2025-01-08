---
id: 'cwa-windows-server-backup-data'
title: 'Windows Server Backup Data Storage'
title_meta: 'Windows Server Backup Data Storage'
keywords: ['windows', 'backup', 'server', 'data', 'storage', 'audit']
description: 'This document provides an overview of the structure and dependencies of the Windows Server Backup data storage table, detailing the various columns and their explanations for effective backup management.'
tags: ['backup', 'windows', 'database', 'configuration', 'security']
draft: false
unlisted: false
---
## Purpose

The table is built to store the complete Windows Server Backup data

## Dependencies

[Windows Server Backup Audit](https://proval.itglue.com/DOC-5078775-12941262)

## Tables

#### plugin_proval_windows_server_backup

| Column                                     | Type     | Explanation                                                                                           |
|--------------------------------------------|----------|-------------------------------------------------------------------------------------------------------|
| computerid                                 | INT      | Computerid of the agent                                                                               |
| Next Backup Time                           | DATETIME | Next backup runtime                                                                                    |
| Last Successful Backup Time                | DATETIME | Last successful backup time                                                                            |
| Last Backup Time                           | DATETIME | Last backup runtime                                                                                    |
| Last Backup Status                         | VARCHAR  | Last backup health                                                                                     |
| Last Backup Target                         | VARCHAR  | Destination path where last backup stored                                                             |
| Backup Operation Status During ScriptRan   | VARCHAR  | This shows whether the backup is in progress or completed                                              |
| Backup Start Date                          | DATETIME | Backup schedule date                                                                                   |
| Volumes To Backup                          | VARCHAR  | Volume which is backing up                                                                             |
| Files to Backup                            | VARCHAR  | Files which is backing up                                                                              |
| Exclude Files From Backup                  | VARCHAR  | Files which is excluded from backing                                                                   |
| Components to Backup                       | VARCHAR  | Components which is backing up                                                                          |
| Bare Metal Recovery                        | VARHAR   | It stands for a complete system restore, including the operating system and all system-specific configurations |
| SystemState Backup                         | VARCHAR  | It contains the critical system components, including the registry, Active Directory, and system files required for system recovery |
| Overwrite Old Format VHD                   | VARCHAR  | If enabled the old VHD files will be overwritten during subsequent backups                             |
| ScriptRanDate                              | DATETIME | Script last run time                                                                                   |


