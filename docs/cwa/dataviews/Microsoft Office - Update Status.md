---
id: '43bf32a9-8e30-4344-b321-e478ba5b85d8'
title: 'Click To Run Update Status for Microsoft 365 Apps'
title_meta: 'Click To Run Update Status for Microsoft 365 Apps'
keywords: ['click', 'run', 'microsoft', 'office', 'update', 'status']
description: 'This document provides an overview of the dataview that displays the update status of supported versions of Click To Run Microsoft 365 Apps. It includes information on the recent execution of the update script and the current application versions installed on various machines.'
tags: ['application', 'office', 'software', 'update']
draft: false
unlisted: false
---

## Summary

The dataview will display whether the supported versions of Click To Run `Microsoft 365 Apps / Microsoft Office` are updated to their latest released build. Additionally, it displays the recent execution of the [SWM - Script - Microsoft Office - Click-to-Run - Update](<../scripts/Microsoft Office - Click-to-Run - Update.md>) script against the machine.

## Dependencies

- [SWM - Script - Microsoft Office - Click-to-Run - Update](<../scripts/Microsoft Office - Click-to-Run - Update.md>)  
- [CWA Monitor - CVE-2023-23397 Detection](<../monitors/CVE-2023-23397 Detection.md>)  

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
| Recent Script Run Time| Most recent execution time of [SWM - Script - Microsoft Office - Click-to-Run - Update](<../scripts/Microsoft Office - Click-to-Run - Update.md>) script |
