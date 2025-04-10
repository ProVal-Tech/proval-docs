---
id: '44909a53-c1ca-4d2d-994a-40fba5a139fa'
slug: /44909a53-c1ca-4d2d-994a-40fba5a139fa
title: 'pvl_report_idlemon'
title_meta: 'pvl_report_idlemon'
keywords: ['idlemon', 'report', 'data', 'storage', 'globals']
description: 'This document outlines the purpose and structure of the IdleMon Report Data Storage, detailing the dependencies, table structure, and column explanations for effective data management in ConnectWise Automate.'
tags: ['database', 'report', 'software']
draft: false
unlisted: false
---

## Purpose

Stores the data fetched by the [CWM - Automate - Script - IdleMon Report [Globals]](/docs/c6ea69e0-823f-4090-9894-2faf81ba8c46) script.

## Dependencies

[CWM - Automate - Script - IdleMon Report [Globals]](/docs/c6ea69e0-823f-4090-9894-2faf81ba8c46)

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


