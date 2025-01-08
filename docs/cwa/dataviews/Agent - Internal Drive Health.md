---
id: 'cwa-internal-drive-health-status'
title: 'Internal Drive Health Status for Automate Agents'
title_meta: 'Internal Drive Health Status for Automate Agents'
keywords: ['automate', 'drive', 'health', 'status', 'agent', 'inventory']
description: 'This document provides a comprehensive dataview that displays the internal drive health status for all ConnectWise Automate agents, detailing various metrics such as drive size, free space, fragmentation, and more.'
tags: ['agent', 'disk-encryption', 'performance', 'report', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

This dataview shows internal drive health status for all Automate agents.

## Columns

| Column                | Description                                                               |
|----------------------|---------------------------------------------------------------------------|
| Client Name          | Display the agent name.                                                  |
| Location Name        | Display the location name of the agent.                                  |
| Computer Name        | Display the Client name of the agent.                                    |
| Agent Type           | Agent type whether laptop, workstation, or server.                       |
| Drive Last updated    | Display the date when drive inventory was last updated in automate.      |
| Drive Letter         | Display the drive letter.                                                |
| Drive Size           | Display the total drive size in GB.                                      |
| Drive Free Space     | Display the total free drive space in GB.                                |
| Drive Free Percent    | Display the total free drive space percentage.                           |
| Drive Fragmentation   | Display the total drive fragmentation in percent.                        |
| Drive MFT Frag       | Display the master file table Fragmentation.                             |
| Drive Total Files    | Display the total no. of files present on the drive.                    |
| Drive File System    | Display the name of the drive file system.                               |
| Drive Model          | Display the model name of the drive.                                     |
| Drive SSD            | Display the status of the Drive SSD, True or False.                     |
| Drive Missing        | Display the status of the drive if it's missing or connected.           |

