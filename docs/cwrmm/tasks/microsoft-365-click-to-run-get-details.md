---
id: 'f5099dd5-8e47-468f-a623-a245c342eb19'
slug: /f5099dd5-8e47-468f-a623-a245c342eb19
title: 'Microsoft 365 - Click-to-Run - Get Details'
title_meta: 'Microsoft 365 - Click-to-Run - Get Details'
keywords: ['microsoft', 'click-to-run', 'office', 'update', 'version', 'auto-update', 'channel']
description: 'This document provides a comprehensive guide on how to retrieve the installed Microsoft Click-to-Run Office version on a machine, verify if auto-update is enabled, and obtain the update channel. The guide includes sample runs, dependencies, task creation steps, and implementation recommendations.'
tags: ['application', 'office', 'update']
draft: false
unlisted: false
last_update:
  date: 2025-05-09
---

## Summary

This script retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the update channel.

## Sample Run

![Sample Run 1](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_5.webp)  
![Sample Run 2](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_6.webp)  

## Dependencies

- [Custom Field - Endpoint - C2R Office Version](/docs/9229f1df-c80a-4333-8184-2c54954b4996)
- [Custom Field - Endpoint - C2R Auto Update](/docs/3fbd3eec-1a64-44d4-a812-fc2ac0e359e0)
- [Custom Field - Endpoint - C2R Update Channel](/docs/371c0aa5-4230-4952-b341-f5c58b0b46ad)
- [Custom Field - Endpoint - C2R Data Collection Time](/docs/d6a8abaa-dc34-4f49-8bf6-2bffe1ac40d0)
- [Device Group - Office C2R Auditing](/docs/4611eb6b-e00e-4e38-9935-531f71852e8c)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Script Editor](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_7.webp)  
![Script Editor 2](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_8.webp)  

**Name:** `Microsoft 365 - Click-to-Run - Get Details`  
**Description:** `This script retrieves the installed Microsoft Click-to-Run Office version on the machine, verifies whether auto-update is enabled, and obtains the update channel.`  
**Category:** Application  
![Category Image](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_9.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_10.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_11.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_12.webp)  
![PowerShell Script 2](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_13.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_14.webp)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/microsoft-365-click-to-run-get-details/script1.ps1)



![Next Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_15.webp)  

### Row 2 Function: Set User Variable

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `Set User Variable` function.  
![Set User Variable](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_17.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_18.webp)  

- Set `psout` in the `Variable Name` field.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_19.webp)  

![Next Step](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_20.webp)  

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_21.webp)  

Search and select the `Script Log` function.  
![Script Log](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_22.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_23.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Save Log](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_24.webp)  

### Row 4 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_25.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_26.webp)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/microsoft-365-click-to-run-get-details/script2.ps1)



![Next Step](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_27.webp)  

### Row 5 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_28.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_29.webp)  

- Search and select the Computer-Level Custom Field `C2R Office Version` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_30.webp)  

Flag the `Continue on Failure` field.  
![Continue on Failure](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_31.webp)  

### Row 6 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_25.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_26.webp)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script 3](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/microsoft-365-click-to-run-get-details/script3.ps1)



![Next Step](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_32.webp)  

### Row 7 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_28.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_29.webp)  

- Search and select the Computer-Level Custom Field `C2R Auto Update` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_33.webp)  

Flag the `Continue on Failure` field.  
![Continue on Failure](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_34.webp)  

### Row 8 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_25.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_26.webp)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script 4](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/microsoft-365-click-to-run-get-details/script4.ps1)



![Next Step](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_35.webp)  

### Row 9 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_28.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_29.webp)  

- Search and select the Computer-Level Custom Field `C2R Update Channel` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_36.webp)  

Flag the `Continue on Failure` field.  
![Continue on Failure](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_37.webp)  

### Row 10 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `PowerShell Script` function.  
![PowerShell Script](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_25.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_26.webp)  

Paste in the following PowerShell script and leave the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script 5](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/microsoft-365-click-to-run-get-details/script5.ps1)



![Next Step](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_38.webp)  

### Row 11 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_16.webp)  

Search and select the `Set Custom Field` function.  
![Set Custom Field](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_28.webp)  

The following function will pop up on the screen:  
![Function Popup](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_29.webp)  

- Search and select the Computer-Level Custom Field `C2R Data Collection Time` from the Custom Field dropdown menu.
- Set `%Output%` in the `Value` field.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_39.webp)  

Flag the `Continue on Failure` field.  
![Continue on Failure](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_40.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Final Save](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_41.webp)  

## Completed Task

![Completed Task 1](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_42.webp)  
![Completed Task 2](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_43.webp)  

## Implementation

It is suggested to run the task once per month against computers with the `Microsoft 365 Apps` installed.

- Go to `Automation` > `Tasks`.
- Search for [Microsoft 365 - Click-to-Run - Get Details](/docs/f5099dd5-8e47-468f-a623-a245c342eb19) task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_44.webp)  

This screen will appear.  
![Schedule Screen](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_45.webp)  

Select the `Schedule` button and click the calendar-looking button present in front of the `Recurrence` option.  
![Recurrence Option](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_46.webp)  

Select the `Days(s)` for the `Repeat`, `14`, and click the `OK` button to save the schedule.  
![Save Schedule](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_47.webp)  

Click the `Select Targets` button to select the concerned target.  
![Select Targets](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_48.webp)  

Search and select the `Office C2R Auditing` Device Group for the target.  
![Device Group](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_49.webp)  

Click the `Run` button to initiate the schedule.  
![Run Button](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_50.webp)  

## Output

- Script log  
![Script Log](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_51.webp)  

- Custom Fields  
![Custom Fields](../../../static/img/docs/ce16526d-84b5-4e58-928b-13a29195056e/image_52.webp)

## Changelog

### 2025-04-10

- Initial version of the document

