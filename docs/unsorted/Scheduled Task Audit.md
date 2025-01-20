---
id: 'c9a84634-8ee6-4484-8aa7-e92bafd4443c'
title: 'Scheduled Task Audit Script'
title_meta: 'Scheduled Task Audit Script for User Account Tasks'
keywords: ['audit', 'scheduled', 'task', 'user', 'account', 'json', 'sql', 'data', 'table']
description: 'This document provides an overview of a script that audits scheduled tasks to identify which user accounts are executing them. It details the variables used, dependencies required, and the process for creating and storing task details in a database table. The output includes logs and data views for further analysis.'
tags: ['database', 'report', 'sql']
draft: true
unlisted: false
---
## Summary

This script audits the scheduled task to see what user account tasks are running with.

## Sample Run

![Sample Run](../../static/img/Scheduled-Task-Audit/image_1.png)

## Variables

| Variable          | Description                                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|
| ProjectName       | Project name where script work will store                                                      |
| JsonFileName      | This file stores the JSON file name where script data is stored                                |
| TableName         | The table name where the script data will be stored after converting from JSON file            |
| WorkingDirectory   | This is a directory where the project file is stored and the JSON file is stored               |
| SQLDeleteStatement | The data cleared from the table for the computer ID                                            |
| SQLStartStatement  | This stores query to insert the data other than duplicates                                     |

## Dependencies

- [Scheduled Task Audit](<./Scheduled Task Audit.md>)
- [plugin_proval_scheduled_tasks](<./plugin_proval_scheduled_tasks.md>)
- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](<../cwa/scripts/OverFlowedVariable - SQL Insert - Execute.md>)

## Process

This script creates a table named "plugin_proval_scheduled_tasks" to store the scheduled task details in it. It then creates a ps1 file on the agent to the path "C:/ProgramData/_automation/script/@ProjectName@/ScheduledTaskAudit.ps1". It executes the ps1 using shell and stores the data into the JSON file. The JSON file is converted and then pushed into the table.

## Output

- Script log
- plugin_proval_scheduled_tasks
- Dataview
- etc.














