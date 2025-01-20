---
id: '5b376f62-e977-4feb-b523-b133d2ef5722'
title: 'Reboot Prompter Solution'
title_meta: 'Reboot Prompter Solution'
keywords: ['reboot', 'prompt', 'automation', 'ticket', 'monitoring', 'dynamic', 'group']
description: 'This document outlines the Reboot Prompter Solution designed to send reboot prompts to users on workstations, enforce automatic reboots after a specified number of attempts, and generate tickets for servers with pending reboots. It includes both automatic and manual reboot features to ensure OS patching stability.'
tags: ['reboot', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

This solution is built to send the reboot prompt popup to the user's screen on workstations and set it to reboot forcefully after several attempts set in the custom field to maintain the OS patching stability. It has both Auto and manual reboot pending automation features. It also has a feature to generate tickets for the servers where reboot pending is detected.

## Associated Content

| Content                                                                                       | Type          | Function                                                                                                                                                                                                                                            |
|-----------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948)                   | Task          | The script prompts the user to reboot with a simple yes or no prompt. It also forces a reboot after the PromptRebootCount is crossed.                                                                                                           |
| [Task - Reboot Pending Check Automation](<../cwrmm/tasks/Reboot Pending Check Automation.md>)    | Task          | This task is designed to detect the reboot pending on the endpoints automatically and check the custom field 'Auto_RebootPendingCheck' so that the agent gets added to the dynamic group [CW RMM - Dynamic Group - Reboot Prompter Deployment - Auto](<../cwrmm/groups/Reboot Prompter Deployment - Auto.md>). |
| [Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)           | Custom Fields | It contains all custom fields detail which has task and deployment dependencies.                                                                                                                                                                 |
| [Dynamic Group - Reboot Prompter Deployment - Manual](<../cwrmm/groups/Reboot Prompter Deployment - Manual.md>) | Dynamic Group | This dynamic group depends on the endpoint custom field 'Prompter_RebootPending' flag should be checked and the agent should be available to check in to the group.                                                                                 |
| [Dynamic Group - Reboot Prompter Deployment - Auto](<../cwrmm/groups/Reboot Prompter Deployment - Auto.md>) | Dynamic Group | This dynamic group depends on the endpoint custom field 'Auto_RebootPendingCheck' flag should be checked and the agent should be available to check in to the group.                                                                                 |
| [Dynamic Group - Automatic Reboot Pending Check](<../cwrmm/groups/Automatic Reboot Pending Check.md>) | Dynamic Group | This group is designed to schedule the task 'Automatic Reboot Pending Check' to set the auto reboot pending automation by checking the custom field 'Auto_RebootPendingCheck'.                                                                         |
| [Dynamic Group - Reboot Pending Servers](<../cwrmm/groups/Reboot Pending Servers.md>)    | Dynamic Group | This group contains the server endpoint where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.                                          |
| [Monitor - Reboot Pending - Servers](<../cwrmm/monitors/Reboot Pending - Servers.md>)        | Monitor       | This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.                                          |

## Implementation

- Create the [Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)
- Create the [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948)
- Create the [Task - Reboot Pending Check Automation](<../cwrmm/tasks/Reboot Pending Check Automation.md>)
- Create the [Dynamic Group - Reboot Prompter Deployment - Manual](<../cwrmm/groups/Reboot Prompter Deployment - Manual.md>)
- Create the [Dynamic Group - Reboot Prompter Deployment - Auto](<../cwrmm/groups/Reboot Prompter Deployment - Auto.md>)
- Create the [Dynamic Group - Automatic Reboot Pending Check](<../cwrmm/groups/Automatic Reboot Pending Check.md>)
- Create the [Dynamic Group - Reboot Pending Servers](<../cwrmm/groups/Reboot Pending Servers.md>)
- Create the [Monitor - Reboot Pending - Servers](<../cwrmm/monitors/Reboot Pending - Servers.md>)
- Schedule the [Task - Reboot Pending Check Automation](<../cwrmm/tasks/Reboot Pending Check Automation.md>) at the [Dynamic Group - Automatic Reboot Pending Check](<../cwrmm/groups/Automatic Reboot Pending Check.md>) every 2 hours.
  - Follow the deployment instructions in the [Task - Reboot Pending Check Automation](<../cwrmm/tasks/Reboot Pending Check Automation.md>).
- Schedule the [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948) at the [Dynamic Group - Reboot Prompter Deployment - Manual](<../cwrmm/groups/Reboot Prompter Deployment - Manual.md>) and the [Dynamic Group - Reboot Prompter Deployment - Auto](<../cwrmm/groups/Reboot Prompter Deployment - Auto.md>) as per client requirement to send prompt every how much interval.
  - Follow the deployment instructions in the task [CW RMM - Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948).
- Schedule the monitor [Monitor - Reboot Pending - Servers](<../cwrmm/monitors/Reboot Pending - Servers.md>) to target group [Dynamic Group - Reboot Pending Servers](<../cwrmm/groups/Reboot Pending Servers.md>) to create a ticket for the reboot pending on the servers.

## FAQ

The script popup screenshot:

Send Yes No Prompt option for attempts equal to [RebootPromptCount](http://RebootPromptCount).  
Note: The x time (s) depends on the count it prompted the user and "4" before being forced to reboot depends on the threshold set at the site-level custom field "RebootPromptCount".

![Screenshot](../../static/img/Reboot-Prompter/image_68.png)

Afterward, it sends a force reboot prompt as shown below:  
Note: The 5 minutes depends on the value provided in the custom field 'RebootForceTimeDelayMinutes'.

![Screenshot](../../static/img/Reboot-Prompter/image_69.png)












