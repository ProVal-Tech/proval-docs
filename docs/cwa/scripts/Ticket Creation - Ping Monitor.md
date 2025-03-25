---
id: '7cd1193a-c796-4545-b707-758e1b651c22'
slug: /7cd1193a-c796-4545-b707-758e1b651c22
title: 'Ticket Creation - Ping Monitor'
title_meta: 'Ticket Creation - Ping Monitor'
keywords: ['ticket', 'monitor', 'ping', 'alert', 'client']
description: 'This document details a script variation designed for ticket management related to remote ping monitors. It focuses on automatically closing tickets upon successful pings and excludes computer information from ticket creation. The script is intended for use with a specific alert template and includes system properties and sample configurations.'
tags: []
draft: false
unlisted: false
---

## Summary

This script is a variation of the [Ticket Creation - Computer](<./Ticket Creation - Computer.md>) script, designed specifically for ticket management related to remote ping monitors. The key distinction of this script is that it excludes the addition of the computer's information to the ticket.

The script automatically closes the ticket upon successful ping.

## Sample Run

The script is not intended for manual execution. It is explicitly configured to be executed exclusively from the `△ Custom - Ticket Creation - Ping Monitor` alert template.

## Dependencies

Alert Template: `△ Custom - Ticket Creation - Ping Monitor`

## System Properties

| Name                              | Example | Required | Description                                                                                                                                                                                                                                                                                                                                                                    |
|-----------------------------------|---------|----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| _sysPingMonitor_EnableClientTickets | 1       | False    | Set its value to '1' in order to create client tickets under the client corresponding to the IP being pinged in the monitor. The script will match the IP with the router address in the automate and will fetch the corresponding client. If not found, it will create the standard computer tickets on the automate server. By default, its value is '0', which means only standard tickets are enabled. ![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_1.png) |

## Sample Ping Monitor

**Status Tab:**  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_2.png)

**Location Tab:**  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_3.png)

**Alerting Tab:**  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_4.png)

**Subject:** `NTW - Ping Failure - %WHERE%`

**Failure Message:**  
```
Failed to reach/ping %WHERE% from %COMPUTERNAME% (%LocalAddress%).

Result: %RESULT%
```

**%WHERE%:** This variable returns the IPv4 Address or Host Name to ping.  
**%RESULT%:** This variable returns the result from the monitor set.  
**%LocalAddress%:** This variable returns the private address of the local computer where the monitor set is executed.

**Configuration Tab:**  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_5.png)

**History Tab:**  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_6.png)

## Sample Ticket

The script will generate the tickets utilizing the subject and message stored in the Alerting tab of the monitor set.  
![Image](../../../static/img/Ticket-Creation---Ping-Monitor/image_7.png)

## Output

- Ticket


