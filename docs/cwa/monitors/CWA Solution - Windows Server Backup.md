---
id: '03510207-4f32-44b9-960d-9cad25932e6b'
title: 'Windows Server Backup Audit Solution'
title_meta: 'Windows Server Backup Audit Solution'
keywords: ['windows', 'backup', 'audit', 'monitor', 'report', 'schedule', 'role']
description: 'This document outlines a comprehensive solution for auditing Windows Server backups, including scripts, tables, and monitoring tools to ensure the backup process is functioning correctly and efficiently.'
tags: ['backup', 'audit', 'monitor', 'report', 'schedule', 'role', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution contains the complete audit work for Windows Server backup.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                   |
|-----------------------------------------------------------------------------------------------|--------------|----------------------------------------------------------------------------------------------------------------------------|
| [https://proval.itglue.com/5078775/docs/12941262](https://proval.itglue.com/5078775/docs/12941262) | Script       | This script grabs the details of the Windows Server Backup Schedule and stores it in the table 'Plugin_Proval_windows_server_backup'. |
| [https://proval.itglue.com/5078775/docs/12183969](https://proval.itglue.com/5078775/docs/12183969) | Table        | The table is built to store the complete Windows Server Backup data.                                                      |
| [https://proval.itglue.com/5078775/docs/11735432](https://proval.itglue.com/5078775/docs/11735432) | Dataview     | This dataview shows the complete Windows Server Backup report and it is useful to show how the Windows Server Backup is running on every scheduled basis. |
| [https://proval.itglue.com/5078775/docs/13083383](https://proval.itglue.com/5078775/docs/13083383) | Role         | This role is created to detect the agents where the Windows Server Backup feature is installed.                          |
| [https://proval.itglue.com/5078775/docs/10335059](https://proval.itglue.com/5078775/docs/10335059) | Remote Monitor | This remote monitor detects the last backup status of the Windows Server Backup. If the backup failed, then it will raise a ticket. |

## Implementation

This solution is initially dependent on the role. Create a group based on the role. Schedule the script on the group, recommended daily.

Schedule the remote monitor to the group as well for the failure backup detection and use default ticket creation.

## FAQ









