---
id: 'rmm-reboot-prompter-solution'
title: 'Reboot Prompter Solution'
title_meta: 'Reboot Prompter Solution'
keywords: ['reboot', 'prompt', 'automation', 'ticket', 'monitoring', 'dynamic', 'group']
description: 'This document outlines the Reboot Prompter Solution designed to send reboot prompts to users on workstations, enforce automatic reboots after a specified number of attempts, and generate tickets for servers with pending reboots. It includes both automatic and manual reboot features to ensure OS patching stability.'
tags: ['monitoring', 'dynamic', 'ticket', 'reboot', 'configuration', 'windows', 'setup']
draft: false
unlisted: false
---
## Purpose

This solution is built to send the reboot prompt popup to the user's screen on workstations and set it to reboot forcefully after several attempts set in the custom field to maintain the OS patching stability. It has both Auto and manual reboot pending automation features. It also has a feature to generate tickets for the servers where reboot pending is detected.

## Associated Content

| Content                                                                                       | Type          | Function                                                                                                                                                                                                                                            |
|-----------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948)                   | Task          | The script prompts the user to reboot with a simple yes or no prompt. It also forces a reboot after the PromptRebootCount is crossed.                                                                                                           |
| [Task - Reboot Pending Check Automation](https://proval.itglue.com/DOC-5078775-15317845)    | Task          | This task is designed to detect the reboot pending on the endpoints automatically and check the custom field 'Auto_RebootPendingCheck' so that the agent gets added to the dynamic group [CW RMM - Dynamic Group - Reboot Prompter Deployment - Auto](https://proval.itglue.com/DOC-5078775-15317821). |
| [Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)           | Custom Fields | It contains all custom fields detail which has task and deployment dependencies.                                                                                                                                                                 |
| [Dynamic Group - Reboot Prompter Deployment - Manual](https://proval.itglue.com/DOC-5078775-15298947) | Dynamic Group | This dynamic group depends on the endpoint custom field 'Prompter_RebootPending' flag should be checked and the agent should be available to check in to the group.                                                                                 |
| [Dynamic Group - Reboot Prompter Deployment - Auto](https://proval.itglue.com/DOC-5078775-15317821) | Dynamic Group | This dynamic group depends on the endpoint custom field 'Auto_RebootPendingCheck' flag should be checked and the agent should be available to check in to the group.                                                                                 |
| [Dynamic Group - Automatic Reboot Pending Check](https://proval.itglue.com/DOC-5078775-15317846) | Dynamic Group | This group is designed to schedule the task 'Automatic Reboot Pending Check' to set the auto reboot pending automation by checking the custom field 'Auto_RebootPendingCheck'.                                                                         |
| [Dynamic Group - Reboot Pending Servers](https://proval.itglue.com/DOC-5078775-15488656)    | Dynamic Group | This group contains the server endpoint where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.                                          |
| [Monitor - Reboot Pending - Servers](https://proval.itglue.com/DOC-5078775-15488664)        | Monitor       | This monitor creates a ticket on servers where the reboot is pending. It detects only supported Windows servers i.e. 2016, 2019, and 2022 and it only works when the Reboot Prompter Solution is activated.                                          |

## Implementation

- Create the [Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)
- Create the [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948)
- Create the [Task - Reboot Pending Check Automation](https://proval.itglue.com/DOC-5078775-15317845)
- Create the [Dynamic Group - Reboot Prompter Deployment - Manual](https://proval.itglue.com/DOC-5078775-15298947)
- Create the [Dynamic Group - Reboot Prompter Deployment - Auto](https://proval.itglue.com/DOC-5078775-15317821)
- Create the [Dynamic Group - Automatic Reboot Pending Check](https://proval.itglue.com/DOC-5078775-15317846)
- Create the [Dynamic Group - Reboot Pending Servers](https://proval.itglue.com/DOC-5078775-15488656)
- Create the [Monitor - Reboot Pending - Servers](https://proval.itglue.com/DOC-5078775-15488664)
- Schedule the [Task - Reboot Pending Check Automation](https://proval.itglue.com/DOC-5078775-15317845) at the [Dynamic Group - Automatic Reboot Pending Check](https://proval.itglue.com/DOC-5078775-15317846) every 2 hours.
  - Follow the deployment instructions in the [Task - Reboot Pending Check Automation](https://proval.itglue.com/DOC-5078775-15317845).
- Schedule the [Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948) at the [Dynamic Group - Reboot Prompter Deployment - Manual](https://proval.itglue.com/DOC-5078775-15298947) and the [Dynamic Group - Reboot Prompter Deployment - Auto](https://proval.itglue.com/DOC-5078775-15317821) as per client requirement to send prompt every how much interval.
  - Follow the deployment instructions in the task [CW RMM - Task - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298948).
- Schedule the monitor [Monitor - Reboot Pending - Servers](https://proval.itglue.com/DOC-5078775-15488664) to target group [Dynamic Group - Reboot Pending Servers](https://proval.itglue.com/DOC-5078775-15488656) to create a ticket for the reboot pending on the servers.

## FAQ

The script popup screenshot:

Send Yes No Prompt option for attempts equal to [@RebootPromptCount@](http://@RebootPromptCount@).  
Note: The x time (s) depends on the count it prompted the user and "4" before being forced to reboot depends on the threshold set at the site-level custom field "RebootPromptCount".

![Screenshot](../../static/img/Reboot-Prompter/image_68.png)

Afterward, it sends a force reboot prompt as shown below:  
Note: The 5 minutes depends on the value provided in the custom field 'RebootForceTimeDelayMinutes'.

![Screenshot](../../static/img/Reboot-Prompter/image_69.png)



