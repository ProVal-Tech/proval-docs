---
id: 'c4cc9f04-c64f-4a39-a92c-3a3a480b3300'
slug: /c4cc9f04-c64f-4a39-a92c-3a3a480b3300
title: 'Automate Database Maintenance - Script History'
title_meta: 'Automate Database Maintenance - Script History'
keywords: ['cleanup', 'database', 'maintenance', 'script', 'log']
description: 'This document provides an overview of the Automate Database Maintenance Script, detailing its functionality for cleaning up specific tables in the database, including script history and stale script states. It also explains the variables used in the script and the expected output in the log.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>). This script handles cleanup of the following table(s): 
- Requires the [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>) ScriptHistory_Cleanup global variable to be set to 1
- `h_script`
- `h_scripts`
- Stale script states

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>).

## Variables

| Name        | Description                                                                                                                                                                                                                     |
|-------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verifies both the starting count of targeted data, as well as the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0.             |
| LogMessage  | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Script-History/image_1.png)


