---
id: '1eb426fd-ee56-4e81-9d3e-116e8c4698b4'
slug: /1eb426fd-ee56-4e81-9d3e-116e8c4698b4
title: 'Improper Script Schedules'
title_meta: 'Improper Script Schedules'
keywords: ['script', 'schedules', 'technician', 'recurring', 'frequency', 'machines', 'environment']
description: 'This document outlines a Dataview that filters script schedules based on technician scheduling, recurring schedules, and frequency criteria. It identifies schedules running at a frequency greater than 2 hours and highlights those targeting more than 50% of machines in the environment while excluding client scripts and groups without agents.'
tags: ['performance', 'report', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This Dataview filters the script schedules that are scheduled by a technician, are recurring, and run at a frequency greater than 2 hours. It will also detect any schedule running at an agent at a frequency of more than once per day. It excludes client scripts and groups where the script is scheduled but the group doesn't have any agents.

**Note:** It highlights the schedules that target more than 50% of the machines in the environment.

## Dependencies

[CWM - Automate - View - pvl_Scheduled_Scripts](/docs/5c02ccad-5b51-46a5-8423-59286adc37ea)

## Columns

| Column                       | Description                                                  |
|------------------------------|--------------------------------------------------------------|
| ScriptID                     | Script ID                                                   |
| Script Name                  | Name of the script                                          |
| ScheduledID                  | Schedule ID                                                |
| Target                       | Computer, location, client, or group on which the script is scheduled |
| TargetID                     | Computer ID, Location ID, Client ID, or Group ID on which the script is scheduled |
| ScheduleType                 | Type of the schedule                                       |
| Interval                     | Interval on which the schedule is running                  |
| ScheduleDayofWeek [Hidden]  | Day of the week on which the script runs                   |
| EffectiveStartDate           | Date when the schedule was created                         |
| Script Search Limiter        | Name of the search the script schedule is limited to       |
| Group Search Limiter         | Name of the search the group is limited to                 |
| ComputerScript               | '1' if it is a computer script                              |
| OfflineOnly [Hidden]        | '1' if the script runs only on offline agents              |
| SkipOffline [Hidden]        | '1' if the script skips offline agents                      |
| WakeOffline [Hidden]        | '1' if the script wakes the offline agents                  |
| DisableTimeZone [Hidden]    | '1' if the time zone is disabled                           |
| Scheduled By                 | User who scheduled the script                               |
| GroupID [Hidden]            | Targeted Group ID                                          |
| NextSchedule                 | Next runtime of the schedule                                |
| Total Targeted Machines      | Total machines targeted in the schedule                     |
| Targeted Servers Count       | Total servers targeted in the schedule                      |
| Targeted Workstations Count   | Total workstations targeted in the schedule                 |
| % Machines Targeted          | Percentage of the machines targeted in the schedule         |

