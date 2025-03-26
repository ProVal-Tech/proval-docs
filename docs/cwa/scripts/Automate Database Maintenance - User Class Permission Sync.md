---
id: '0b85cd78-2ed9-46b0-bf7a-6204226192bb'
slug: /0b85cd78-2ed9-46b0-bf7a-6204226192bb
title: 'Automate Database Maintenance - User Class Permission Sync'
title_meta: 'Automate Database Maintenance - User Class Permission Sync'
keywords: ['automate', 'database', 'maintenance', 'userclass', 'permissions', 'sync']
description: 'This document provides an overview of the Automate Database Maintenance User Class Permission Script, detailing its functionality, required properties, and variables. It ensures the synchronization of user class permissions from the Default Client to all other clients based on specific system property settings.'
tags: ['database', 'security', 'setup']
draft: false
unlisted: false
---

## Summary

This script is called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968). It handles the user class permission for the clients and requires the "UserClass_Enable_Default_Permission" system property value to be set to 1 to enable synchronization of user class permissions from the Default Client to all other clients.

## Sample Run

This script is a function script called from [CWM - Automate - Script - Automate Database Maintenance Solution](/docs/6436e6f3-e161-4b64-a4bf-1177cce2f968).

## Variables

| Name                     | Description                                                                                                                                                             |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| EnableUserClassSync      | This variable verifies if the property UserClass_Enable_Default_Permission is set to 1 or 0.                                                                          |
| LogMessage               | This is the running log holding variable. Please note this variable is always set the same everywhere it's used in the solution. `@logMessage@ = @LogMessage@[Linebreak]%when% : [Category] Cleanup [Stage] - Result`. Please continue to utilize this standard with this running log file. |
| DefaultClientid          | This variable verifies if the property UserClass_Default_Clientid is not set to 0.                                                                                    |
| VerifyDefaultClientID    | This variable verifies that the client ID mentioned in the variable DefaultClientid should not belong to any client that has already been offboarded.                  |
| ExcludedClientID         | This variable fetches the value of the property "UserClass_Excluded_Client".                                                                                         |

## Properties

| Name                                             | Description                                                                                                           |
|--------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| DBCleanup_UserClass_Enable_Default_Permission     | Set it to "1" to enable synchronization of user class permissions from the Default Client to all other clients.       |
| DBCleanup_UserClass_Default_Clientid              | Specify the client's client ID from which you would like to copy the permissions to other clients.                    |
| DBCleanup_UserClass_Excluded_Clients              | Specify the client IDs you would like to exclude from receiving the default user class permissions.                   |

## Output

This script will add the logs to the log variable.


