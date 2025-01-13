---
id: 'cwa-click-to-run-update-status'
title: 'Click To Run Update Status for Microsoft 365 Apps'
title_meta: 'Click To Run Update Status for Microsoft 365 Apps'
keywords: ['click', 'run', 'microsoft', 'office', 'update', 'status']
description: 'This document provides an overview of the dataview that displays the update status of supported versions of Click To Run Microsoft 365 Apps. It includes information on the recent execution of the update script and the current application versions installed on various machines.'
tags: ['update', 'application', 'status', 'software', 'cwa', 'microsoft', 'office']
draft: false
unlisted: false
---
## Summary

The dataview will display whether the supported versions of Click To Run `Microsoft 365 Apps / Microsoft Office` are updated to their latest released build or not. Additionally, it displays the recent execution of [SWM - Script - Microsoft Office - Click-to-Run - Update](https://proval.itglue.com/DOC-5078775-8141293) script against the machine.

## Dependencies

- [SWM - Script - Microsoft Office - Click-to-Run - Update](https://proval.itglue.com/DOC-5078775-8141293)  
- [CWA Monitor - CVE-2023-23397 Detection](https://proval.itglue.com/DOC-5078775-12401051)  

## Columns

| Column                | Description                                             |
|----------------------|---------------------------------------------------------|
| Clientid             | Clientid (Hidden)                                      |
| Locationid           | Locationid (Hidden)                                    |
| Computerid           | Computerid (Hidden)                                    |
| Client               | Client Name                                            |
| Location             | Location Name                                          |
| Computer             | Computer Name                                          |
| Operating System     | Operating System                                       |
| Last User            | Last Logged In User                                    |
| Last Contact         | Last Contact with RMM                                  |
| Application Name     | Name of the Application                                 |
| Current Version      | Current Installed version of the application           |
| Required Version     | Required Version to install                             |
| Update Status        | Updated/Out Of Date                                    |
| Recent Script Run Time| Most recent execution time of [SWM - Script - Microsoft Office - Click-to-Run - Update](https://proval.itglue.com/DOC-5078775-8141293) script |


