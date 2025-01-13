---
id: 'cwa-queued-script-reexecution'
title: 'Queued Script Reexecution Scheduler'
title_meta: 'Queued Script Reexecution Scheduler for ConnectWise Automate'
keywords: ['script', 'automation', 'queue', 'execution', 'connectwise']
description: 'This document outlines a scheduled script designed to run every 3 days on the "Machines With Queued Scripts" group in ConnectWise Automate. It ensures that the script does not enter the "Fizzled" state by requeuing itself and retrieves stored data to execute scripts on target machines. The document includes dependencies, variables, user parameters, and a step-by-step process for the script execution.'
tags: ['connectwise', 'script', 'scheduled', 'execution', 'group']
draft: false
unlisted: false
---
## Summary

This script is scheduled to run every 3 days on the 'Machines With Queued Scripts' group by the [CWM - Automate - Script - Queue Script](https://proval.itglue.com/DOC-5078775-10606199) script.

This script is scheduled to requeue itself every 3 days to ensure that the script never enters the 'Fizzled' state. 

This script is intended to retrieve stored data from the [CWM - Automate - Custom Table - plugin_proval_queued_scripts](https://proval.itglue.com/DOC-5078775-10606190) table, and execute the stored instances of scripts on the target machine.

## Sample Run

This should not be run manually.

## Dependencies

- [CWM - Automate - Solution - Queue Script Next Checkin](https://proval.itglue.com/DOC-5078775-10606186)
- [CWM - Automate - Custom Table - plugin_proval_queued_scripts](https://proval.itglue.com/DOC-5078775-10606190)
- [CWM - Automate - Script - Queue Script](https://proval.itglue.com/DOC-5078775-10606199)
- 'Machines With Queued Scripts' Group

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name               | Description                                                 |
|--------------------|-------------------------------------------------------------|
| TableName          | What the variable represents.                               |
| sqlscriptId        | The script id gathered from [CWM - Automate - Custom Table - plugin_proval_queued_scripts](https://proval.itglue.com/DOC-5078775-10606190). |
| sqlscriptparameters | The parameters for the script id to be called gathered from [CWM - Automate - Custom Table - plugin_proval_queued_scripts](https://proval.itglue.com/DOC-5078775-10606190). |
| GroupID            | The Group Id for the 'Machines With Queued Scripts' Group. |

## User Parameters

| Name    | Example | Required | Description |
|---------|---------|----------|-------------|
| Silent  | Yes     | False    | When toggled to yes, the script will not utilize the scripting engine to run the selected scripts, each script will be called with a Run Script command from this script. This means that you will not see the requested script in the scripts table, or on the computer itself, however any logging on the requested script will show up under the Run Queued Scripts entry in the target machines script. The intention of this option is to provide a less script engine intrusive method of executing the scripts. If you are noticing script engine slowdown or inflation, try this silent setting. |

## Process

1. Retrieve the target computers queued scripts from the custom table.
2. Iterate through every entry for that target executing each script with its parameters either silently or openly depending on the silent value.
3. Remove the queued script from the table after it's executed.
4. Once all scripts are executed remove the machine from the group.

## Output

- Script log


