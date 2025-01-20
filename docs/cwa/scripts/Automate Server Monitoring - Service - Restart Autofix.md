---
id: '870dc2c7-95ea-494e-aefd-05609925545b'
title: 'Automate Server Monitoring Email Notification Script'
title_meta: 'Automate Server Monitoring Email Notification Script'
keywords: ['automate', 'monitoring', 'email', 'notification', 'service']
description: 'This document details a script designed for use with remote monitors in the Automate server and CW Manage Plugin Monitoring. The script is structured to send a SUCCESS email only if a FAILURE email has already been dispatched for the monitored service, ensuring efficient communication and alert management.'
tags: ['email']
draft: false
unlisted: false
---
## Summary

This script is used with the remote monitors of the [Solution - Automate server and CW Manage Plugin Monitoring](https://proval.itglue.com/5078775/docs/10390988) which needed to get created due to static Global Variables and a specific `Subject` that had to be used.

![Image](../../../static/img/Automate-Server-Monitoring---Service---Restart-Autofix/image_1.png)

The script will only send a SUCCESS email if a FAILURE email has already been sent for that service.

## Sample Run

Will not work manually, it can be used via the `△ Custom - Autofix - Restart Service - Automate Server Monitoring` alert template. This script is intended only for use from a monitor alert template.

## Dependencies

- [Agnostic - Invoke-RestartService](<../../powershell/Invoke-RestartService.md>)
- [Solution - Automate server and CW Manage Plugin Monitoring](https://proval.itglue.com/5078775/docs/10390988)

## Variables

| Name        | Description                                        |
|-------------|----------------------------------------------------|
| STATUS      | Status Returned from Monitor Set (SUCCESS|FAILED)  |
| FieldName   | Service Name returned from Monitor set              |
| Subject     | Ticket/Email Subject                                |
| Body        | Ticket/Email Body for Failure                       |
| Comment     | Ticket/Email Comment For Failure                    |
| TicketComment| Ticket Comment For Success                          |
| EmailBody   | Email Body For Success                              |

#### Global Parameters

**To use the script as an Autofix for remote service monitors, global variables must be appropriately addressed.**

| Name                   | Example | Required | Description                                                                                                     |
|------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------|
| TicketCreationCategory  | 0       | False    | ID of the ticket category to create the ticket. 0 will disable the ticketing. Default is 134 (id of ticket category `service`). |
| SuccessEmail           | 1       | True if EmailAddress is defined | Setting it 0 will restrict the script to Email out Success status of monitor set. Default is 1                |

#### System Properties

| Name                          | Default                                   | Required | Description                                                                                       |
|-------------------------------|-------------------------------------------|----------|---------------------------------------------------------------------------------------------------|
| ProVal_Alerts_Email_Address    | [Alerts@provaltech.com](mailto:Alerts@provaltech.com) | True     | By Default, the system property `ProVal_Alerts_Email_Address` will get set to [alerts@provaltech.com.](mailto:alerts@provaltech.com.) This can be changed in the event these alerts should be going somewhere else. |

![Image](../../../static/img/Automate-Server-Monitoring---Service---Restart-Autofix/image_2.png)

#### Script State

| Name                          | Example | Required | Description                                                                                       |
|-------------------------------|---------|----------|---------------------------------------------------------------------------------------------------|
| `\<SERVICE NAME>_Failure_Email` | 1       | True     | Keep track of whether the failure email has been sent for the `\<SERVICE>` or not.                |

## Process

- Check the status of the Monitor Set.
- Try restarting the service(s).
- Sends an Email to [Alerts@provaltech.com](mailto:Alerts@provaltech.com) creating an urgent ticket in ProVal's AutoTask.

Please reference agnostic content documentation for Service Restart Process.

## Output

- Script Log
- Email












