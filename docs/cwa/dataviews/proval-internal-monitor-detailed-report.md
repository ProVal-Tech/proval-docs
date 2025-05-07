---
id: 'ad298109-c6b4-4af4-8ef1-37ba43db737f'
slug: /ad298109-c6b4-4af4-8ef1-37ba43db737f
title: 'ProVal Internal Monitor Detailed Report'
title_meta: 'ProVal Internal Monitor Detailed Report'
keywords: ['monitors', 'status', 'alert', 'template', 'script', 'failure', 'scan', 'group']
description: 'This document provides a detailed overview of custom internal monitors built by ProVal, including their implementation status, alert styles, and execution intervals. It also outlines the color coding used to highlight monitor statuses and script types for easier identification.'
tags: ['software']
draft: false
unlisted: false
---

## Summary

This document provides a comprehensive overview of all custom internal monitors built by ProVal, along with detailed implementation status information.

## Columns

| Column                   | Description                                                                                                                             |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Monitor                 | Internal monitor name.                                                                                                                 |
| Monitor Status          | Indicates whether the monitor is disabled or enabled.                                                                                  |
| Fail Count              | The number of times the monitor has failed.                                                                                             |
| Interval                | The frequency of the monitor's execution in seconds.                                                                                    |
| Interval String         | The frequency of the monitor's execution in Days, Hours, and Minutes format.                                                           |
| Alert Style             | Describes the monitor's alert style, indicating the number of failures required to trigger an alert.                                   |
|                         | 0 - Send Fail After Success: Triggers an alert for each failure and waits for success to report to re-trigger the autofix.            |
|                         | 1 - Once Per Day: Triggers an alert for a failure once per day.                                                                       |
|                         | 2 - Once Per 2 Days: Triggers an alert for a failure once every 2 days.                                                                |
|                         | 3 - Once Per 3 Days: Triggers an alert for a failure once every 3 days.                                                                |
|                         | 4 - Once Per 4 Days: Triggers an alert for a failure once every 4 days.                                                                |
|                         | 5 - Once Per 5 Days: Triggers an alert for a failure once every 5 days.                                                                |
|                         | 6 - Once Per 6 Days: Triggers an alert for a failure once every 6 days.                                                                |
|                         | 7 - Once Per 7 Days: Triggers an alert for a failure once every 7 days.                                                                |
|                         | 8 - Once Per 30 Days: Triggers an alert for a failure once every 30 days.                                                              |
|                         | 9 - Once Per 60 Days: Triggers an alert for a failure once every 60 days.                                                              |
|                         | 10 - Once Per 90 Days: Triggers an alert for a failure once every 90 days.                                                             |
|                         | 11 - Once Per Year: Triggers an alert for a failure once per year.                                                                     |
|                         | 12 - Once Per 5 Years: Triggers an alert for a failure once every 5 years.                                                             |
| Last Scan               | The last scan date of the internal monitor.                                                                                             |
| Last Failure            | The date of the last failure detected by the internal monitor.                                                                          |
| Next Scan               | The next upcoming scan date of the internal monitor.                                                                                    |
| Group                   | The targeted group if the monitor is applied to a specific group. A blank entry denotes that the monitor is applied globally.            |
| Alert Template          | The alert template applied to the monitor for the targeted group or globally.                                                           |
| Alert Template Description | Detailed information on the alert template, if provided during creation.                                                              |
| Script                  | The script running as an autofix with the monitor via the applied alert template.                                                      |
| Script Nature           | Indicates whether the autofix script is a ProVal Script or a Default script.                                                           |
| Ticket Category         | The ticket category name for the ticket generated via the autofix alert template.                                                      |
| Monitor Synced/Updated  | Indicates whether the internal monitor was synced from the ProSync plugin.                                                              |

## Color Coding

Color coding is applied to the columns "Monitor Status," "Script Nature," and "Monitor Synced/Updated" as shown below:

![Color Coding](../../../static/img/docs/ad298109-c6b4-4af4-8ef1-37ba43db737f/image_1.png)

**Monitor Status:** The "Disabled" font is highlighted in bold/italic red to draw attention to disabled monitors.

**Script Nature:** The "ProVal Script" is highlighted in green to indicate where ProVal scripts are used as autofixes.

**Monitor Synced/Updated:** "Yes" is highlighted in green, "No" in red, and "N/A" in grey to easily show whether the monitor is properly synced/updated from the ProVal plugin.

