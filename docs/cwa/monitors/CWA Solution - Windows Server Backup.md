---
id: '03510207-4f32-44b9-960d-9cad25932e6b'
title: 'CWA Solution - Windows Server Backup'
title_meta: 'CWA Solution - Windows Server Backup'
keywords: ['windows', 'backup', 'audit', 'monitor', 'report', 'schedule', 'role']
description: 'This document outlines a comprehensive solution for auditing Windows Server backups, including scripts, tables, and monitoring tools to ensure the backup process is functioning correctly and efficiently.'
tags: ['backup', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution contains the complete audit work for Windows Server backup.

## Associated Content

| Content                                                                                       | Type          | Function                                                                                                                   |
|-----------------------------------------------------------------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------|
| [Script for Windows Server Backup Schedule](https://proval.itglue.com/5078775/docs/12941262) | Script        | This script grabs the details of the Windows Server Backup Schedule and stores it in the table 'Plugin_Proval_windows_server_backup'. |
| [Windows Server Backup Data Table](https://proval.itglue.com/5078775/docs/12183969)        | Table         | The table is built to store the complete Windows Server Backup data.                                                      |
| [Windows Server Backup Report Dataview](https://proval.itglue.com/5078775/docs/11735432)   | Dataview      | This dataview shows the complete Windows Server Backup report and is useful for displaying how the Windows Server Backup is running on a scheduled basis. |
| [Agent Detection Role](https://proval.itglue.com/5078775/docs/13083383)                    | Role          | This role is created to detect the agents where the Windows Server Backup feature is installed.                          |
| [Remote Monitor for Backup Status](https://proval.itglue.com/5078775/docs/10335059)        | Remote Monitor | This remote monitor detects the last backup status of the Windows Server Backup. If the backup fails, it will raise a ticket. |

## Implementation

This solution is initially dependent on the role. Create a group based on the role and schedule the script for the group, recommended daily.

Additionally, schedule the remote monitor for the group to detect backup failures and use the default ticket creation process.

## FAQ

* (Add frequently asked questions here)





