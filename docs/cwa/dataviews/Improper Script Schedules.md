---
id: '1eb426fd-ee56-4e81-9d3e-116e8c4698b4'
title: 'Scheduled Script Filters for Technicians'
title_meta: 'Scheduled Script Filters for Technicians - ConnectWise Automate'
keywords: ['script', 'schedules', 'technician', 'recurring', 'frequency', 'machines', 'environment']
description: 'This document outlines a Dataview that filters script schedules based on technician scheduling, recurring schedules, and frequency criteria. It identifies schedules running at a frequency greater than 2 hours and highlights those targeting more than 50% of machines in the environment, while excluding client scripts and groups without agents.'
tags: ['performance', 'report', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

This Dataview filters the script schedules where it is Scheduled by a technician, is a Recurring Schedule and is running at a frequency greater than 02 hours. It will also detect any schedule running at an agent at a frequency of more than once per day. It excludes the client scripts and groups where the script is scheduled but the group doesn't have any agents.

**Note:** It highlights the schedules where it is targeting more than 50% of the machines in the environment

## Dependencies

[CWM - Automate - View - pvl_Scheduled_Scripts](https://proval.itglue.com/DOC-5078775-16497225)

## Columns

| Column                       | Description                                                  |
|------------------------------|--------------------------------------------------------------|
| ScriptID                     | ScriptID                                                    |
| Script Name                  | Name of the script                                          |
| ScheduledID                  | ScheduleID                                                 |
| Target                       | computer, location, client, group on which script is scheduled |
| TargetID                     | Computerid, LocationID, ClientID, GroupID on which script is scheduled |
| ScheduleType                 | Type of the schedule                                       |
| Interval                     | Interval on which schedule is running                      |
| ScheduleDayofWeek [Hidden]  | Day of the week on which script runs                       |
| EffectiveStartDate           | Date when the schedule was created                         |
| Script Search Limiter        | Name of the search the script schedule is limited to       |
| Group Search Limiter         | Name of the search the group is limited to                 |
| ComputerScript               | '1' if it is a computerScript                               |
| OfflineOnly [Hidden]        | '1' if script runs only on Offline agents                  |
| SkipOffline [Hidden]        | '1' if script skips Offline Agents                          |
| WakeOffline [Hidden]        | '1' if script wakes the Offline Agents                      |
| DisableTimeZone [Hidden]    | '1' if timeZone is disabled                                 |
| Scheduled By                 | User who scheduled the Script                               |
| GroupID [Hidden]            | Targeted GroupID                                           |
| NextSchedule                 | Next Runtime of the Schedule                                |
| Total Targeted Machines      | Total machines getting targeted in the schedule             |
| Targeted Servers Count       | Total Servers getting targeted in the schedule              |
| Targeted workstations Count   | Total workstations getting targeted in the schedule         |
| % Machines Targeted          | percent of the machines getting targeted in the schedule    |












