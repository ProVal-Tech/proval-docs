---
id: '5606850a-c68e-4b15-b183-399cded6e601'
slug: /5606850a-c68e-4b15-b183-399cded6e601
title: 'Script Effectiveness Performance Audit'
title_meta: 'Script Effectiveness Performance Audit'
keywords: ['script', 'log', 'summary', 'retention', 'performance']
description: 'This document provides a comprehensive summary of all scripts executed over the specified log retention days, detailing total runs, failures, successes, and the overall effectiveness of each script. It includes information on script performance metrics and visual examples for clarity.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document summarizes all scripts run over the set script log retention days. It displays the total runs, failures, successes, and the effectiveness of each script.

The script log retention days can be seen at the Automate location below:

![Script Log Retention Days](../../../static/img/docs/5606850a-c68e-4b15-b183-399cded6e601/image_1.webp)

## Columns

| Column                   | Description                                                                                                                                                                                                                                                                                                                                                                      |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Script Name              | Name of the script.                                                                                                                                                                                                                                                                                                                                                              |
| Script Folder            | Path to the script.                                                                                                                                                                                                                                                                                                                                                               |
| Client Script            | Indicates if it is a client script (0 or 1).                                                                                                                                                                                                                                                                                                                                     |
| Calculated since Days    | Retention period. The retention period for the script may vary between client scripts and computer scripts, as illustrated in the screenshot provided in the 'Summary' section. For computer scripts, calculations are based on data from the 'h_Script' table. However, the 'h_Scripts' table is utilized for client scripts, as the 'h_Script' table does not contain the required historical data for client scripts. |
| Last Run Date            | The most recent execution date of the script.                                                                                                                                                                                                                                                                                                                                    |
| Total Run                | The total number of script executions within the number of days displayed in the `Calculated since Days` column.                                                                                                                                                                                                                                                             |
| Success Count            | Total number of times the script succeeded within the number of days displayed in the `Calculated since Days` column.                                                                                                                                                                                                                                                          |
| Failure Count            | Total number of times the script failed or was killed within the number of days displayed in the `Calculated since Days` column. A script can be killed manually either by a user or by Automate if a machine goes offline while running an Online Computer script.                                                                                                  |
| Effective Percent        | Effective percentage of success of the script. Calculation: `(`Success Count` / `Total Runs`) * 100`.                                                                                                                                                                                                                                                                             |
| Script Performance        | Performance of the script over the retention period. Good: `Effective Percent` is greater than or equal to 75. Bad: `Effective Percent` is less than 75. Not Run Yet: Script hasn't been executed even once within the number of days displayed in the `Calculated since Days` column.                                                                                                   |
| Machines Affected        | Number of individual machines affected or run against. This number will always be 0 for client scripts.                                                                                                                                                                                                                                                                         |
| Avg. Runs - Day         | The average number of executions per day within the retention period. Calculation: `Total Run` / `Calculated since Days`.                                                                                                                                                                                                                                                         |
| Time Saved               | Time saved by the script during the retention period. Format: `days hours:minutes`.                                                                                                                                                                                                                                                                                             |
| Time Saved - Minutes     | Time saved by the script during the retention period in minutes. Calculation: `Total Run` * `Time Saved by Automation`. For scripts where the Time Saved by Automation is either not set or equal to 0: `Total Runs` * 1.                                                                                                                                                     |
| Avg. Time Saved - Daily  | Average time saved per day within the retention period. Format: `days hours:minutes`.                                                                                                                                                                                                                                                                                         |
| Avg. Time Saved Daily - Minutes | Average time saved per day within the retention period in minutes.                                                                                                                                                                                                                                                                                                       |

## Format Control

| Column                   | Colour | Value |
|--------------------------|--------|-------|
| Script Performance        | Red    | Bad   |
| Script Performance        | Green  | Good  |

## Example Screenshot

![Example Screenshot](../../../static/img/docs/5606850a-c68e-4b15-b183-399cded6e601/image_2.webp)
