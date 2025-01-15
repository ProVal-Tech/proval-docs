---
id: '31e58aae-ce62-4440-8319-b22abec4e842'
title: 'Script Failure Analysis - 30 Day Retention'
title_meta: 'Script Failure Analysis - 30 Day Retention'
keywords: ['script', 'failure', 'analysis', 'retention', 'database']
description: 'This document provides a detailed analysis of script failures over the past 30 days, including dependencies, table structures, and various metrics related to script performance and failures.'
tags: ['database', 'report', 'setup', 'performance']
draft: false
unlisted: false
---
## Purpose

This Custom table holds the detailed analysis of script failures over the past 30 days.

## Dependencies

[CWM - Automate - Script - Script Failure Analysis - 30 Day Retention](https://proval.itglue.com/DOC-5078775-16804995)

## Tables

#### table_name

| Column                     | Type     | Explanation                                                                                       |
|---------------------------|----------|---------------------------------------------------------------------------------------------------|
| ScriptID                  | INT      | ScriptID                                                                                          |
| Script                    | VARCHAR  | Script Name                                                                                       |
| Is Computer Script        | INT      | Is Computer Script? (0/1)                                                                         |
| Is Offline Script         | INT      | Is Offline Script? (0/1)                                                                          |
| Total Affected Computers   | INT      | Count of distinct computers on which the script has run                                           |
| Total Runs                | INT      | Total number of runs                                                                               |
| Total Failures            | INT      | Total number of failures                                                                           |
| Script Step               | INT      | The step where the script failed                                                                   |
| Script Function           | VARCHAR  | Function which failed                                                                               |
| Step Failure Count        | INT      | Number of failures on the same script step                                                        |
| SQL Execution Failures    | INT      | Total number of times it failed to execute SQL query                                              |
| Kill Command Issued       | INT      | Total number of times it failed because of timeout. (Either the computer went offline during a command execution or an execute script function ran for over 6 hours.) |
| First Failure Date        | DATETIME | First Failure Date                                                                                 |
| Last Failure Date         | DATETIME | Last Failure Date                                                                                  |
| Data Collection Time      | DATETIME | Data Collection Time                                                                                |






