---
id: '44909a53-c1ca-4d2d-994a-40fba5a139fa'
title: 'IdleMon Report Data Storage'
title_meta: 'IdleMon Report Data Storage'
keywords: ['idlemon', 'report', 'data', 'storage', 'globals']
description: 'This document outlines the purpose and structure of the IdleMon Report Data Storage, detailing the dependencies, table structure, and column explanations for effective data management in ConnectWise Automate.'
tags: ['database', 'report', 'software']
draft: false
unlisted: false
---

## Purpose

Stores the data fetched by the [CWM - Automate - Script - IdleMon Report [Globals]](<../scripts/IdleMon Report Globals.md>) script.

## Dependencies

[CWM - Automate - Script - IdleMon Report [Globals]](<../scripts/IdleMon Report Globals.md>)

## Tables

#### pvl_report_idlemon

| Column              | Type          | Explanation                                                      |
|---------------------|---------------|------------------------------------------------------------------|
| computerid          | int(11)      | Computer ID                                                      |
| Username            | varchar(50)  | Logged in user                                                  |
| Domain              | varchar(50)  | Domain of the logged in user                                     |
| IdleTime            | varchar(50)  | Idle time of the logged in user (Hours:Minutes:Seconds.Milliseconds) |
| IsAdmin             | varchar(5)   | Is Admin? (True/False)                                         |
| IsDomainAdmin       | varchar(5)   | Is Domain Admin? (True/False)                                   |
| IsEnterpriseAdmin    | varchar(5)   | Is Enterprise Admin? (True/False)                               |
| ScriptRunTime       | datetime      | Data collection time                                            |

