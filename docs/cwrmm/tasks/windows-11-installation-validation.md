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

![Sample Run 1](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_1.png)  
![Sample Run 2](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_2.png)  

## Dependencies

- [CW RMM - Custom Field - Windows 11 Upgrade RunTime](/docs/ffce7cd6-7757-4918-bce0-461cf9dce0b4)
- [CW RMM - Custom Field - Endpoint - Windows 11 Upgrade Failed](/docs/eb332e7e-77ae-4cc0-82b1-c4f42cc05fac)
- [CW RMM - Device Group - Windows 11 Upgrade Validation](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96)
- [CW RMM - Task - Windows 11 Installer (Beta)](/docs/96cec9d2-d276-47a5-a1c5-d79d561c192a)

## Variables

| Name         | Description                                                              |
|--------------|--------------------------------------------------------------------------|
| TaskRunTime  | Value stored in the Windows 11 Upgrade RunTime custom field.            |
| Output       | Output of the previously executed PowerShell script.                    |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Step 1](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_3.png)  
![Task Creation Step 2](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_4.png)  

**Name:** Windows 11 Installation Validation  
**Description:** Check and confirm the Windows 11 installation status after running the Windows 11 Installer (Beta) task.  
**Category:** Patching  
![Task Category](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_5.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_6.png)  

A blank function will appear.  
![Blank Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_7.png)  

#### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Select Pre-defined Variable](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_8.png)  

The following function will pop up on the screen:  
![Set Pre-defined Variable Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_9.png)  

- Select the `Custom Field` radio button.
- Set `TaskRunTime` in the `Variable Name` field.
- Search and select the `Windows 11 Upgrade RunTime` for the Custom field.
- Click the `Save` button to save the row.  
![Save Row](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_10.png)  
![Save Confirmation](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_11.png)  

#### Row 2 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Add Row Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_12.png)  

A blank function will appear.  
![Blank Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_7.png)  

Search and select the `PowerShell Script` function.  
![Select PowerShell Script](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_13.png)  
![PowerShell Script Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_14.png)  

The following function will pop up on the screen:  
![PowerShell Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_15.png)  

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
![PowerShell Script](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_16.png)  

#### Row 3 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Add Row Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_12.png)  

A blank function will appear.  
![Blank Function](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_7.png)  

Search and select the `Set Custom Field` function.  
![Select Set Custom Field](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_17.png)  

Search and select `Windows 11 Upgrade Failed` in the `Search Custom Field` field, set `%Output%` in the `Value` field, and click the `Save` button.  
![Save Custom Field](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_18.png)  

Mark the `Continue on Failure` checkbox.  
![Continue on Failure Checkbox](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_19.png)  

Click the `Save` button at the top-right corner of the screen to save the task.  
![Save Task](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_20.png)  

## Completed Task

![Completed Task](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_21.png)  

## Deployment

The task should be scheduled to run once per day against the [Windows 11 Upgrade Validation](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96) device group.

- Go to `Automation` > `Tasks`.
- Search for the `Windows 11 Installation Validation` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.  
![Schedule Task](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_22.png)  
- This screen will appear.  
![Schedule Screen](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_23.png)  
- Click the `Does not repeat` button.  
![Does Not Repeat Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_24.png)  
- This pop-up box will appear.  
![Pop-up Box](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_25.png)  
- Click the `OK` button without making any changes to run the task `Every day`.  
![OK Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_26.png)  
- Recurrence will be updated to `Every Day`.  
![Every Day Recurrence](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_27.png)  
- Select the `Device Groups` option in the `Targeted Resources` section.  
![Targeted Resources](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_28.png)  
- Search and select the [Windows 11 Upgrade Validation](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96) device group.  
![Select Device Group](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_29.png)  
- Now click the `Run` button to initiate the task.  
![Run Button](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_30.png)  
- The task will start appearing in the Scheduled Tasks.  
![Scheduled Tasks](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_31.png)  
![Scheduled Task Example](/img/docs/f3e6e1a0-0133-4d84-b0c7-fb02c1e2fca6/image_32.png)  

## Output

- Script Log
- Custom Field