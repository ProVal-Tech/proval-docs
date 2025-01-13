---
id: 'cwa-automate-database-maintenance'
title: 'Automate Database Maintenance Solution'
title_meta: 'Automate Database Maintenance Solution'
keywords: ['cleanup', 'database', 'maintenance', 'patch', 'history']
description: 'This document details a script used for maintaining the Automate database by cleaning up specific tables related to patch management. It outlines the required global variable settings, describes the script’s functionality, and provides an overview of the variables used within the script.'
tags: ['database', 'cleanup', 'patch', 'maintenance', 'log']
draft: false
unlisted: false
---
## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

This script handles cleanup of the following table(s) and requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) PatchManagerHistory_Cleanup global variable set to 1:

- patchapprovalsettings
- hotfixdata
- PatchCVSSInfo
- hotfix
- superseded patches

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name        | Description                                                                                                                                                              |
|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verified both the starting count of targeted data, as well as the after action count of targeted data. We expect the starting count will be a value bigger than 0, and an after action value of 0. |
| LogMessage  | This is the running Log holding variable. Please note this variable is always set the same everywhere it's used in the solution. @logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output Image](..\..\..\static\img\Automate-Database-Maintenance---Patch-Manager\image_1.png)


