---
id: 'f63c0791-3057-4e90-888e-ae6f2ada558a'
title: 'Email Notification Script for Monitors'
title_meta: 'Email Notification Script for Monitors'
keywords: ['email', 'monitor', 'alerts', 'notification', 'sql']
description: 'This document outlines an email notification script designed for use with monitoring templates. It details how the script sends emails based on specific alert templates and includes important notes on compatibility with different monitor types. The document also provides a comprehensive overview of the variables and global parameters utilized in the script.'
tags: ['email', 'sql']
draft: false
unlisted: false
---

## Summary

This script functions similarly to the [CWM - Automate - Script - Ticket Creation - Computer](<./Ticket Creation - Computer.md>) script; however, instead of creating a ticket, it is designed to send an email to the email address provided in the system property.

This script sends emails to two different addresses:

1. If the script is called by the alert template “**△ Custom - Email RAWSQL Monitor set results to ProVal**,” it will send an email to the address set in the system property “ProVal_Alerts_Email_Address,” which is typically set to “[alerts@provaltech.com](mailto:alerts@provaltech.com).”  
   **Note:** If the property is missing, the script will automatically set it to “[alerts@provaltech.com](mailto:alerts@provaltech.com),” but if it is set to a different email address, it will not be modified.

2. If the script is called by any other template, it will fetch the email address from the system property “_sysTicketDefaultEmail.”

## Sample Run

This script should be utilized as an autofix for a monitor.

## Important Notes on Using This with Monitors

- Monitors can be tricky with this; in most cases, remote monitors will work fine. However, in some cases, internal monitors may not be compatible with this solution. This can be due to the utilization of `set @something =` in the monitor. You should avoid this in your internal RAWSQL monitors if the result is going to be used with this solution.
- If you can place your SQL inside a select statement in parentheses and it works, you should be fine (tcomps are adjusted for).
  - For instance, if `select youridentityfield from ( [your select statement] ) s Where your select computerid is equal to the computer id for the script` works, then this solution should work for you.

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name          | Description                                                                 |
|---------------|-----------------------------------------------------------------------------|
| VarLog        | A running variable holding the logged results.                             |
| BiosName      | Used when the monitor calls this script to set up the email body.          |
| BiosVer       | Used when the monitor calls this script to set up the email body.          |
| Name          | The name of the monitor.                                                   |
| MonitorType   | Used to determine remote vs internal monitor.                              |
| RAWSQL        | Used to recreate the monitor results to ensure overflowed variables are not present from the monitor. |
| DataOut       | Used to recreate the monitor results to ensure overflowed variables are not present from the monitor. |
| FieldName     | The field name from the monitor.                                           |
| Result        | The result from the monitor.                                               |
| SuccessMSG    | Self-explanatory.                                                         |
| FailedMSG     | Self-explanatory.                                                         |
| EmailCreateBody | The formatted body for the email creation.                               |
| Tcomp         | Used to remove the tcomp line from the query.                             |

#### Global Parameters

| Name           | Example   | Required | Description                                                                 |
|----------------|-----------|----------|-----------------------------------------------------------------------------|
| EmailOnSuccess | 0 or 1   | True     | 0 disables emailing a success email. 1 enables emailing a success email.  |

## Output

- Email

