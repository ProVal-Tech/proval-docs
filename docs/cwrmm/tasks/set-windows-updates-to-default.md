---
id: '41c0732d-0740-40d4-bd2f-98edd91cc559'
slug: /41c0732d-0740-40d4-bd2f-98edd91cc559
title: 'Set Windows Updates to Default'
title_meta: 'Set Windows Updates to Default'
keywords: ['windows', 'updates', 'registry', 'default', 'settings']
description: 'This document provides a detailed guide on removing registry entries that may prevent Windows updates and restoring the default Windows Update settings to fully re-enable updates for users. It includes step-by-step instructions for task creation and implementation using a PowerShell script.'
tags: ['registry', 'software', 'update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This task removes any registry entries that may be preventing Windows updates and restores the default Windows Update settings, fully re-enabling updates for the user.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_2.webp)  
![Sample Run Image 2](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_3.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_4.webp)  
![Task Creation Image 2](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_5.webp)  

**Name:** Set Windows Updates to Default  
**Description:** This task removes all the possible registry entries that disable Windows Update on a machine.  
**Category:** Custom  

![Task Creation Image 3](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_6.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  

![Add Row Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_7.webp)  

A blank function will appear.  

![Blank Function Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_8.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Script Selection](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_9.webp)  

The following function will pop up on the screen:  

![PowerShell Function Popup](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_10.webp)  

Paste in the following PowerShell script and set the expected time of script execution to 600 seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/set-windows-updates-to-default/script.ps1)



![alt text](../../../static/img/docs/41c0732d-0740-40d4-bd2f-98edd91cc559/image.webp)

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_11.webp)  
![Script Log Output](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_12.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_13.webp)  

## Output

- Script Log

## Changelog

### 2025-04-10

- Initial version of the document

