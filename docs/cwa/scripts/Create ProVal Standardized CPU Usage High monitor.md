---
id: 'cwa-proval-standardized-cpu-usage-high'
title: 'Proval Standardized CPU Usage High Remote Monitoring'
title_meta: 'Proval Standardized CPU Usage High Remote Monitoring'
keywords: ['cpu', 'monitoring', 'alerting', 'configuration', 'performance', 'group', 'threshold']
description: 'This document provides a detailed overview of the Proval Standardized CPU Usage High remote monitoring system, including its setup, variables, user parameters, and sample runs. It is designed to monitor CPU usage and alert when thresholds are violated for a selected group.'
tags: ['monitoring', 'cpu', 'performance', 'alerting', 'configuration', 'group']
draft: false
unlisted: false
---
## Summary

Generates a Proval Standardized CPU Usage High remote monitoring system for a selected group.

## Sample Run

![Sample Run](..\..\..\static\img\Create-ProVal-Standardized-CPU-Usage-High-monitor\image_1.png)

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name               | Description                                                                                      |
|--------------------|--------------------------------------------------------------------------------------------------|
| MonitorName        | ProVal - Production - CPU Threshold Violation Monitor                                            |
| AlertingInfo       | Formatted alerting information where % symbols are exchanged for ╜ symbols so variables do not get assigned to those values. |
| CheckAction        | 6 (External Exe Check)                                                                          |
| AlertAction        | 1 (Default Do Nothing)                                                                           |
| Interval           | 600 seconds                                                                                      |
| GUID               | Random GUID for the Group Monitor                                                                |
| ComparisionString   | State based condition to use with the remote monitor                                             |
| ExecuteString      | Command to run from the remote monitor                                                           |

#### User Parameters

| Name      | Example | Required | Description                                         |
|-----------|---------|----------|-----------------------------------------------------|
| GroupID   | 12545   | True     | The group Id to assign the remote monitor.          |
| SearchID  | 1254    | False    | A limiting search for this remote monitor.          |

## Sample Monitor

**Status Tab:**  
![Status Tab](..\..\..\static\img\Create-ProVal-Standardized-CPU-Usage-High-monitor\image_2.png)

**Alerting Tab:** By Default, the script will set the `Default Do Nothing` template, it must be switched to `Custom - Ticket Creation - Computer` to use the monitor set at its full potential.  
![Alerting Tab](..\..\..\static\img\Create-ProVal-Standardized-CPU-Usage-High-monitor\image_3.png)

**Configuration Tab:**  
![Configuration Tab](..\..\..\static\img\Create-ProVal-Standardized-CPU-Usage-High-monitor\image_4.png)


