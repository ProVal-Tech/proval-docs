---
id: '4b0ae11f-9850-48ea-87c8-2f538bcb80bd'
title: 'Automate Database Maintenance Solution'
title_meta: 'Automate Database Maintenance Solution'
keywords: ['database', 'maintenance', 'log', 'tasks', 'cleanup', 'scheduling']
description: 'This document outlines the Automate Database Maintenance Solution, providing a comprehensive approach to maintaining and logging database tasks with the capability for future expansion. It includes associated scripts for various maintenance tasks and implementation guidelines.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---
## Purpose

This Solution Provides an easy way to maintain and log any desired database maintenance tasks with room to grow and expand if necessary.

## Associated Content

| Content                                                                                                                                               | Type   | Function                                             |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-----------------------------------------------------|
| [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293)                               | Script | This is a wrapper script that calls all database maintenance subscripts and creates the log file. |
| [CWM - Automate - Script - Automate Database Maintenance - Commands](https://proval.itglue.com/DOC-5078775-11623969)                               | Script | Cleans up old Commands                              |
| [CWM - Automate - Script - Automate Database Maintenance - Drives](https://proval.itglue.com/DOC-5078775-11639125)                                 | Script | Cleans up missing Drives                            |
| [CWM - Automate - Script - Automate Database Maintenance - EventLog](https://proval.itglue.com/DOC-5078775-11639531)                              | Script | Cleans up old event logs                            |
| [CWM - Automate - Script - Automate Database Maintenance - Monitors](https://proval.itglue.com/DOC-5078775-11639537)                               | Script | Cleans up old monitors                              |
| [CWM - Automate - Script - Automate Database Maintenance - Network Devices](https://proval.itglue.com/DOC-5078775-11639539)                        | Script | Cleans up old network devices                       |
| [CWM - Automate - Script - Automate Database Maintenance - Roles](https://proval.itglue.com/DOC-5078775-11640024)                                  | Script | Cleans up old roles                                 |
| [CWM - Automate - Script - Automate Database Maintenance - Script History](https://proval.itglue.com/DOC-5078775-11640489)                          | Script | Cleans up script history                            |
| [CWM - Automate - Script - Automate Database Maintenance - Tickets](https://proval.itglue.com/DOC-5078775-11640491)                                 | Script | Cleans up ticket related data                       |
| [CWM - Automate - Script - Automate Database Maintenance - UserCentric](https://proval.itglue.com/DOC-5078775-11640839)                            | Script | Forces contacts to managed for user centric        |
| [CWM - Automate - Script - Automate Database Maintenance - User Class Permission Sync](https://proval.itglue.com/DOC-5078775-13605741)             | Script | Forces Default User Class Permissions to all clients |

## Implementation

**NOTE:** This solution deprecates Proval Maintenance[Globals] (6794)

1. Import the [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) script.
2. Make sure the other scripts are also synced and fully up to date. (The main script should import them, but syncing them will make sure we know when they are out of date)
3. Schedule the client script [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) to run weekly, every Monday at 5:30 AM.

## FAQ













