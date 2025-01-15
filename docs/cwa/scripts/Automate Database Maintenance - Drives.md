---
id: '2e37903f-6fe2-4764-8cc9-d8e27e596ed9'
title: 'Automate Database Maintenance Cleanup'
title_meta: 'Automate Database Maintenance Cleanup'
keywords: ['cleanup', 'database', 'maintenance', 'automate', 'script']
description: 'This document details a script used for cleaning up database tables within the Automate system. It outlines the required global variable settings, expected outputs, and logging mechanisms involved in the database maintenance process.'
tags: ['database', 'cleanup', 'log', 'maintenance', 'solution']
draft: false
unlisted: false
---
## Summary

This script is called from **[CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293)**. 

This script handles cleanup of the following table(s):  
Drives - Requires **[CWM - Automate - Solution - Automate Database Maintenance](https://proval.itglue.com/DOC-5078775-11637295)** MissingDrives_Cleanup Global Variable set to 1.

## Sample Run

This script is a function script called from **[CWM - Automate - Solution - Automate Database Maintenance](https://proval.itglue.com/DOC-5078775-11637295)**.

## Variables

| Name        | Description                                                                                                                                                            |
|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verifies both the starting count of targeted data, as well as the after action count of targeted data. We expect the starting count will be a value bigger than 0, and an after action value of 0. |
| LogMessage  | This is the running Log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Drives/image_1.png)






