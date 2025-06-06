---
id: '71b6a39c-0d61-4959-8f1e-69b1cc84d182'
slug: /71b6a39c-0d61-4959-8f1e-69b1cc84d182
title: 'Online Status Alerting - Autofix - Update Ticket + Email EDF'
title_meta: 'Online Status Alerting - Autofix - Update Ticket + Email EDF'
keywords: ['online', 'status', 'alerting', 'ticket', 'management', 'notification']
description: 'This document provides an overview of the Online Status Alerting Auto-Fix script designed to manage ticket statuses when machines come back online or are restarted. It details the required system properties and user parameters, along with dependencies and sample runs to guide users in implementing the script effectively.'
tags: ['alerting', 'email']
draft: false
unlisted: false
---

## Summary

This script will run as an auto-fix for the [Online Status Alerting - Machine Back Online](/docs/76fa2909-0cc0-4f76-82a0-c067660d52ac) and [Online Status Alerting - Machine Restarted](/docs/b2fbe440-9d16-41ae-bd52-14037790697f) monitor sets. It uses the system properties `Email_Connector_email_Address` and `Status_To_Change_To` for the email connector's email address and the ticket status to which the client wants to change.

The script changes the status of the ticket if the EDF "Online Alert Ticket ID" at the computer level is filled with a Ticket ID, or if the Email ID is filled in the EDF "Online Alert E-mail." It will change the status along with a message. Users can also provide a reason for the notification by filling in the reason in the EDF "Online Alert Reason."

Additionally, filling out the "Online Alert Scripts" will run a list of scripts after the machine comes back online.

## Sample Run

The script is designed to run from the [Online Status Alerting - Machine Back Online](/docs/76fa2909-0cc0-4f76-82a0-c067660d52ac) and [Online Status Alerting - Machine Restarted](/docs/b2fbe440-9d16-41ae-bd52-14037790697f) monitor sets only and should not be executed manually against any machine, except for the first time to set the environment.

After importing the script, it should either be debugged or run against any computer in the environment with `1` in the user parameter `SetEnvironment`, along with the other user parameters `Email_Connector_email_Address` and `Status_To_Change_To`.

**NOTE:** The user parameters `Email_Connector_email_Address` and `Status_To_Change_To` are required to be filled only by running the script for the first time after importing it. This sets the system properties on its first run.

![Image](../../../static/img/docs/71b6a39c-0d61-4959-8f1e-69b1cc84d182/image_1_1.webp)

## Dependencies

- [CWM - Automate - Script - Online Status Alerting - Update EDFs [Param]](/docs/79f11a31-7ae1-4e12-a9d7-581e809aaa2e)

### System Properties

- `Status_To_Change_To`: The ticket status the client wants to change to.
- `Email_Connector_email_Address`: The email address of the email connector.

## User Parameters

| Parameter Name                     | Example                | Required                    | Description                                                                                                                                          |
|------------------------------------|------------------------|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| `SetEnvironment`                   | 1                      | True for first run only     | Set it to 1 for the first run after importing the script. This will create the System Properties needed for the solution.                          |
| `Email_Connector_email_Address`    | [abc@xyz.com](mailto:abc@xyz.com) | True for first run only     | The email address of the email connector. This will help link the email system with ticketing. THIS SHOULD BE USED ONLY WITH SetEnvironment = 1.       |
| `Status_To_Change_To`              | Requeued               | True for first run only     | The ticket status the client wants to change to. THIS SHOULD BE USED ONLY WITH SetEnvironment = 1.                                                      |

## Variables

| Name                             | Description                                                                                                           |
|----------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| `Subject`                        | Email Subject                                                                                                         |
| `Body`                           | Email Content                                                                                                         |
| `TicketID`                       | Ticket ID specified in the Computer EDF "Online Alert Ticket ID" for which the user wants to change the status in Manage. |
| `Reason`                         | Reason specified in the Computer EDF "Online Alert Reason"                                                           |
| `Email`                          | Email ID of the recipient who wants to be notified via email if the machine comes back online.                      |
| `ScriptIDs`                      | The scripts to run against the machine after it comes back online.                                                  |
| `Email_Connector_email_Address`  | The email address of the email connector.                                                                               |
| `Status_To_Change_To`           | The ticket status the client wants to change to.                                                                       |

## Script States

| State                             | Example | Required | Description                                                                                                           |
|-----------------------------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------|
| `Restarted_Machine_Notification_Uptime` | 4846    | True     | Stores the current uptime of the computer for the machines with the `Online Alert Restarted Machine` flag set.        |

## Output

- Email
- Ticket status change to the desired status as per configuration done in the system property "Status_To_Change_To."