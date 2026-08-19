---
id: '86ce1f15-d85b-472a-b35f-c4c357036ee2'
slug: /86ce1f15-d85b-472a-b35f-c4c357036ee2
title: 'Remove Wifi Profile'
title_meta: 'Remove Wifi Profile'
keywords: ['wifi', 'profile', 'remove', 'script', 'connectwise', 'rmm']
description: 'This document provides a comprehensive guide on how to implement a script that removes a specified Wifi profile from a system using ConnectWise RMM. It includes dependencies, user parameters, task creation steps, and complete script details.'
tags: ['networking', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This script removes the specified Wifi profile from the system. It provides a brief overview of the script's purpose and important notes on how to run it. This is the ConnectWise RMM implementation of the agnostic script [Remove-WifiProfile](/docs/d9f38912-7b4a-4da1-a880-210aae4fbb02).

## Sample Run

![Sample Run 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_1.webp)  
![Sample Run 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_2.webp)  
![Sample Run 3](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_3.webp)  

## Dependencies

[Remove-WifiProfile](/docs/d9f38912-7b4a-4da1-a880-210aae4fbb02)

## User Parameters

| Name         | Example           | Required | Type         | Description                          |
|--------------|-------------------|----------|--------------|--------------------------------------|
| ProfileName  | suspiciousProfile  | True     | Text String  | Name of the Wifi Profile to remove. |

![User Parameters](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_6.webp)  

**Name:** `Remove Wifi Profile`  
**Description:** `This script removes the specified Wifi profile from the system.`  
**Category:** `Security`  

![Task Creation Step 3](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_7.webp)  

## Parameters

### ProfileName

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Step 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_8.webp)  

This screen will appear.  

![Add Parameter Step 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_9.webp)  

- Set `ProfileName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_10.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Step 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_11.webp)  

A blank function will appear.

![Add Row Step 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_12.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Function Step 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_13.webp)  
![Row 1 Function Step 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_14.webp)  

The following function will pop up on the screen:

![Row 1 Function Step 3](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_15.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/remove-wifi-profile/script.ps1)



![Row 1 Function Step 4](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_16.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Row 2 Function Step 1](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_17.webp)  

A blank function will appear.

![Row 2 Function Step 2](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_18.webp)  

Search and select the `Script Log` function.

![Row 2 Function Step 3](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_19.webp)  

The following function will pop up on the screen:

![Row 2 Function Step 4](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_20.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.

![Row 2 Function Step 5](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_21.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Row 2 Function Step 6](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_22.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/86ce1f15-d85b-472a-b35f-c4c357036ee2/image_23.webp)  

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

