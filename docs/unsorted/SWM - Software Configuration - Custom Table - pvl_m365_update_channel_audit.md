---
id: '18823b31-4222-4881-82f8-bc284af806cb'
title: 'SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit'
title_meta: 'SWM - Software Configuration - Custom Table - pvl_m365_update_channel_audit'
keywords: ['microsoft', 'data', 'storage', 'click-to-run', 'audit']
description: 'This document outlines the purpose and dependencies for storing data gathered by the Microsoft 365 Click-to-Run Get Details script. It includes information about the data structure and the specific tables used for auditing update channels.'
tags: ['database', 'report', 'setup', 'windows']
draft: true
unlisted: false
---

## Purpose

Stores the data gathered by the [Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) script.

## Dependencies

- [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545)
- [SWM - Data Collection - Monitor - Execute Script - Microsoft 365 - Click-to-Run - Get Details](<../cwa/monitors/Execute Script - Microsoft 365 - Click-to-Run - Get Details.md>)

## Tables

#### pvl_m365_update_channel_audit

| Column            | Data Type | Description                                                                                     |
|-------------------|-----------|-------------------------------------------------------------------------------------------------|
| computerid        | int       | Identifier for the computer.                                                                    |
| Version           | varchar   | C2R Office version installed on the machine.                                                   |
| AutoUpdate        | tinyint   | Indicates whether Office Auto Update is enabled on the machine.                                |
| updateChannel     | varchar   | Update Channel for Office installed on the machine.                                            |
| dataCollectionDate| datetime  | Last time the [SWM - Data Collection - Script - Microsoft 365 - Click-to-Run - Get Details](https://proval.itglue.com/DOC-5078775-13932545) ran on the machine. |





