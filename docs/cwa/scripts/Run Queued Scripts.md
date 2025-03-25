---
id: 'f60f4501-a2ea-43f0-87ee-99fc8ee15031'
slug: /f60f4501-a2ea-43f0-87ee-99fc8ee15031
title: 'Run Queued Scripts'
title_meta: 'Run Queued Scripts'
keywords: ['script', 'automation', 'queue', 'execution', 'connectwise']
description: 'This document outlines a scheduled script designed to run every 3 days on the "Machines With Queued Scripts" group in ConnectWise Automate. It ensures that the script does not enter the "Fizzled" state by requeuing itself and retrieves stored data to execute scripts on target machines. The document includes dependencies, variables, user parameters, and a step-by-step process for the script execution.'
tags: ['connectwise']
draft: false
unlisted: false
---

## Summary

This script is scheduled to run every 3 days on the 'Machines With Queued Scripts' group by the [CWM - Automate - Script - Queue Script](<./Queue Script.md>) script.

This script is designed to requeue itself every 3 days to ensure that it never enters the 'Fizzled' state.

The script retrieves stored data from the [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>) table and executes the stored instances of scripts on the target machine.

## Sample Run

This script should not be run manually.

## Dependencies

- [CWM - Automate - Solution - Queue Script Next Checkin](<../../solutions/Queue Script Next Checkin.md>)
- [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>)
- [CWM - Automate - Script - Queue Script](<./Queue Script.md>)
- 'Machines With Queued Scripts' Group

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name               | Description                                                 |
|--------------------|-------------------------------------------------------------|
| TableName          | What the variable represents.                               |
| sqlscriptId        | The script ID gathered from [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>). |
| sqlscriptparameters | The parameters for the script ID to be called, gathered from [CWM - Automate - Custom Table - plugin_proval_queued_scripts](<../tables/plugin_proval_queued_scripts.md>). |
| GroupID            | The Group ID for the 'Machines With Queued Scripts' Group. |

## User Parameters

| Name    | Example | Required | Description |
|---------|---------|----------|-------------|
| Silent  | Yes     | False    | When toggled to yes, the script will not utilize the scripting engine to run the selected scripts. Each script will be called with a Run Script command from this script. This means that you will not see the requested script in the scripts table or on the computer itself; however, any logging on the requested script will show up under the Run Queued Scripts entry in the target machine's script. The intention of this option is to provide a less intrusive method of executing the scripts. If you notice script engine slowdown or inflation, try this silent setting. |

## Process

1. Retrieve the target computer's queued scripts from the custom table.
2. Iterate through every entry for that target, executing each script with its parameters either silently or openly, depending on the silent value.
3. Remove the queued script from the table after it has been executed.
4. Once all scripts are executed, remove the machine from the group.

## Output

- Script log


