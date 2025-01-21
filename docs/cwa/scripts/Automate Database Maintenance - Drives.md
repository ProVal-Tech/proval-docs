---
id: '2e37903f-6fe2-4764-8cc9-d8e27e596ed9'
title: 'Automate Database Maintenance - Drives'
title_meta: 'Automate Database Maintenance - Drives'
keywords: ['cleanup', 'database', 'maintenance', 'automate', 'script']
description: 'This document details a script used for cleaning up database tables within the Automate system. It outlines the required global variable settings, expected outputs, and logging mechanisms involved in the database maintenance process.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Summary

This script is called from **[CWM - Automate - Script - Automate Database Maintenance Solution](<./Automate Database Maintenance Solution.md>)**. 

This script handles the cleanup of the following table(s):  
Drives - Requires **[CWM - Automate - Solution - Automate Database Maintenance](<../../solutions/Automate Database Maintenance.md>)** with the MissingDrives_Cleanup global variable set to 1.

## Sample Run

This script is a function script called from **[CWM - Automate - Solution - Automate Database Maintenance](<../../solutions/Automate Database Maintenance.md>)**.

## Variables

| Name        | Description                                                                                                                                                            |
|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verifies both the starting count of targeted data and the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0. |
| LogMessage  | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution: `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Drives/image_1.png)



