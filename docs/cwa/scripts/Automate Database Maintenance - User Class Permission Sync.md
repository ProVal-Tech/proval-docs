---
id: 'cwa-automate-database-maintenance'
title: 'Automate Database Maintenance User Class Permission Script'
title_meta: 'Automate Database Maintenance User Class Permission Script'
keywords: ['automate', 'database', 'maintenance', 'userclass', 'permissions', 'sync']
description: 'This document provides an overview of the Automate Database Maintenance User Class Permission Script, detailing its functionality, required properties, and variables. It ensures the synchronization of user class permissions from the Default Client to all other clients based on specific system property settings.'
tags: ['configuration', 'database', 'log', 'security', 'setup']
draft: false
unlisted: false
---
## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293). This script handles the user class permission for the clients: It requires the "UserClass_Enable_Default_Permission" system property value set to 1 to enable sync of userclass permissions from Default Client to all other clients.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](https://proval.itglue.com/DOC-5078775-11637293).

## Variables

| Name                     | Description                                                                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| EnableUserClassSync      | This variable verifies if property UserClass_Enable_Default_Permission is set to 1 or 0.                                                                              |
| LogMessage               | This is the running Log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result` Please continue to utilize this standard with this running log file. |
| DefaultClientid          | This variable verifies if property UserClass_Default_Clientid is not set to 0.                                                                                        |
| VerifyDefaultClientID    | This variable verifies the clientid mentioned in variable DefaultClientid should not be of any client which is already offboarded.                                    |
| ExcludedClientID         | This variable fetches the value of property "UserClass_Excluded_Client".                                                                                             |

## Properties

| Name                                             | Description                                                                                                           |
|--------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| DBCleanup_UserClass_Enable_Default_Permission     | Set it to "1" to enable sync of userclass permissions from Default Client to all other clients.                      |
| DBCleanup_UserClass_Default_Clientid              | Mention the client's clientid from which you would like to copy the permissions to other clients.                     |
| DBCleanup_UserClass_Excluded_Clients              | Mention the clientid's you would like to exclude from getting the default user class permissions.                    |

## Output

This script will add the logs to the log variable.

