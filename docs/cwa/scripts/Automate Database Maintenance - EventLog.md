---
id: 'a961622e-18fd-4e0d-9f43-8c1b9f6beea3'
title: 'Automate Database Maintenance - EventLog'
title_meta: 'Automate Database Maintenance - EventLog'
keywords: ['cleanup', 'database', 'eventlogs', 'maintenance', 'script']
description: 'This document outlines the Automate Database Maintenance Cleanup Script, which is responsible for cleaning up the Eventlogs table based on specific conditions. It details the script functionality, variables used, and expected output, providing a comprehensive overview for users.'
tags: ['cleanup', 'database', 'eventlogs']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>).

This script handles the cleanup of the following table(s):  
Eventlogs - requires the [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>) EventLog_Cleanup global variable to be set to 1.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>).

## Variables

| Name       | Description                                                                                                                                                                                                                     |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify     | This variable verifies both the starting count of targeted data, as well as the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0.               |
| LogMessage | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---EventLog/image_1.png)

or results if not skipped.



