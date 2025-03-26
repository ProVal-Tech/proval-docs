---
id: 'a917ce08-f8ba-493e-92c0-643024a70d96'
slug: /a917ce08-f8ba-493e-92c0-643024a70d96
title: 'Automate Database Maintenance - Tickets'
title_meta: 'Automate Database Maintenance - Tickets'
keywords: ['cleanup', 'tickets', 'database', 'maintenance', 'log']
description: 'This document details the Automate Database Maintenance Solution script, which is responsible for cleaning up various tables in the database, including Tickets, TicketData, and others. It outlines the requirements for each table cleanup and provides information on the script functionality and logging mechanism.'
tags: ['cleanup', 'database']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

This script handles the cleanup of the following table(s):

- **Tickets** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `TicketCleanup_Days` Global Variable set to a value other than 0.
- **TicketData** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `TicketDataAdditionalCleanup_Days` set to a value other than 0.
- **plugin_cw_cwstatusmapping** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `InactiveTicketStatus_Cleanup` set to 1.
- **plugin_cw_servicestatuses** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `InactiveTicketStatus_Cleanup` set to 1.
- **plugin_cw_clientmapping** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968) `InactiveAgreementMapping_Cleanup` set to 1.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

## Variables

| Name       | Description                                                                                                                                                                                                                     |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify     | This variable verifies both the starting count of targeted data and the after-action count of targeted data. We expect the starting count to be a value greater than 0, and the after-action value to be 0.                  |
| LogMessage | This variable holds the running log message. Please note this variable is always set the same way wherever it's used in the solution: `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Tickets/image_1.png)


