---
id: '2e37903f-6fe2-4764-8cc9-d8e27e596ed9'
slug: /2e37903f-6fe2-4764-8cc9-d8e27e596ed9
title: 'Automate Database Maintenance - Drives'
title_meta: 'Automate Database Maintenance - Drives'
keywords: ['cleanup', 'database', 'maintenance', 'automate', 'script']
description: 'This document details a script used for cleaning up database tables within the Automate system. It outlines the required global variable settings, expected outputs, and logging mechanisms involved in the database maintenance process.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Summary

This script is called from **[CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968)**. 

This script handles the cleanup of the following table(s):  
Drives - Requires **[CWM - Automate - Solution - Automate Database Maintenance](/docs/4b0ae11f-9850-48ea-87c8-2f538bcb80bd)** with the MissingDrives_Cleanup global variable set to 1.

## Sample Run

This script is a function script called from **[CWM - Automate - Solution - Automate Database Maintenance](/docs/4b0ae11f-9850-48ea-87c8-2f538bcb80bd)**.

## Variables

| Name        | Description                                                                                                                                                            |
|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify      | This variable verifies both the starting count of targeted data and the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0. |
| LogMessage  | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution: `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/docs/2e37903f-6fe2-4764-8cc9-d8e27e596ed9/image_1.png)

