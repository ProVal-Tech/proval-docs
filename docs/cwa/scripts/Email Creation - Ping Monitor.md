---
id: 'cwa-email-ping-monitor-management'
title: 'Email Management for Ping Monitors'
title_meta: 'Email Management for Ping Monitors'
keywords: ['email', 'ping', 'monitor', 'alert', 'ticket']
description: 'This document details a script designed for managing emails related to remote ping monitors, including system properties and global parameters necessary for configuration. It is intended for use within a specific alert template and provides examples of expected output and configuration settings.'
tags: ['alert', 'configuration', 'monitor', 'email', 'ticket']
draft: false
unlisted: false
---
## Summary

This script is an email version of [CWM - Automate - Script - Ticket Creation - Ping Monitor](https://proval.itglue.com/DOC-5078775-15313843). It will manage emails related to remote ping monitors.

## Sample Run

The script is not intended for manual execution. It is explicitly configured to be executed exclusively from the `△ Custom - Email Creation - Ping Monitor` alert template.

## Dependencies

Alert Template: `△ Custom - Email Creation - Ping Monitor`

## System properties

| Name                       | Required | Example                             | Description                                                                                                    |
|----------------------------|----------|-------------------------------------|----------------------------------------------------------------------------------------------------------------|
| _sysPingMonitorDefaultEmail | False    | [xyz@something.com](mailto:xyz@something.com) | Add in the email address where the partner would like to receive the alerts from ping monitors                |
| _sysTicketDefaultEmail     | True     | [xyz@something.com](mailto:xyz@something.com) | If nothing is mentioned in _sysPingMonitorDefaultEmail property, script will use the default email address from _sysTicketDefaultEmail property. |

*Note: Create this system property `_sysPingMonitorDefaultEmail` under system → Dashboard → Config → Properties before executing this system anywhere if client would like to use specific email address for ping monitors.*

## Global Parameters

| Name            | Required | Example | Description                                                                                                           |
|-----------------|----------|---------|-----------------------------------------------------------------------------------------------------------------------|
| Email_On_Success | False    | 1       | Set it to 1 to receive success email alerts. Leave it blank or set it to 0 in case the partner doesn't want success email alerts. |

## Sample Ping Monitor

**Status Tab:**  
![Status Tab](..\..\..\static\img\Email-Creation---Ping-Monitor\image_1.png)

**Location Tab:**  
![Location Tab](..\..\..\static\img\Email-Creation---Ping-Monitor\image_2.png)

**Alerting Tab:**  
![Alerting Tab](..\..\..\static\img\Email-Creation---Ping-Monitor\image_3.png)

**Subject:** `NTW - Ping Failure - %WHERE%`

**Failure Message:**  
`Failed to reach/ping %WHERE% from %COMPUTERNAME% (%LocalAddress%).`

`Result: %RESULT%`

**%WHERE%:** `This variable returns the IPv4 Address or Host Name to ping.`  
**%RESULT%:** `This variable return the result from the monitor set.`  
**%LocalAddress%:** `This variable returns the private address of the local computer where the monitor set is executed.`

**Configuration Tab:**  
![Configuration Tab](..\..\..\static\img\Email-Creation---Ping-Monitor\image_4.png)

**History Tab:**  
![History Tab](..\..\..\static\img\Email-Creation---Ping-Monitor\image_5.png)

## Output

- Email


