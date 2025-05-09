---
id: '1d5d4aff-3a10-4bef-8e29-5e3234a1076b'
slug: /1d5d4aff-3a10-4bef-8e29-5e3234a1076b
title: 'Automate Database Maintenance - Roles'
title_meta: 'Automate Database Maintenance - Roles'
keywords: ['cleanup', 'database', 'maintenance', 'automate', 'script']
description: 'This document details a script designed for the Automate Database Maintenance Solution, focusing on the cleanup of specific database tables, particularly ComputerRoleDefinitions. It includes information on variable usage, expected outcomes, and logging procedures.'
tags: ['cleanup', 'database', 'logging']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

This script handles the cleanup of the following table(s):  
**ComputerRoleDefinitions** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) MissingRoles_Cleanup Global Variable set to 1.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

## Variables

| Name       | Description                                                                                                                                                      |
|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify     | This variable verifies both the starting count of targeted data and the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0. |
| LogMessage | This variable holds the running log message. Please note this variable is always set the same way wherever it's used in the solution. `@logMessage@` = `@LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/docs/1d5d4aff-3a10-4bef-8e29-5e3234a1076b/image_1.webp)