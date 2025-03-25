---
id: '4b0ae11f-9850-48ea-87c8-2f538bcb80bd'
slug: /4b0ae11f-9850-48ea-87c8-2f538bcb80bd
title: 'Automate Database Maintenance'
title_meta: 'Automate Database Maintenance'
keywords: ['database', 'maintenance', 'log', 'tasks', 'cleanup', 'scheduling']
description: 'This document outlines the Automate Database Maintenance Solution, providing a comprehensive approach to maintaining and logging database tasks with the capability for future expansion. It includes associated scripts for various maintenance tasks and implementation guidelines.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Purpose

This solution provides an easy way to maintain and log any desired database maintenance tasks, with room to grow and expand if necessary.

## Associated Content

| Content                                                                                                                                               | Type   | Function                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------------------------------------------|
| [CWM - Automate - Script - Automate Database Maintenance Solution](<../cwa/scripts/Automate Database Maintenance Solution.md>)                               | Script | This is a wrapper script that calls all database maintenance subscripts and creates the log file. |
| [CWM - Automate - Script - Automate Database Maintenance - Commands](<../cwa/scripts/Automate Database Maintenance - Commands.md>)                               | Script | Cleans up old commands                              |
| [CWM - Automate - Script - Automate Database Maintenance - Drives](<../cwa/scripts/Automate Database Maintenance - Drives.md>)                                 | Script | Cleans up missing drives                            |
| [CWM - Automate - Script - Automate Database Maintenance - EventLog](<../cwa/scripts/Automate Database Maintenance - EventLog.md>)                              | Script | Cleans up old event logs                            |
| [CWM - Automate - Script - Automate Database Maintenance - Monitors](<../cwa/scripts/Automate Database Maintenance - Monitors.md>)                               | Script | Cleans up old monitors                              |
| [CWM - Automate - Script - Automate Database Maintenance - Network Devices](<../cwa/scripts/Automate Database Maintenance - Network Devices.md>)                        | Script | Cleans up old network devices                       |
| [CWM - Automate - Script - Automate Database Maintenance - Roles](<../cwa/scripts/Automate Database Maintenance - Roles.md>)                                  | Script | Cleans up old roles                                 |
| [CWM - Automate - Script - Automate Database Maintenance - Script History](<../cwa/scripts/Automate Database Maintenance - Script History.md>)                          | Script | Cleans up script history                            |
| [CWM - Automate - Script - Automate Database Maintenance - Tickets](<../cwa/scripts/Automate Database Maintenance - Tickets.md>)                                 | Script | Cleans up ticket-related data                       |
| [CWM - Automate - Script - Automate Database Maintenance - UserCentric](<../cwa/scripts/Automate Database Maintenance - UserCentric.md>)                            | Script | Forces contacts to be managed for user-centric      |
| [CWM - Automate - Script - Automate Database Maintenance - User Class Permission Sync](<../cwa/scripts/Automate Database Maintenance - User Class Permission Sync.md>)             | Script | Forces default user class permissions to all clients |

## Implementation

**NOTE:** This solution deprecates Proval Maintenance[Globals] (6794)

1. Import the [CWM - Automate - Script - Automate Database Maintenance Solution](<../cwa/scripts/Automate Database Maintenance Solution.md>) script.
2. Ensure the other scripts are also synced and fully up to date. (The main script should import them, but syncing them will ensure we know when they are out of date.)
3. Schedule the client script [CWM - Automate - Script - Automate Database Maintenance Solution](<../cwa/scripts/Automate Database Maintenance Solution.md>) to run weekly, every Monday at 5:30 AM.

## FAQ




