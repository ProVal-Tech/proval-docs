---
id: '5c02ccad-5b51-46a5-8423-59286adc37ea'
slug: /5c02ccad-5b51-46a5-8423-59286adc37ea
title: 'pvl_Scheduled_Scripts'
title_meta: 'pvl_Scheduled_Scripts'
keywords: ['sql', 'dataview', 'schedules', 'scripts', 'automation']
description: 'This document outlines the SQL query view designed to store and execute the schedules of scripts in ConnectWise Automate that may be improperly configured. It identifies recurring schedules running at excessive frequencies and highlights potential issues with script execution.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

The view is designed to store and execute the SQL query utilized by the [CWM - Automate - Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4). It contains the script schedules where a technician scheduled it, is a recurring schedule, and is running at a frequency greater than 2 hours. It will also detect any schedule running at an agent at a frequency of more than once per day.

## Dependencies

[CWM - Automate - Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4)

## Tables

#### pvl_Scheduled_Scripts

| Column                  | Description                                                             |
|------------------------|-------------------------------------------------------------------------|
| ScriptID               | Script ID                                                                |
| Script Name            | Name of the script                                                      |
| ScheduledID            | Schedule ID                                                             |
| Target                 | Computer, location, client, group on which the script is scheduled      |
| TargetID               | Computer ID, Location ID, Client ID, Group ID on which the script is scheduled |
| ScheduleType           | Type of the schedule                                                    |
| Interval               | Interval on which the schedule is running                               |
| ScheduleDayofWeek      | The day of the week on which the script runs                           |
| EffectiveStartDate     | Date when the schedule was created                                      |
| ScriptSearch           | Name of the search the script schedule is limited to                    |
| GroupSearch            | Name of the search the group is limited to                              |
| ComputerScript         | '1' if it is a computer script                                          |
| OfflineOnly            | '1' if the script runs only on offline agents                           |
| SkipOffline            | '1' if the script skips offline agents                                   |
| WakeOffline            | '1' if the script wakes the offline agents                              |
| DisableTimeZone        | '1' if time zone is disabled                                            |
| Scheduled By           | The user who scheduled the script                                       |
| GroupID [Hidden]      | Targeted Group ID                                                       |
| NextSchedule           | Next runtime of the schedule                                            |
| Total Machines         | Total machines targeted in the schedule                                  |
| Total Servers          | Total servers targeted in the schedule                                   |
| Total Workstations      | Total workstations targeted in the schedule                              |
| Percent Targeted       | Percentage of the machines targeted in the schedule                     |

