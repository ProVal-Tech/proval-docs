---
id: 'cwa-remove-iis-logs'
title: 'Remove IIS Log Files Older Than Specified Days'
title_meta: 'Remove IIS Log Files Older Than Specified Days'
keywords: ['iis', 'logs', 'purge', 'cleanup', 'directory']
description: 'This document describes a script that removes IIS log files older than a specified number of days, contingent on the size of the log directory. It provides setup instructions, variable definitions, and a recommended schedule for running the script.'
tags: ['cleanup', 'logs', 'windows', 'setup', 'configuration']
draft: false
unlisted: false
---
## Summary

This script will remove IIS log files older than (Global Variable, *Days*) days only if the size of the "c:/inetpub/logs/logfiles/w3svc" folder is greater than (Global Variable *Size*) MB.  
The recommended schedule for this script is:  
**Target:** "Labtech Server" Group  
**Occurrence:** run once per week  

**By default, it will remove the logs older than 30 days if the size of the directory is greater than 1024 MB.**  

Also, the script can be used for on-prem partners only.

## Sample Run

![Sample Run Image](../../../static/img/Purge-IIS-Logs-Older-than-X-Days-Param/image_1.png)  

Preferred is to schedule the script against the "Labtech Server" to run once per week:  
![Schedule Image](../../../static/img/Purge-IIS-Logs-Older-than-X-Days-Param/image_2.png)  

## Variables

| Name  | Description                                          |
|-------|------------------------------------------------------|
| psout | Outcome of the PowerShell running to Purge the IIS logs |

#### Global Parameters

| Name  | Example | Required | Description                                                                                     |
|-------|---------|----------|-------------------------------------------------------------------------------------------------|
| days  | 30      | True     | Days to Keep the logs. Default is 30                                                           |
| Size  | 1024    | True     | Threshold in MB to initiate the Purging. Script will only remove the IIS Logs older, if the size of the logs directory goes above this size. Default is 1024 |
| path  | c:/inetpub/logs/logfiles/w3svc*/*.log | True     | Path to the IIS logs                                                                             |

## Process

Step 1: Executes a PowerShell script to verify the size of the logs Directory and to clear the logs older than `@days@` days, if it finds the size above `@size@` MB.  
Step 2: Generates the logs as per the PS script's outcome and exits.  

## Output

- Script Log




