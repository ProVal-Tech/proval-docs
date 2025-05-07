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
| [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968)                               | Script | This is a wrapper script that calls all database maintenance subscripts and creates the log file. |
| [CWM - Automate - Script - Automate Database Maintenance - Commands](/docs/71d5e2dc-3c42-4c86-934d-3316e8fd0b4c)                               | Script | Cleans up old commands                              |
| [CWM - Automate - Script - Automate Database Maintenance - Drives](/docs/2e37903f-6fe2-4764-8cc9-d8e27e596ed9)                                 | Script | Cleans up missing drives                            |
| [CWM - Automate - Script - Automate Database Maintenance - EventLog](/docs/a961622e-18fd-4e0d-9f43-8c1b9f6beea3)                              | Script | Cleans up old event logs                            |
| [CWM - Automate - Script - Automate Database Maintenance - Monitors](/docs/c53e6fd7-f441-4dc6-ab31-5163d39d7d58)                               | Script | Cleans up old monitors                              |
| [CWM - Automate - Script - Automate Database Maintenance - Network Devices](/docs/09db9e10-3f2c-46f8-8071-3c6e5c09b04d)                        | Script | Cleans up old network devices                       |
| [CWM - Automate - Script - Automate Database Maintenance - Roles](/docs/1d5d4aff-3a10-4bef-8e29-5e3234a1076b)                                  | Script | Cleans up old roles                                 |
| [CWM - Automate - Script - Automate Database Maintenance - Script History](/docs/c4cc9f04-c64f-4a39-a92c-3a3a480b3300)                          | Script | Cleans up script history                            |
| [CWM - Automate - Script - Automate Database Maintenance - Tickets](/docs/a917ce08-f8ba-493e-92c0-643024a70d96)                                 | Script | Cleans up ticket-related data                       |
| [CWM - Automate - Script - Automate Database Maintenance - UserCentric](/docs/983c0f82-09ce-4570-b7dc-55dfc78678fc)                            | Script | Forces contacts to be managed for user-centric      |
| [CWM - Automate - Script - Automate Database Maintenance - User Class Permission Sync](/docs/0b85cd78-2ed9-46b0-bf7a-6204226192bb)             | Script | Forces default user class permissions to all clients |

## Implementation

**NOTE:** This solution deprecates Proval Maintenance[Globals] (6794)

1. Import the [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) script.
2. Ensure the other scripts are also synced and fully up to date. (The main script should import them, but syncing them will ensure we know when they are out of date.)
3. Schedule the client script [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) to run weekly, every Monday at 5:30 AM.

## FAQ



