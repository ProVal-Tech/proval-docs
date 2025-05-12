---
id: 'aa50a67f-a0b6-4b97-8e89-18b0155265cc'
slug: /aa50a67f-a0b6-4b97-8e89-18b0155265cc
title: 'Audit - GPO Redirection Settings'
title_meta: 'Audit - GPO Redirection Settings'
keywords: ['audit', 'gpo', 'redirection', 'json', 'sql', 'variables', 'power', 'settings']
description: 'This document outlines a script designed to audit registry settings related to group policy redirection. It populates a custom table with the collected data, ensuring effective data management and reporting. The script includes detailed dependencies, variable definitions, and a comprehensive process for execution and output logging.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will audit the registry settings associated with any group policy redirection settings, populating [EPM - Data Collection - Custom Table - plugin_proval_gpo_redirection_audit](/docs/025887c2-41a2-4e85-b706-dc0841a104d9) with the returned data.

## Sample Run

![Sample Run](../../../static/img/docs/aa50a67f-a0b6-4b97-8e89-18b0155265cc/image_1.webp)

## Dependencies

- [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)
- [CWM - Automate - Script - PowerShell Response - All Errors - Check](/docs/89346170-6657-4784-93cf-c0aa024b4386)

## Variables

| Name                | Description                                                                                                                                                                                                                              |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProjectName         | Holds a project name and is used when creating a .json file for any potential overflowed variable. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information. |
| WorkingDirectory     | Holds a working directory to be combined with the project name as the directory to save the .json file. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information. |
| TableName           | Holds the name of the table to be updated or created.                                                                                                                                                                               |
| JsonFileName        | The name of the json file to create. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information.                                   |
| SQLStartStatement    | The SQL start statement. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information.                                                |
| SQLTailString       | The SQL tail string. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information.                                                    |
| DataPointNames      | The names of the data points in the created .json file. Please reference [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8) for more information.                  |
| psout               | The return from the PowerShell script to gather the redirected folder data.                                                                                                                                                          |

## Process

1. Set up any static variables that are needed for any dependent scripts or current script steps.
2. Create the table if necessary.
3. Execute PowerShell
   1. Set up static variables (current user locations, local machine locations, classes).
   2. Cycle through the local machine settings, populating `myinfo` with class information.
   3. Cycle through all current user locations, populating `myinfo` with class information.
   4. Create a .json file.
4. Check the return from the target for any common PowerShell issues by running the [CWM - Automate - Script - PowerShell Response - All Errors - Check](/docs/89346170-6657-4784-93cf-c0aa024b4386) script.
5. If the `finishstatus` variable is set to false, log an error and exit with an error.
6. Insert the data into the table using [CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8).
7. Log success and exit.

## Output

- Script log