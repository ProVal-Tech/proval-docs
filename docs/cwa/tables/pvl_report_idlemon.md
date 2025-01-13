---
id: 'cwa-idlemon-report-data-storage'
title: 'IdleMon Report Data Storage'
title_meta: 'IdleMon Report Data Storage'
keywords: ['idlemon', 'report', 'data', 'storage', 'globals']
description: 'This document outlines the purpose and structure of the IdleMon Report Data Storage, detailing the dependencies, table structure, and column explanations for effective data management in ConnectWise Automate.'
tags: ['database', 'report', 'configuration', 'software']
draft: false
unlisted: false
---
## Purpose

Stores the data fetched by the [CWM - Automate - Script - IdleMon Report [Globals]](https://proval.itglue.com/DOC-5078775-12869569) script.

## Dependencies

[CWM - Automate - Script - IdleMon Report [Globals]](https://proval.itglue.com/DOC-5078775-12869569)

## Tables

#### pvl_report_idlemon

| Column             | Type          | Explanation                                                      |
|--------------------|---------------|------------------------------------------------------------------|
| computerid         | int(11)      | Computerid                                                       |
| Username           | varchar(50)  | Logged in user                                                  |
| Domain             | varchar(50)  | Domain of the logged in user                                     |
| IdleTime           | varchar(50)  | Idle Time of the logged in user (Hours:Minutes:Seconds.Milliseconds) |
| IsAdmin            | varchar(5)   | Is Admin? (True/False)                                         |
| IsDomainAdmin      | varchar(5)   | IsDomainAdmin? (True/False)                                   |
| IsEnterpriseAdmin   | varchar(5)   | IsEnterpriseAdmin? (True/False)                               |
| ScriptRunTime      | datetime      | Data Collection Time                                            |


