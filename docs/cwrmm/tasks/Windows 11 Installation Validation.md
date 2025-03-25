---
id: 'f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6'
slug: /f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6
title: 'Windows 11 Installation Validation'
title_meta: 'Windows 11 Installation Validation'
keywords: ['windows', 'validation', 'upgrade', 'task', 'installer']
description: 'This document provides a comprehensive guide on how to check and confirm the installation status of Windows 11 after executing the Windows 11 Installer (Beta) task, including detailed steps for task creation, dependencies, and scheduling.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Check and confirm the Windows 11 installation status after running the Windows 11 Installer (Beta) task.

## Sample Run

![Sample Run 1](../../../static/img/Windows-11-Installation-Validation/image_1.png)  
![Sample Run 2](../../../static/img/Windows-11-Installation-Validation/image_2.png)  

## Dependencies

- [CW RMM - Custom Field - Windows 11 Upgrade RunTime](<../custom-fields/Endpoint - Windows 11 Upgrade RunTime.md>)
- [CW RMM - Custom Field - Endpoint - Windows 11 Upgrade Failed](<../custom-fields/Endpoint - Windows 11 Upgrade Failed.md>)
- [CW RMM - Device Group - Windows 11 Upgrade Validation](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>)
- [CW RMM - Task - Windows 11 Installer (Beta)](<./Windows 11 Installer (Beta).md>)

## Variables

| Name         | Description                                                              |
|--------------|--------------------------------------------------------------------------|
| TaskRunTime  | Value stored in the Windows 11 Upgrade RunTime custom field.            |
| Output       | Output of the previously executed PowerShell script.                    |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Step 1](../../../static/img/Windows-11-Installation-Validation/image_3.png)  
![Task Creation Step 2](../../../static/img/Windows-11-Installation-Validation/image_4.png)  

**Name:** Windows 11 Installation Validation  
**Description:** Check and confirm the Windows 11 installation status after running the Windows 11 Installer (Beta) task.  
**Category:** Patching  
![Task Category](../../../static/img/Windows-11-Installation-Validation/image_5.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Button](../../../static/img/Windows-11-Installation-Validation/image_6.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Windows-11-Installation-Validation/image_7.png)  

#### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Select Pre-defined Variable](../../../static/img/Windows-11-Installation-Validation/image_8.png)  

The following function will pop up on the screen:  
![Set Pre-defined Variable Function](../../../static/img/Windows-11-Installation-Validation/image_9.png)  

- Select the `Custom Field` radio button.
- Set `TaskRunTime` in the `Variable Name` field.
- Search and select the `Windows 11 Upgrade RunTime` for the Custom field.
- Click the `Save` button to save the row.  
![Save Row](../../../static/img/Windows-11-Installation-Validation/image_10.png)  
![Save Confirmation](../../../static/img/Windows-11-Installation-Validation/image_11.png)  

#### Row 2 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row Button](../../../static/img/Windows-11-Installation-Validation/image_12.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Windows-11-Installation-Validation/image_7.png)  

Search and select the `PowerShell Script` function.  
![Select PowerShell Script](../../../static/img/Windows-11-Installation-Validation/image_13.png)  
![PowerShell Script Function](../../../static/img/Windows-11-Installation-Validation/image_14.png)  

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/Windows-11-Installation-Validation/image_15.png)  

Paste in the following PowerShell script and leave the expected time of script execution at `300` seconds. Click the `Save` button.

```
$TaskRunTime = '@TaskRunTime@'
if ( $TaskRunTime -eq 'NA' ) {
    return 'NA'
} else {
    $Uptime = ( systeminfo | Find 'System Boot Time' )
    if ( $Uptime -match '([0-9]{1,2}\\/[0-9]{1,2}\\/[0-9]{4}, [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2})' ) {
        $uptime = $Matches[1]
    }
    $uptime = $uptime -replace '\\\', '-' -replace ',', ''
    if ( [DateTime]$uptime -ge [DateTime]$TaskRunTime ) {
        if ( ( Get-Ciminstance -ClassName Win32_OperatingSystem ).caption -contains 'Windows 10' ) {
            return 'Failed'
        } else {
            return 'Success'
        }
    } else {
        return 'Pending'
    }
}
```
![PowerShell Script](../../../static/img/Windows-11-Installation-Validation/image_16.png)  

#### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row Button](../../../static/img/Windows-11-Installation-Validation/image_12.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Windows-11-Installation-Validation/image_7.png)  

Search and select the `Set Custom Field` function.  
![Select Set Custom Field](../../../static/img/Windows-11-Installation-Validation/image_17.png)  

Search and select `Windows 11 Upgrade Failed` in the `Search Custom Field` field, set `%Output%` in the `Value` field, and click the `Save` button.  
![Save Custom Field](../../../static/img/Windows-11-Installation-Validation/image_18.png)  

Mark the `Continue on Failure` checkbox.  
![Continue on Failure Checkbox](../../../static/img/Windows-11-Installation-Validation/image_19.png)  

Click the `Save` button at the top-right corner of the screen to save the task.  
![Save Task](../../../static/img/Windows-11-Installation-Validation/image_20.png)  

## Completed Task

![Completed Task](../../../static/img/Windows-11-Installation-Validation/image_21.png)  

## Deployment

The task should be scheduled to run once per day against the [Windows 11 Upgrade Validation](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>) device group.

- Go to `Automation` > `Tasks`.
- Search for the `Windows 11 Installation Validation` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.  
![Schedule Task](../../../static/img/Windows-11-Installation-Validation/image_22.png)  
- This screen will appear.  
![Schedule Screen](../../../static/img/Windows-11-Installation-Validation/image_23.png)  
- Click the `Does not repeat` button.  
![Does Not Repeat Button](../../../static/img/Windows-11-Installation-Validation/image_24.png)  
- This pop-up box will appear.  
![Pop-up Box](../../../static/img/Windows-11-Installation-Validation/image_25.png)  
- Click the `OK` button without making any changes to run the task `Every day`.  
![OK Button](../../../static/img/Windows-11-Installation-Validation/image_26.png)  
- Recurrence will be updated to `Every Day`.  
![Every Day Recurrence](../../../static/img/Windows-11-Installation-Validation/image_27.png)  
- Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](../../../static/img/Windows-11-Installation-Validation/image_28.png)  
- Search and select the [Windows 11 Upgrade Validation](<../groups/Upgrade Enabled Windows 11 Compatible Machines.md>) device group.  
![Select Device Group](../../../static/img/Windows-11-Installation-Validation/image_29.png)  
- Now click the `Run` button to initiate the task.  
![Run Button](../../../static/img/Windows-11-Installation-Validation/image_30.png)  
- The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks](../../../static/img/Windows-11-Installation-Validation/image_31.png)  
![Scheduled Task Example](../../../static/img/Windows-11-Installation-Validation/image_32.png)  

## Output

- Script Log
- Custom Field


