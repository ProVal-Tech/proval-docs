---
id: '4a4d8ffa-760b-4e17-a377-df522ff0ba34'
slug: /4a4d8ffa-760b-4e17-a377-df522ff0ba34
title: 'Script Failure Assessment - Last 30 Days'
title_meta: 'Script Failure Assessment - Last 30 Days'
keywords: ['script', 'failure', 'analysis', 'retention', 'dataview']
description: 'This document provides a detailed analysis of script failures over the past 30 days, addressing limitations in the retention period of script data. It outlines dependencies, columns, and metrics to assess script performance effectively.'
tags: ['performance', 'report']
draft: false
unlisted: false
---

## Summary

This Dataview is similar to the [Script Failure Assessment](/docs/0a1ca2b8-1d0e-4873-83a0-a6d1d79c1683), with the key difference being that it provides a detailed analysis of script failures over the past 30 days. In contrast, the [Script Failure Assessment](/docs/0a1ca2b8-1d0e-4873-83a0-a6d1d79c1683) relies on the retention period specified in the `Scripts` property on the dashboard. This Dataview was created to address the limitation of the `Scripts` property retention, which is often set to just `7` days, making it challenging to assess script failures over a month.

## Dependencies

- [CWM - Automate - Script - Script Failure Analysis - 30 Day Retention](/docs/36a13e9c-fd23-4dae-9979-04a99a787ac0)
- [CWM - Automate - Custom Table - pvl_Script_Assessment](/docs/31e58aae-ce62-4440-8319-b22abec4e842)

## Columns

| Column                       | Description                                                                                         |
|------------------------------|-----------------------------------------------------------------------------------------------------|
| ScriptID                     | Script ID                                                                                           |
| Script                       | Script Name                                                                                        |
| Is Computer Script           | Is this a computer script? (0/1)                                                                   |
| Is Offline Script            | Is this an offline script? (0/1)                                                                    |
| Total Affected Computers     | Count of distinct computers on which the script has run                                            |
| Total Runs                   | Total number of runs                                                                                |
| Total Failures               | Total number of failures                                                                            |
| Total Failure %              | Overall Failure Percentage                                                                          |
| Script Step                  | The step where the script failed                                                                    |
| Script Function              | Function that failed                                                                                |
| Step Failure Count           | Number of failures on the same script step                                                         |
| Step Failure %               | Percentage of script failures on the same step                                                     |
| SQL Execution Failures       | Total number of times it failed to execute SQL query                                               |
| SQL Execution Failures %     | Percentage of failures due to SQL query execution failure                                           |
| Kill Command Issued          | Total number of times the script failed due to a timeout (either the computer went offline during command execution or the execute script function ran for over 6 hours) |
| Kill Command Issued %        | Percentage of failures due to the Kill Command being issued                                          |
| First Failure Date           | Date of the first failure                                                                            |
| Last Failure Date            | Date of the last failure                                                                             |
| Time Period Days             | Number of days since the data collection started                                                   |

