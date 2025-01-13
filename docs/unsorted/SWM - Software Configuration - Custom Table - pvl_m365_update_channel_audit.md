---
id: 'cwa-microsoft-365-click-to-run-data-storage'
title: 'Microsoft 365 - Click-to-Run Data Storage'
title_meta: 'Microsoft 365 - Click-to-Run Data Storage'
keywords: ['microsoft', 'data', 'storage', 'click-to-run', 'audit']
description: 'This document outlines the purpose and dependencies for storing data gathered by the Microsoft 365 Click-to-Run Get Details script. It includes information about the data structure and the specific tables used for auditing update channels.'
tags: ['database', 'setup', 'report', 'windows']
draft: true
unlisted: true
---
## Purpose

Stores the data gathered by the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Data Collection - Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-14568059)

## Tables

#### pvl_m365_update_channel_audit

| Column            | Data Type | Description                                                                                     |
|-------------------|-----------|-------------------------------------------------------------------------------------------------|
| computerid        | int       | computerid                                                                                      |
| Version           | varchar   | C2R office version installed on the machine                                                    |
| AutoUpdate        | tinyint   | If office Auto update is enabled or not on the machine                                         |
| updateChannel     | varchar   | Update Channel for office installed on the machine                                             |
| dataCollectionDate| datetime  | Last time [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) ran on the machine |




