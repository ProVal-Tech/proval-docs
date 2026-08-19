---
id: '8b3db9bc-3acc-40fb-96e3-9f6c271a2591'
slug: /8b3db9bc-3acc-40fb-96e3-9f6c271a2591
title: 'Set - DisplayScaling'
title_meta: 'Set - DisplayScaling'
keywords: ['display', 'scaling', 'windows', 'custom', 'script']
description: 'This document outlines the implementation of a script to set custom display scaling for both existing and new users on Windows machines within an RMM environment. It includes user parameters, task creation steps, and example outputs.'
tags: ['setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This is an RMM implementation of the agnostic script [Set-DisplayScaling](/docs/d53bd821-ed9a-4779-8113-2994eaa7197c) to set custom display scaling on both existing and new users for Windows machines.

## Sample Run

![Sample Run](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_1.webp)

To set the display scale to 100%:  
![Set Display Scale](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_2.webp)

## Dependencies

[Set-DisplayScaling](/docs/d53bd821-ed9a-4779-8113-2994eaa7197c)

## User Parameters

| Name            | Example | Required | Description                                                                                                                                                                                                                              |
|-----------------|---------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScalePercentage  | 150     | True     | Enter one of the scaling percentages from the options below: - 100 - to maximize the window zoom to 100% - 125 - to maximize the window zoom to 125% - 150 - to maximize the window zoom to 150% - 175 - to maximize the window zoom to 175% - 200 - to maximize the window zoom to 200% |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Create Script](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_3.webp)  
![Script Creation](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_4.webp)

**Name:** Set - DisplayScaling  
**Description:** This task sets custom display scaling on existing and new users for Windows machines.  
**Category:** Custom  
![Category](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_5.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_6.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_7.webp)

- Set `ScalePercentage` in the `Parameter Name` field.
- Toggle the Required field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_8.webp)

- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_9.webp)

Parameters will look as shown below:  
![Parameters Example](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_10.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_11.webp)

A blank function will appear.  
![Blank Function](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_12.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Function](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_13.webp)

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_14.webp)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/set-displayscaling/script.ps1)



### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Script Log](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_15.webp)

## Completed Task

![Completed Task](../../../static/img/docs/09fb13cb-05b1-4515-8041-128689d933ff/image_16.webp)

## Output

- Script Log

## Changelog

### 2025-04-10

- Initial version of the document

