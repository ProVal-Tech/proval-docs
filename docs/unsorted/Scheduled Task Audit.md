---
id: 'c9a84634-8ee6-4484-8aa7-e92bafd4443c'
title: 'Scheduled Task Audit'
title_meta: 'Scheduled Task Audit'
keywords: ['audit', 'scheduled', 'task', 'user', 'account', 'json', 'sql', 'data', 'table']
description: 'This document provides an overview of a script that audits scheduled tasks to identify which user accounts are executing them. It details the variables used, dependencies required, and the process for creating and storing task details in a database table. The output includes logs and data views for further analysis.'
tags: ['database', 'report', 'sql']
draft: true
unlisted: false
---

## Summary

This script audits scheduled tasks to identify which user accounts are running them.

## Sample Run

![Sample Run](../../static/img/Scheduled-Task-Audit/image_1.png)

## Variables

| Variable           | Description                                                                                     |
|--------------------|-------------------------------------------------------------------------------------------------|
| ProjectName        | Project name where the script will store its work                                              |
| JsonFileName       | The name of the JSON file where script data is stored                                          |
| TableName          | The name of the table where the script data will be stored after converting from the JSON file |
| WorkingDirectory    | The directory where the project file and the JSON file are stored                             |
| SQLDeleteStatement  | The SQL statement used to clear data from the table for the computer ID                        |
| SQLStartStatement   | The SQL statement used to insert data, excluding duplicates                                    |

## Dependencies

- [Scheduled Task Audit](<./Scheduled Task Audit.md>)
- [plugin_proval_scheduled_tasks](<./plugin_proval_scheduled_tasks.md>)
- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](<../cwa/scripts/OverFlowedVariable - SQL Insert - Execute.md>)

## Process

This script creates a table named "plugin_proval_scheduled_tasks" to store the scheduled task details. It then creates a PowerShell script (ps1 file) at the path "C:/ProgramData/_automation/script/@ProjectName@/ScheduledTaskAudit.ps1". The script is executed using a shell command, and the data is stored in a JSON file. Finally, the JSON file is converted and pushed into the table.

## Output

- Script log
- plugin_proval_scheduled_tasks
- Data view
- etc.



