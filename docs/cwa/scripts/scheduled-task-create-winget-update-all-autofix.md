---
id: '4bb08610-f80b-4c5a-8e13-b6db095484c1'
slug: /4bb08610-f80b-4c5a-8e13-b6db095484c1
title: 'Scheduled Task - Create - Winget Update All Autofix'
title_meta: 'Scheduled Task - Create - Winget Update All Autofix'
keywords: ['winget', 'scheduled', 'tasks', 'update', 'windows']
description: 'This document provides an overview of a script that establishes scheduled tasks for Winget updates on Windows 10 and 11. It details the parameters, system properties, and the behavior of user-level scheduled tasks, including how to enable and configure them.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

The script establishes two scheduled tasks on the computer: `Winget Update All [System]` and `Winget Update All [Logged on User]`. The `Winget Update All [System]` task executes Winget's upgrade of all commands upon system boot (after network connection) under the SYSTEM context. Meanwhile, the `Winget Update All [Logged on User]` task initiates Winget's upgrade of all commands upon user login.

The system property `Winget_Disable_User_Level_Scheduled_Task` can be used to enable the `Winget Update All [Logged on User]` task. By default, `Winget_Disable_User_Level_Scheduled_Task` is set to 1, which means it is disabled.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif) Be aware that the user-level scheduled task `Winget Update All [Logged on User]` may prompt for UAC to the logged-in user if enabled. ![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

**Note:** The script is explicitly limited to Windows 10 and 11.

## Sample Run

For the initial execution of the script, target any online Windows 10 or Windows 11 computer. Set the `SetEnvironment` parameter to `1` to create the system property and the EDF.

![Initial Execution](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_1.webp)

Regular execution of the script:

![Regular Execution](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_2.webp)

## User Parameters

| Name                | Example | Mandatory | Description                                                                                     |
|---------------------|---------|-----------|-------------------------------------------------------------------------------------------------|
| SetEnvironment       | 1       | False     | Set the `SetEnvironment` parameter to `1` during the initial execution of the script to create the system property and EDF. |

## System Properties

| Name                                          | Default | Mandatory | Description                                                                                                           |
|-----------------------------------------------|---------|-----------|-----------------------------------------------------------------------------------------------------------------------|
| Winget_Disable_User_Level_Scheduled_Task     | 1       | False     | Set the `Winget_Disable_User_Level_Scheduled_Task` system property to `0` to enable the `Winget Update All [Logged on User]` task on the endpoints. |

![System Properties](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_3.webp)

## Client Level EDF

| Name                               | Type      | Section     | Description                                                                                          |
|------------------------------------|-----------|-------------|------------------------------------------------------------------------------------------------------|
| Winget Update All Task - Create    | Check-Box | Winget Task | Marking this EDF will enable the Winget Upgrade All Tasks creation on the endpoints of the client.   |
| Winget User Level Task - Disable    | Check-Box | Winget Task | Mark this EDF to disable the `Winget Update All [Logged on User]` task on the endpoints of the client. |

![Client Level EDF](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_4.webp)

## Location Level EDF

| Name                               | Type      | Section     | Description                                                                                          |
|------------------------------------|-----------|-------------|------------------------------------------------------------------------------------------------------|
| Winget Update All Task - Exclude    | Check-Box | Exclusions  | Marking this EDF will exclude the computers from the Winget Update - All task creation solution.     |

![Location Level EDF](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_5.webp)

## Computer Level EDF

| Name                               | Type      | Section     | Description                                                                                          |
|------------------------------------|-----------|-------------|------------------------------------------------------------------------------------------------------|
| Winget_update_all_task_created     | Check-Box | Default     | The EDF tracks the success of task creation on each computer. After successfully creating the tasks, the script sets a flag in this EDF. The [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update](/docs/2f324c74-1e32-4c48-b567-abbeebdabe6d) will not target machines where this EDF is flagged. Resetting this EDF, as described in the [Reset - Extra Data Field - Winget_update_all_task_created](/docs/f5286dd2-1161-4580-8060-d113b3ab28b7) article, will prompt the internal monitor to execute the script again. This EDF should not be updated manually. |
| Winget Update All Task - Exclude    | Check-Box | Exclusions  | Marking this EDF will exclude the computer from the Winget Update - All task creation solution.     |

## Additional Notes

When the `Winget Update All [Logged on User]` task is enabled, a command window will briefly appear on the user's screen within a few minutes after they log in. This window will continue to pop up every time the task runs, i.e., when the user logs in again after logging out or restarting the computer. The total time it will be on the screen is a second or two, but it might create questions from certain clients.

![Additional Notes](../../../static/img/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1/image_6.webp)

## Output

- Script log
- Extra Data Field