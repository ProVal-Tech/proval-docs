---
id: 'cwa-click-to-run-office-audit'
title: 'Click-to-Run Office Audit'
title_meta: 'Click-to-Run Office Audit'
keywords: ['office', 'update', 'audit', 'status', 'version', 'channel']
description: 'This document details a dataview that populates the Click-to-Run Office version, auto-update status, and update channel information on a machine, along with basic system information. It includes dependencies for data collection and monitoring scripts.'
tags: ['microsoft', 'software', 'update', 'configuration', 'report']
draft: false
unlisted: false
---
## Summary

This dataview populates the Click-to-Run Office version, auto-update status and Update channel Information on the machine along with some basic information.

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit](https://proval.itglue.com/DOC-5078775-17164846)
- [SWM - Data Collection - Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059)

## Columns

| Column                     | Description                                                         |
|---------------------------|---------------------------------------------------------------------|
| clientid                  | clientid (Hidden)                                                  |
| locationid                | locationid (Hidden)                                                |
| computerid                | computerid                                                        |
| Client                    | Client Name                                                       |
| Location                  | Location Name                                                     |
| Computer                  | Computer Name                                                     |
| Operating System          | Operating System                                                  |
| LastContact               | Last Contact of the machine                                       |
| Last Logged In User       | Last Logged In User                                              |
| Form Factor               | Form Factor                                                      |
| C2R Office version        | C2R office version installed on the machine                       |
| Auto Update               | If office Auto update is enabled or not on the machine           |
| Update Channel            | Update Channel for office installed on the machine                |
| Script Run Time           | Last time [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) ran on the machine |

