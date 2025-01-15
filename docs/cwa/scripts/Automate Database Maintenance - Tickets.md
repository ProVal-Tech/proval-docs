---
id: 'a917ce08-f8ba-493e-92c0-643024a70d96'
title: 'Automate Database Maintenance Solution'
title_meta: 'Automate Database Maintenance Solution'
keywords: ['cleanup', 'tickets', 'database', 'maintenance', 'log']
description: 'This document details the Automate Database Maintenance Solution script, which is responsible for cleaning up various tables in the database, including Tickets, TicketData, and others. It outlines the requirements for each table cleanup and provides information on the script's functionality and logging mechanism.'
tags: ['database', 'cleanup', 'log', 'maintenance', 'tickets']
draft: false
unlisted: false
---
## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

This script handles the cleanup of the following table(s):

- **Tickets** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) TicketCleanup_Days Global Variable set to other than 0
- **TicketData** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) TicketDataAdditoinalCleanup_Days set to other than 0
- **plugin_cw_cwstatusmapping** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) InactiveTicketStatus_Cleanup set to 1
- **plugin_cw_servicestatuses** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) InactiveTicketStatus_Cleanup set to 1
- **plugin_cw_clientmapping** - Requires [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293) Inactiveagreementmapping_Cleanup set to 1

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

## Variables

| Name       | Description                                                                                                                                                                                                                     |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verify     | This variable verified both the starting count of targeted data, as well as the after action count of targeted data. We expect the starting count will be a value bigger than 0, and an after action value of 0.               |
| LogMessage | This is the running Log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result` Please continue to utilize this standard with this running log file. |

## Output

This script will add the following section to the log variable:

![Output](../../../static/img/Automate-Database-Maintenance---Tickets/image_1.png)






