---
id: '31e58aae-ce62-4440-8319-b22abec4e842'
slug: /31e58aae-ce62-4440-8319-b22abec4e842
title: 'pvl_Script_Assesment'
title_meta: 'pvl_Script_Assesment'
keywords: ['script', 'failure', 'analysis', 'retention', 'database']
description: 'This document provides a detailed analysis of script failures over the past 30 days, including dependencies, table structures, and various metrics related to script performance and failures.'
tags: ['database', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

This document holds a detailed analysis of script failures over the past 30 days.

## Dependencies

[CWM - Automate - Script - Script Failure Analysis - 30 Day Retention](/docs/36a13e9c-fd23-4dae-9979-04a99a787ac0)

## Tables

#### table_name

| Column                     | Type     | Explanation                                                                                       |
|---------------------------|----------|---------------------------------------------------------------------------------------------------|
| ScriptID                  | INT      | Script ID                                                                                        |
| Script                    | VARCHAR  | Script Name                                                                                       |
| Is Computer Script        | INT      | Is this a Computer Script? (0/1)                                                                 |
| Is Offline Script         | INT      | Is this an Offline Script? (0/1)                                                                  |
| Total Affected Computers   | INT      | Count of distinct computers on which the script has run                                           |
| Total Runs                | INT      | Total number of runs                                                                               |
| Total Failures            | INT      | Total number of failures                                                                           |
| Script Step               | INT      | The step where the script failed                                                                   |
| Script Function           | VARCHAR  | Function that failed                                                                               |
| Step Failure Count        | INT      | Number of failures on the same script step                                                        |
| SQL Execution Failures    | INT      | Total number of times it failed to execute a SQL query                                            |
| Kill Command Issued       | INT      | Total number of times it failed due to timeout (either the computer went offline during command execution or an execute script function ran for over 6 hours) |
| First Failure Date        | DATETIME | First Failure Date                                                                                 |
| Last Failure Date         | DATETIME | Last Failure Date                                                                                  |
| Data Collection Time      | DATETIME | Data Collection Time                                                                                |
