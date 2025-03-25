---
id: 'c53e6fd7-f441-4dc6-ab31-5163d39d7d58'
slug: /c53e6fd7-f441-4dc6-ab31-5163d39d7d58
title: 'Automate Database Maintenance - Monitors'
title_meta: 'Automate Database Maintenance - Monitors'
keywords: ['cleanup', 'database', 'maintenance', 'agenthistory', 'log']
description: 'This document provides details about the Automate Database Maintenance Solution script, which handles the cleanup of specific database tables, particularly focusing on the h_agenthistory table. It includes information on required variables, sample runs, and output logging for effective database management.'
tags: ['cleanup', 'database', 'software']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>).

This script handles the cleanup of the following table(s):
- **h_agenthistory** - requires the [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>) MonitorHistory_Cleanup global variable set to 1.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>).

## Variables

| Name       | Description                                                                                                                                                                 |
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify     | This variable verifies both the starting count of targeted data and the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0. |
| LogMessage | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Log Output](../../../static/img/Automate-Database-Maintenance---Monitors/image_1.png)


