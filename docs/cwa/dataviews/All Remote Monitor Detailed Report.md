---
id: 'cwa-custom-remote-monitors'
title: 'Custom Remote Monitors Implementation Status'
title_meta: 'Custom Remote Monitors Implementation Status'
keywords: ['remote', 'monitor', 'implementation', 'status', 'alert', 'template']
description: 'This document provides a detailed overview of custom remote monitors, including their implementation status, alert styles, and the scripts used for autofixes. It includes a summary of the columns displayed, color coding for easy identification, and detailed descriptions of each column.'
tags: ['monitoring', 'status', 'alert', 'template', 'script', 'group', 'computers']
draft: false
unlisted: false
---
## Summary

This dataview shows all custom remote monitors with detailed implementation status information.

## Columns

| Column                     | Description                                                                                                                                                                                                                                        |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Monitor                   | Remote monitor name                                                                                                                                                                                                                               |
| Monitor Nature            | This shows whether the remote monitor is a ProVal monitor or a DefaultNon ProVal monitor.                                                                                                                                                        |
| Interval                  | It shows the frequency of the monitor execution in the second format.                                                                                                                                                                            |
| Interval String           | It shows the frequency of the monitor execution in Days, Hours, and Minutes format.                                                                                                                                                               |
| AlertStyle                | This shows the monitor's alert style, which means the number of failures to trigger before alerting.<br>0 - Continuous -> It will trigger an autofix for each failure detected.<br>1 - Once -> It will trigger an alert for one failure and wait for the success to report to re-trigger the autofix again.<br>2 - Twice -> It will trigger an alert for two continuous failures and wait for the success to report to re-trigger the autofix again.<br>3 - Thrice -> It will trigger an alert for three continuous failures and wait for the success to report to re-trigger the autofix again.<br>4 - Fourth -> It will trigger an alert for the four continuous failures and wait for the success to report to re-trigger the autofix again.<br>5 - Fifth -> It will trigger an alert for five continuous failures and wait for the success to report to re-trigger the autofix again.<br>6 - Sixth -> It will trigger an alert for six continuous failures and wait for the success to report to re-trigger the autofix again.<br>7 - Seventh -> It will trigger an alert for seven continuous failures and wait for the success to report to re-trigger the autofix again.<br>8 - Eighth -> It will trigger an alert for eight continuous failures and wait for the success to report to re-trigger the autofix again.<br>9 - Ninth -> It will trigger an alert for nine continuous failures and wait for the success to report to re-trigger the autofix again.<br>10 - Tenth -> It will trigger an alert for ten continuous failures and wait for the success to report to re-trigger the autofix again. |
| Group                     | It shows the target group where the remote monitor is applied.                                                                                                                                                                                  |
| Alert Template            | It contains the alert template applied to the monitor.                                                                                                                                                                                          |
| Alert Template Description | It shows detailed information on the alert template if provided during the creation.                                                                                                                                                           |
| Script                    | It shows the script which is running as an autofix with the monitor via an alert template applied to it.                                                                                                                                       |
| Script Nature             | It shows whether the script used as an autofix is the ProVal script or a default script.                                                                                                                                                       |
| Ticket Category           | It shows the ticket category name to which the ticket will be generated via the autofix alert template.                                                                                                                                         |
| Affected Computers        | It shows the number of agents where the remote monitor is applied.                                                                                                                                                                              |

## Color Coding

Color coding was applied to the columns "Monitor Nature", "Affected Computers", and "Script Nature" as shown below:

![Color Coding](../../../static/img/All-Remote-Monitor-Detailed-Report/image_1.png)

Monitor Nature: The "ProVal Monitor" is highlighted in Green to catch the eye to show the ProVal remote monitors in the environment.  
Script Nature: Here, the "ProVal Script" is highlighted in Green to catch the eye of where the "ProVal" scripts are used as an autofix.  
Affected Computers: Here, the "0" is written in bold/Italic font using Red color to show the remote monitors that are not applied to any computers.



