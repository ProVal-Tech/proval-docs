---
id: '02ccf50f-d283-43a0-9130-1b3e23b56180'
slug: /02ccf50f-d283-43a0-9130-1b3e23b56180
title: 'plugin_proval_windows_server_backup'
title_meta: 'plugin_proval_windows_server_backup'
keywords: ['windows', 'backup', 'server', 'data', 'storage', 'audit']
description: 'This document provides an overview of the structure and dependencies of the Windows Server Backup data storage table, detailing the various columns and their explanations for effective backup management.'
tags: ['backup', 'database', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The table is built to store the complete Windows Server Backup data.

## Dependencies

[Windows Server Backup Audit](<../dataviews/Windows Server Backup Audit.md>)

## Tables

#### plugin_proval_windows_server_backup

| Column                                     | Type     | Explanation                                                                                           |
|--------------------------------------------|----------|-------------------------------------------------------------------------------------------------------|
| computerid                                 | INT      | Computer ID of the agent                                                                              |
| Next Backup Time                           | DATETIME | Next backup runtime                                                                                    |
| Last Successful Backup Time                | DATETIME | Last successful backup time                                                                            |
| Last Backup Time                           | DATETIME | Last backup runtime                                                                                    |
| Last Backup Status                         | VARCHAR  | Last backup health                                                                                     |
| Last Backup Target                         | VARCHAR  | Destination path where the last backup is stored                                                      |
| Backup Operation Status During ScriptRan   | VARCHAR  | Indicates whether the backup is in progress or completed                                              |
| Backup Start Date                          | DATETIME | Backup schedule date                                                                                   |
| Volumes To Backup                          | VARCHAR  | Volumes that are being backed up                                                                       |
| Files to Backup                            | VARCHAR  | Files that are being backed up                                                                         |
| Exclude Files From Backup                  | VARCHAR  | Files that are excluded from backup                                                                    |
| Components to Backup                       | VARCHAR  | Components that are being backed up                                                                     |
| Bare Metal Recovery                        | VARCHAR  | Refers to a complete system restore, including the operating system and all system-specific configurations |
| SystemState Backup                         | VARCHAR  | Contains critical system components, including the registry, Active Directory, and system files required for recovery |
| Overwrite Old Format VHD                   | VARCHAR  | If enabled, the old VHD files will be overwritten during subsequent backups                           |
| ScriptRanDate                              | DATETIME | Script last run time                                                                                   |


