---
id: '43bf32a9-8e30-4344-b321-e478ba5b85d8'
slug: /43bf32a9-8e30-4344-b321-e478ba5b85d8
title: 'Microsoft Office - Update Status'
title_meta: 'Microsoft Office - Update Status'
keywords: ['click', 'run', 'microsoft', 'office', 'update', 'status']
description: 'This document provides an overview of the dataview that displays the update status of supported versions of Click To Run Microsoft 365 Apps. It includes information on the recent execution of the update script and the current application versions installed on various machines.'
tags: ['application', 'office', 'software', 'update']
draft: false
unlisted: false
---

## Summary

The dataview will display whether the supported versions of Click To Run `Microsoft 365 Apps / Microsoft Office` are updated to their latest released build. Additionally, it displays the recent execution of the [SWM - Script - Microsoft Office - Click-to-Run - Update](/docs/8086f53d-c2db-40df-aa54-ea8590800fd3) script against the machine.

## Dependencies

- [SWM - Script - Microsoft Office - Click-to-Run - Update](/docs/8086f53d-c2db-40df-aa54-ea8590800fd3)  
- [CWA Monitor - CVE-2023-23397 Detection](/docs/03085c80-db6b-4111-a5d7-fc6adca44901)  

## Columns

| Column                | Description                                             |
|----------------------|---------------------------------------------------------|
| Clientid             | Client ID (Hidden)                                     |
| Locationid           | Location ID (Hidden)                                   |
| Computerid           | Computer ID (Hidden)                                   |
| Client               | Client Name                                            |
| Location             | Location Name                                          |
| Computer             | Computer Name                                          |
| Operating System     | Operating System                                       |
| Last User            | Last Logged In User                                    |
| Last Contact         | Last Contact with RMM                                  |
| Application Name     | Name of the Application                                 |
| Current Version      | Current Installed version of the application           |
| Required Version     | Required Version to install                             |
| Update Status        | Updated / Out Of Date                                  |
| Recent Script Run Time| Most recent execution time of [SWM - Script - Microsoft Office - Click-to-Run - Update](/docs/8086f53d-c2db-40df-aa54-ea8590800fd3) script |

