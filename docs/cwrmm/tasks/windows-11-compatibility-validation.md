---
id: '007d88ec-68b1-45fa-8d95-9c279218ac3c'
slug: /007d88ec-68b1-45fa-8d95-9c279218ac3c
title: 'Windows 11 Compatibility Validation'
title_meta: 'Windows 11 Compatibility Validation'
keywords: ['windows', 'compatibility', 'validation', 'upgrade', 'task']
description: 'This document provides a comprehensive guide to verify if a Windows 10 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Verify if a Windows 10 PC is compatible with Windows 11.

## Sample Run

![Sample Run 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_1.webp)  
![Sample Run 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_2.webp)

## Dependencies

- [CW RMM - Device Group - Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96)  
- [CW RMM - Custom Field - Endpoint - Windows 11 incompatibility Base](/docs/7894870c-b7e8-44e0-806c-c948f151fc49)  
- [CW RMM - Device Group - Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a)  

## Variables

| Name   | Description                         |
|--------|-------------------------------------|
| Output | Output of the PowerShell Script.    |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_4.webp)  

**Name:** Windows 11 Compatibility Validation  
**Description:** Verify if a Windows 10 PC is compatible with Windows 11.  
**Category:** Patching  
![Task Creation Image 3](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_5.webp)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Navigation Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_6.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_8.webp)  
![PowerShell Script Selection Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_9.webp)  

The following function will pop up on the screen:  
![PowerShell Script Popup Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_10.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force -Confirm:$false
if ( [System.Environment]::OSVersion.Version.Major -eq 10 ) {
    $DownloadUrl = 'https://download.microsoft.com/download/e/1/e/e1e682c2-a2ee-46c7-ad1e-d0e38714a795/HardwareReadiness.ps1'
    $ScriptPath = "$Env:Temp/HardwareReadiness.ps1"
    Invoke-WebRequest -Uri $DownloadUrl -UseBasicParsing -OutFile $ScriptPath -ErrorAction SilentlyContinue
    if (!(Test-Path -Path $ScriptPath)) {
        return 'An error occurred and the script was unable to be downloaded. Exiting.'
    }
    $ReadinessCheck = & $ScriptPath
    $Obj = $ReadinessCheck[1] | ConvertFrom-Json -ErrorAction SilentlyContinue
    if ( $Obj.returnResult -eq 'CAPABLE' ) {
        return 'Compatible'
    } else {
        return $Obj.logging
    }
} else {
    return 'Unsupported OS'
}
```

![PowerShell Script Execution Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_11.webp)  

Mark the `Continue on Failure` checkbox for the function.  
![Continue on Failure Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_12.webp)  

### Row 2 Logic: If/Then/Else

Add a new `If/Then/Else` logic.  
![If/Then/Else Logic Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_13.webp)  
![If/Then/Else Logic Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_14.webp)  

#### Row 2a Condition: Output Contains

Type `Compatible` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_15.webp)  

#### Row 2b Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Set Custom Field Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_16.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  
![Set Custom Field Image 3](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp)  

Search and select `Windows 11 Compatible` in the `Search Custom Field` field, set `Yes` in the `Value` field, and click the `Save` button.  
![Set Custom Field Image 4](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_19.webp)  
![Set Custom Field Image 5](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_20.webp)  

#### Row 2c Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Else Logic Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_21.webp)  

An empty logic will appear.  
![Empty Logic Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_22.webp)  

##### Row 2c(i) Condition: Output Contains

Type `An error occurred and the script` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains Error Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_23.webp)  

Add another condition by clicking the `Add Condition` button.  
![Add Condition Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_24.webp)  
![Add Condition Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_25.webp)  

Change the logical operator to `Or` from `And`.  
![Change Logical Operator Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_26.webp)  

In the new condition, type `Unsupported OS` in the `Input Value or Variable` field and press `Enter`.  
![Unsupported OS Condition Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_27.webp)  

##### Row 2c(ii) Function: Script Exit

Click the `Add Row` button inside the `If` section after the above conditions.  
![Script Exit Add Row Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_16.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_28.webp)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit Selection Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_29.webp)  
![Script Exit Selection Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_30.webp)  

The following function will pop up on the screen:  
![Script Exit Popup Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_31.webp)  

Paste the following lines in the `Error Message` field and click the `Save` button.  

```plaintext
%Output%
```

![Script Exit Error Message Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_32.webp)  

##### Row 2c(iii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the inner `Else` section.  
![Set Custom Field Image 6](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_33.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  
![Set Custom Field Image 8](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp)  

Search and select `Windows 11 Compatible` in the `Search Custom Field` field and set `No` in the `Value` field and click the `Save` button.
![Set Custom Field Image 9](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_47.webp)  
![Set Custom Field Image 10](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_48.webp)  

##### Row 2c(iv) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the inner `Else` section after the above function.  
![Add New Row](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_46.webp)

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  
![Set Custom Field Image 8](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp)  

Search and select `Windows 11 incompatible Base` in the `Search Custom Field` field, set `%Output%` in the `Value` field, and click the `Save` button.  
![Set Custom Field Image 9](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_34.webp)  
![Set Custom Field Image 10](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_35.webp)

---

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_36.webp)  

## Completed Task

![Completed Task Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_37.webp)  
![Completed Task Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_38.webp)  

## Deployment

It is suggested to run the Task once per month against [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a).

- Go to `Automation` > `Tasks.`
- Search for `Windows 10 Machines` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Task Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_39.webp)  
- This screen will appear.  
![Schedule Screen Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_40.webp)  
- Select the `Schedule` button and click the calendar icon present in front of the `Recurrence` option.  
![Recurrence Option Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_41.webp)  
- Select the `Month(s)` for the `Repeat`, set `1` for `Dates`, and click the `OK` button to save the schedule.  
![Save Schedule Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_42.webp)  
- Click the `Select Targets` button to select the concerned target.  
![Select Targets Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_43.webp)  
- Search and select the [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) Device Group for the target.  
![Device Group Selection Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_44.webp)  
- Click the `Run` button to initiate the schedule.  
![Run Task Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_45.webp)  

## Output

- Script Log
- Custom Field