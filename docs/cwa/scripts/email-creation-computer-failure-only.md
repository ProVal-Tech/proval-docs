---
id: '901470a2-73d2-4d29-b0d3-c5f15cf19c41'
slug: /901470a2-73d2-4d29-b0d3-c5f15cf19c41
title: 'Email Creation - Computer Failure Only'
title_meta: 'Email Creation - Computer Failure Only'
keywords: ['email', 'rawsql', 'monitor', 'failure', 'notification']
description: 'This document describes a script designed to send email notifications for failed outcomes of a RAWSQL monitor. It details the email addresses used for notifications, system properties required, and the process flow for handling failures. The script is linked to a specific alert template and includes configuration for success email notifications.'
tags: ['email']
draft: false
unlisted: false
---

## Summary

This script functions similarly to the [CWM - Automate - Script - Ticket Creation - Computer](/docs/63beba3c-f4a6-41a5-98e2-d4e4ce885035) script; however, instead of creating a ticket, it is designed to send the FAILED outcomes of a RAWSQL monitor to the email address provided in the system property.

This script sends emails to two different addresses:

1. If the script is called by the alert template "**△ Custom - Email RAWSQL Monitor set results to ProVal**", it will send an email to the email address set at the system property "ProVal_Alerts_Email_Address", which is typically set to "[alerts@provaltech.com](mailto:alerts@provaltech.com)".  
   **Note:** If the property is missing, the script will automatically set it to "[alerts@provaltech.com](mailto:alerts@provaltech.com)", but if it is set to a different email address, then it will not be modified.

2. If the script is called by any other template, it will fetch the email address from the system property "_sysTicketDefaultEmail".

**Note:** The script is designed to send only failure messages/emails.

## Sample Run

It's an Autofix script and is currently attached to the "△ Custom - Email RAWSQL Monitor set results to ProVal" alert template.

![Sample Run](../../../static/img/docs/901470a2-73d2-4d29-b0d3-c5f15cf19c41/image_1.webp)

## System Property

| Name                          | Example                      | Required | Description                                                                                                                                                                                                                               |
|-------------------------------|------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| _sysTicketDefaultEmail        | [test@test.com](mailto:test@test.com) | Yes      | This email address is used when the script is called from an alert template other than "**△ Custom - Email RAWSQL Monitor set results to ProVal**".                                                                                         |
| ProVal_Alerts_Email_Address    | [alerts@provaltech.com](mailto:alerts@provaltech.com) | Yes      | This email address is used when the script is called from the alert template "**△ Custom - Email RAWSQL Monitor set results to ProVal**". **Note:** It is mandatory to use [alerts@provaltech.com](mailto:alerts@provaltech.com) with this system property as it is intentionally created for alerts that need to be passed on to the ProVal support team from the partner environment. |

## Global Parameter

| Name          | Example | Required | Description                                                                                 |
|---------------|---------|----------|---------------------------------------------------------------------------------------------|
| EmailOnSuccess| 0       | True     | 0 disables emailing a success email; 1 enables emailing a success email.                |

## Variables

| Name          | Description                                                       |
|---------------|-------------------------------------------------------------------|
| FIELDNAME     | Identity Field of the monitor set                                 |
| TicketSubject | Ticket Subject from the alerting tab of the monitor set          |
| SuccessMSG    | Success Message from the alerting tab of the monitor set         |
| FailedMSG     | Failure Message from the alerting tab of the monitor set         |
| Status        | FAILED/SUCCESS status of the monitor set                          |
| Email         | Email address of the contact/user used in the alert template     |
| Dataout       | Monitor set's statement                                           |
| Dataoutlength | Position of the last parentheses in the monitor set's query; this is calculated to remove (select computerid from tcomp) from the monitor set's statement. Keeping this statement will lead to the script's failure. |
| Monitor       | Name of the monitor set                                           |

## Process

1. Check the status of the monitor set and do not act for Success.
2. For failures, proceed accordingly.
3. Store the SQL query used in the monitor set to the @Dataout@ variable. Also, replace 'from tcomp' with 'from computers', if it exists in the SQL query. To perform this replacement, convert the whole query to lowercase.
4. Find the FieldName, TicketSubject, SuccessMSG, FailedMSG, and Email.
5. Email the outcome to the email address of the user/contact of the alert template.

## Output

Email