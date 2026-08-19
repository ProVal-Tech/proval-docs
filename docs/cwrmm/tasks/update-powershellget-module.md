---
id: 'f17a9912-b0d6-4b48-812d-380a4dc9de90'
slug: /f17a9912-b0d6-4b48-812d-380a4dc9de90
title: 'Update PowerShellGet Module'
title_meta: 'Update PowerShellGet Module'
keywords: ['powershellget', 'update', 'module', 'script', 'install']
description: 'This document provides a comprehensive guide on how to install or update the PowerShellGet module to the latest version available in the PowerShell Gallery, including sample runs, dependencies, task creation steps, and script execution details.'
tags: ['installation', 'security', 'update']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

Installs or updates PowerShellGet to the latest version available in the PowerShell Gallery. CW RMM implementation of the agnostic script [Update-PowerShellGet](https://file.provaltech.com/repo/script/Update-PowerShellGet.ps1).

## Sample Run

![Sample Run 1](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_1.webp)

![Sample Run 2](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_2.webp)

## Dependencies

[Update-PowerShellGet Script](https://file.provaltech.com/repo/script/Update-PowerShellGet.ps1)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_3.webp)

![Task Creation 2](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_4.webp)

**Name:** `Update PowerShellGet Module`  
**Description:** `Installs or updates PowerShellGet to the latest version available in the PowerShell Gallery.`  
**Category:** `Custom`  

![Task Creation 3](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_5.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_6.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_7.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_8.webp)

![PowerShell Script Selection 2](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_9.webp)

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_10.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/update-powershellget-module/script.ps1)



![PowerShell Script Saved](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_11.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_12.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_13.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_14.webp)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_15.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_16.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Script Saved](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_17.webp)

## Completed Task

![Completed Task](../../../static/img/docs/f17a9912-b0d6-4b48-812d-380a4dc9de90/image_18.webp)

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

