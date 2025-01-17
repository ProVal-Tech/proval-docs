---
id: '1d5d4aff-3a10-4bef-8e29-5e3234a1076b'
title: 'Automate Database Maintenance Solution Cleanup Script'
title_meta: 'Automate Database Maintenance Solution Cleanup Script'
keywords: ['cleanup', 'database', 'maintenance', 'automate', 'script']
description: 'This document details a script designed for the Automate Database Maintenance Solution, focusing on the cleanup of specific database tables, particularly ComputerRoleDefinitions. It includes information on variable usage, expected outcomes, and logging procedures.'
tags: ['cleanup', 'database', 'logging']
draft: false
unlisted: false
---
## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293). 

This script handles cleanup of the following table(s):  
ComputerRoleDefinitions - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) MissingRoles_Cleanup Global Variable Set to 1.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

## Variables

| Name         | Description                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify       | This variable verified both the starting count of targeted data, as well as the after action count of targeted data. We expect the starting count will be a value bigger than 0, and an after action value of 0. |
| LogMessage   | This is the running Log holding variable. Please note this variable is always set the same everywhere it's used in the solution. @logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Roles/image_1.png)











