---
id: 'f1d0dacb-4500-428e-b2ac-c96b30348755'
slug: /f1d0dacb-4500-428e-b2ac-c96b30348755
title: 'plugin_proval_scheduled_tasks'
title_meta: 'plugin_proval_scheduled_tasks'
keywords: ['scheduled', 'task', 'data', 'storage', 'audit']
description: 'This document outlines the structure and dependencies of the scheduled task data storage, detailing the table schema and SQL commands necessary for implementation. It provides insights into the scheduled tasks managed by the system, including their statuses, run times, and management options.'
tags: ['database', 'report', 'software', 'windows']
draft: false
unlisted: true
---

## Purpose

The table stores the scheduled task data.

## Dependencies

- [Scheduled Task Audit](/docs/c9a84634-8ee6-4484-8aa7-e92bafd4443c)
- [Scheduled Task Audit](/docs/c9a84634-8ee6-4484-8aa7-e92bafd4443c)

## Tables

#### plugin_proval_scheduled_tasks

| Column                          | Type     | Explanation                                 |
|---------------------------------|----------|---------------------------------------------|
| computerid                      | INT      | Computer ID of the agent                    |
| Scheduled Task Name             | VARCHAR  | Scheduled task name on the agent            |
| Hostname                        | VARCHAR  | Hostname of the agent                       |
| User Task Run                   | VARCHAR  | Scheduled task for user                     |
| Task Next Run                   | DATETIME | Task next run time                          |
| Task Last Run                   | DATETIME | Task last run time                          |
| Task To Run                     | VARCHAR  | Task run action about what it is doing      |
| LogonMode                       | VARCHAR  | Logon mode information                      |
| Comment                         | VARCHAR  | Comment of the scheduled task               |
| Task Status                     | VARCHAR  | Scheduled task status                        |
| Task Start Time                 | VARCHAR  | Scheduled task start time                   |
| Task End Date                   | VARCHAR  | Scheduled task end date                     |
| Task Start Date                 | VARCHAR  | Scheduled task start date                   |
| Task Scheduled Type             | VARCHAR  | Scheduled task type                         |
| Task Schedule                   | VARCHAR  | Task scheduled status                       |
| Task Idle Time                  | VARCHAR  | Task pause time duration                    |
| Task Days                       | VARCHAR  | Task per days                              |
| Task Months                     | VARCHAR  | Task per months                            |
| Task Repeat Every               | VARCHAR  | Task repeat every hour/day, etc.           |
| Task Repeat Until Duration      | VARCHAR  | Task repeat end date                       |
| Task Repeat Until Time          | VARCHAR  | Task repeat end time                       |
| Power Management                | VARCHAR  | Power management status of the task        |
| Delete Task If Not Rescheduled  | VARCHAR  | Delete task if not rescheduled             |
| Script Ran Date                 | DATETIME | Script last ran date                       |

## SQL

```sql
CREATE TABLE IF NOT EXISTS `labtech`.`plugin_proval_scheduled_tasks` (
  `computerid` INT(11) NOT NULL,
  `HostName` VARCHAR(100) NOT NULL,
  `TaskName` VARCHAR(1000) NOT NULL,
  `RunAsUser` VARCHAR(200) NOT NULL,
  `NextRunTime` DATETIME NOT NULL,
  `Status` VARCHAR(50) NOT NULL,
  `LastRunTime` DATETIME NOT NULL,
  `TaskToRun` VARCHAR(50) NOT NULL,
  `LogonMode` VARCHAR(100) NOT NULL,
  `Comment` VARCHAR(500) NOT NULL,
  `ScheduledTaskState` VARCHAR(50) NOT NULL,
  `IdleTime` VARCHAR(50) NOT NULL,
  `PowerManagement` VARCHAR(50) NOT NULL,
  `DeleteTaskIfNotRescheduled` VARCHAR(50) NOT NULL,
  `Schedule` VARCHAR(50) NOT NULL,
  `StartTime` VARCHAR(20) NOT NULL,
  `ScheduledType` VARCHAR(50) NOT NULL,
  `StartDate` VARCHAR(20) NOT NULL,
  `EndDate` VARCHAR(20) NOT NULL,
  `Days` VARCHAR(50) NOT NULL,
  `Months` VARCHAR(50) NOT NULL,
  `RepeatEvery` VARCHAR(50) NOT NULL,
  `RepeatUntilTime` VARCHAR(50) NOT NULL,
  `RepeatUntilDuration` VARCHAR(50) NOT NULL,
  `CurrentDate` DATETIME NOT NULL,
  CONSTRAINT `plugin_proval_scheduled_tasks_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `labtech`.`computers`(`ComputerID`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```