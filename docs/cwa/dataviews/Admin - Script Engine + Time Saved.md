---
id: '8400474b-2cf7-4edb-a189-58f7e85ddb00'
title: 'Admin - Script Engine + Time Saved'
title_meta: 'Admin - Script Engine + Time Saved'
keywords: ['scripts', 'metrics', 'automation', 'performance', 'execution']
description: 'This document provides an overview of a dataview that displays metrics on script execution within the environment, including time saved by automation and various performance metrics.'
tags: ['performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays metrics on how scripts are running in the environment. It also includes metrics regarding the time saved by automation.

## Columns

| Column                                   | Description                                                                                                                                                                                                                                                   |
|------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScriptName                               | The name of the script.                                                                                                                                                                                                                                       |
| MachineHours                             | This is a calculated metric that tallies, in hours, how many times each script is executed. More hours indicate that the script is running more often. This value represents a lifetime total for the script in the environment.                                   |
| LastRunTime                              | The amount of time, in minutes, it took the script to run the last time it was executed.                                                                                                                                                                     |
| Avg Run Time                             | The average time each script has been running in the environment, measured in days.                                                                                                                                                                         |
| TotalRuns                                | The total count of times each script has run. This is a lifetime total for the script in the environment.                                                                                                                                                    |
| Avg Runs per Day - All Time             | This calculated column takes the total number of times the script has been run and divides it by how long the script has been running in the environment. This provides an idea of how many times the script runs per day, as long as the script has been executed. |
| LastRunDate                              | The most recent date and time the script was run.                                                                                                                                                                                                             |
| Recent Script Count                      | This indicates the number of times the script has run based on the retention setting for script logs, typically 30-90 days.                                                                                                                                 |
| Machines Affected                        | This is the number of distinct devices that have executed the script based on the retention setting for the script logs.                                                                                                                                   |
| Recent Days Running                      | This indicates the oldest script execution based on the script retention settings. (Note: this column is primarily for validation purposes.)                                                                                                                  |
| Avg Runs per Day                        | This represents the number of times the script was executed recently divided by the recent days running. This metric can be compared with the average runs per day - all time metrics to see if the script is running more or less recently.                       |
| Script Automation Time                   | This portion of the dataview reviews the "Automation Time Saved" value included in automated scripts. If that value is filled out, it indicates how much time is saved by automation for that specific script. If the value is blank or 0, the query will substitute 1 minute for the null or 10 value. This allows the time saved by automation values to work as expected. This default time saved by automation value can be adjusted at the request of the MSP. |
| Total Time Saved                         | This is a duration column that takes the total times the script has been executed multiplied by the automation time saved. This is then converted into Days, Hours, Minutes, and Seconds. **NOTE!** There is a maximum value allowed in MySQL for the function that calculates duration. The maximum time is 34 Days, 22 Hours, 29 Minutes, and 59 Seconds. Anything above that will not display. |
| Recent Time Saved                        | This is a duration column that takes the recent times the script has been executed multiplied by the automation time saved. This is then converted into Days, Hours, Minutes, and Seconds. **NOTE!** There is a maximum value allowed in MySQL for the function that calculates duration. The maximum time is 34 Days, 22 Hours, 29 Minutes, and 59 Seconds. Anything above that will not display. |
| Avg Daily Time Saved                     | This is a duration column that takes the average times the script has been executed per day multiplied by the automation time saved. This is then converted into Days, Hours, Minutes, and Seconds. **NOTE!** There is a maximum value allowed in MySQL for the function that calculates duration. The maximum time is 34 Days, 22 Hours, 29 Minutes, and 59 Seconds. Anything above that will not display. |
| Total Automation Time Minutes (Hidden by default) | This is the total time in minutes not converted to a duration column. This is provided for validation and easy manipulation of the data.                                                                                                                      |
| Recent Automation Time Minutes (Hidden by default) | This is the most recent time in minutes not converted to a duration column. This is provided for validation and easy manipulation of the data.                                                                                                                  |
| Average Daily Time Minutes               | This is the average time per day, in minutes, and is not converted to a duration column. This is provided for validation and easy manipulation of the data.                                                                                                   |



