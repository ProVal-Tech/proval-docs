---
id: 'cwa-patching-information'
title: 'Detailed Patching Information on Agents'
title_meta: 'Detailed Patching Information on Agents'
keywords: ['patching', 'agents', 'installation', 'update', 'computer', 'status']
description: 'This document provides a comprehensive overview of the patching process on agents, including details such as the installation date, source of the patch, and the current status of the patching operation. It outlines the key columns that represent various aspects of the patching information, making it a valuable resource for monitoring and managing agent updates.'
tags: ['patching', 'installation', 'update', 'status', 'computer', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview contains detailed information about patching on the agent. (Date installed, Source, etc.)

## Columns

| Column              | Description                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| Client              | Client Name                                                                                    |
| Location            | Location Name                                                                                  |
| Computer Name       | Agent Name                                                                                     |
| Patching Date       | Patch installed date                                                                           |
| Patching Title      | Patch description                                                                               |
| Patching Source     | The source through which patch installed                                                       |
| Patching Operation   | Patching operation to show whether patch is installing, uninstalling, or stuck on rollback     |
| Patching Result     | State of patch whether successfully installed, running or failed                                |
| Operating System    | Operating system of the agent                                                                   |




