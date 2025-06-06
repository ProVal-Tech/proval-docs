---
id: '20f0ea45-0612-4224-a2c8-210eb51be3c5'
slug: /20f0ea45-0612-4224-a2c8-210eb51be3c5
title: 'Admin - Script Engine'
title_meta: 'Admin - Script Engine'
keywords: ['scripts', 'metrics', 'environment', 'performance', 'tracking']
description: 'This document provides an overview of how scripts are performing in the environment, detailing metrics such as script execution time, frequency, and overall performance. It includes a breakdown of key columns that track the script name, machine hours, last run time, days running, total runs, and last run date.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview will display metrics on how scripts are running in the environment.

## Dependencies

None

## Columns

| Column        | Description                                                                                      |
|---------------|--------------------------------------------------------------------------------------------------|
| ScriptName    | The name of the script                                                                           |
| MachineHours  | This is a calculated metric that will tally, in hours, how much time this script is run. More hours indicate that the script is running more often. |
| LastRunTime   | The amount of time, in minutes, it took the script to run the last time it executed.            |
| DaysRunning    | The number of days each script has been running in the environment.                             |
| TotalRuns     | The count of times each script has run                                                          |
| LastRunDate   | The most recent time the script was run                                                         |