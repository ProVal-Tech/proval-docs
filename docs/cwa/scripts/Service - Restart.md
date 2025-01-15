---
id: 'e5e1f07f-f6ed-41bc-b0f1-b2cc86e059e1'
title: 'Restart Services Script with Error Handling'
title_meta: 'Restart Services Script with Error Handling'
keywords: ['restart', 'services', 'error', 'handling', 'windows']
description: 'This document outlines a script designed to restart one or more services on Windows machines with comprehensive error handling. It includes implementation steps, dependencies, user parameters, and system properties necessary for successful execution. The script can be triggered through a custom alert template for automated service management.'
tags: ['windows', 'service', 'error', 'notification', 'ticketing']
draft: false
unlisted: false
---
## Summary

This Script will restart one or more services with proper error handling. This script can also be imported and triggered using the Alert Template '△ Custom - Autofix - Restart Service'.

## Implementation

These steps must be followed after importing/updating the script after September 5, 2023.

**Step 1:** Run the script on any online Windows computer. This will create the necessary system properties.

![System Properties](../../../static/img/Service---Restart/image_1.png)

System Properties:

![System Properties](../../../static/img/Service---Restart/image_2.png)

**Step 2:** Set the System properties for alerting. Check the **`System Properties`** section of the document for more information on the properties.

## Sample Run

**Manual Execution:**

![Manual Execution](../../../static/img/Service---Restart/image_3.png)

## Dependencies

- [EPM -Windows Configuration - Agnostic - Invoke-RestartService](https://proval.itglue.com/DOC-5078775-11032222)

### Variables

| Name                     | Description                                                       |
|--------------------------|-------------------------------------------------------------------|
| STATUS                   | Status Returned from Monitor Set (SUCCESS|FAILED)                |
| FieldName                | Service Name returned from Monitor set                             |
| Subject                  | Ticket/Email Subject                                             |
| Body                     | Ticket/Email Body for Failure                                      |
| Comment                  | Ticket/Email Comment For Failure                                   |
| TicketComment             | Ticket Comment For Success                                         |
| EmailBody                | Email Body For Success                                            |
| TicketCreationCategory    | Numerical id of the Ticket category to create the ticket. The script will fetch the ticket category from the monitor set running it. |
| PSCheck                  | To check the powershell version of the computer, the script will perform Automate's inbuilt functions to attempt to restart the service for the older operating system. |

## User Parameters

| Name              | Example                                                      | Required                     | Description                                          |
|-------------------|--------------------------------------------------------------|-------------------------------|------------------------------------------------------|
| ServiceNames      | 'SAAZDPMACTL', 'SAAZWatchDog', 'SAAZServerPlus', 'SAAZScheduler' | True (For Manual Execution)   | A String array of service names to restart.          |
| Set_Environment    | 1                                                            | True (For First run)         | Set it to 1 to create the required system properties. |

## System Properties

| Name                                           | Example | Required                | Description                                                                                       |
|------------------------------------------------|---------|-------------------------|---------------------------------------------------------------------------------------------------|
| Restart_Service_Autofix_Ticketing_Enabled     | 1       | True                    | 1 and 0 to toggle between the ticket creation feature of the script. The default value is 1 (Enabled Ticketing). |
| Restart_Service_Autofix_Emailing_Enabled      | 0       | False                   | 1 and 0 to toggle between the Emailing feature of the script. The default value is 0. (Disable Emailing) |
| Restart_Service_Autofix_Send_Success_Email     | 0       | False                   | Set it to 1 to send an email on monitor success as well. The default value is 0. To Enable Monitor Success emails, `Restart_Service_Autofix_Emailing_Enabled` must be set to 1. |
| _sysTicketDefaultEmail                          | [support@provaltech.com](mailto:support@provaltech.com) | True (if emailing is enabled) | Email address to notify, it is mandatory to set the email address(es) if the system property `Restart_Service_Autofix_Emailing_Enabled` is set to 1. Multiple email addresses should be separated by a semicolon. **Note: Please be careful while making any changes to this property as this is a default system property and another script(s) might have been using this as well. Do not update the email address(es) saved in this property without checking the other scripts for this system property.** |

## Ticket Category

Script will fetch the ticket category from the monitor set running the script.

From individual machine:  
![Individual Machine](../../../static/img/Service---Restart/image_4.png)

From Group Monitor:  
![Group Monitor](../../../static/img/Service---Restart/image_5.png)

## Output

- Script log (for detailed information on individual results)
- Tickets (if enabled)
- Emails (if enabled)







