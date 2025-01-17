---
id: 'a94dc919-d39c-4787-a585-ae2dc9456d12'
title: 'Enable Screensaver Scheduled Task'
title_meta: 'Enable Screensaver Scheduled Task'
keywords: ['screensaver', 'scheduled', 'task', 'login', 'timeout']
description: 'This document provides a detailed overview of a PowerShell script that creates a scheduled task to enable the screensaver for a specified number of seconds for all users. The settings will be applied at the next log-on, ensuring a consistent user experience across the system.'
tags: ['performance', 'security', 'setup', 'windows']
draft: false
unlisted: false
---
## Summary

Creates a scheduled task that will enable the screensaver for the specified number of seconds for all users. The screensaver settings will be applied at the next log-on of each user.

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Screensaver---Enable-Mystify-Globals/image_1.png)

### Global Parameters

| Name            | Example | Required | Description                                                              |
|-----------------|---------|----------|--------------------------------------------------------------------------|
| TimeoutSeconds  | 900     | True     | The number of seconds before the screensaver will be started.           |
| PromptForLogin  | 1       | True     | Set 0 to not prompt for login after waking, or 1 to prompt.            |

## Process

The script will run a PowerShell script to create a scheduled task that will enable the screensaver for the specified number of seconds for all users. The screensaver settings will be applied at the next login of each user. The PowerShell uses 2 global variables `@TimeoutSeconds@` and `PromptForLogin` set inside the Globals and Parameters tab of the script.

## Output

- Script log












