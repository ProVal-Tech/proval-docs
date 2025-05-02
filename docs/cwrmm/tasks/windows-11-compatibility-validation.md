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

![Sample Run 1](../../../static/img/Windows-11-Compatibility-Validation/image_1.png)  
![Sample Run 2](../../../static/img/Windows-11-Compatibility-Validation/image_2.png)

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
![Task Creation Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_3.png)  
![Task Creation Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_4.png)  

**Name:** Windows 11 Compatibility Validation  
**Description:** Verify if a Windows 10 PC is compatible with Windows 11.  
**Category:** Patching  
![Task Creation Image 3](../../../static/img/Windows-11-Compatibility-Validation/image_5.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Navigation Image](../../../static/img/Windows-11-Compatibility-Validation/image_6.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Windows-11-Compatibility-Validation/image_7.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_8.png)  
![PowerShell Script Selection Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_9.png)  

The following function will pop up on the screen:  
![PowerShell Script Popup Image](../../../static/img/Windows-11-Compatibility-Validation/image_10.png)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
<#
.SYNOPSIS
    This script checks the compatibility of a Windows system (Windows 10 or Windows 11) for upgrading to Windows 11.

.DESCRIPTION
    The script performs the following steps:
    1. Sets the `$ProgressPreference` to 'SilentlyContinue' to suppress progress messages.
    2. Configures the .NET ServicePointManager to use TLS 1.2 for secure web requests.
    3. Temporarily sets the PowerShell execution policy to 'Unrestricted' for the current process.
    4. Checks if the operating system is Windows 10 or Windows 11. If not, it exits with a message indicating an unsupported OS.
    5. Downloads the `HardwareReadiness.ps1` script from Microsoft's official website to a working directory.
    6. Ensures the working directory exists and creates it if necessary.
    7. Executes the downloaded `HardwareReadiness.ps1` script to perform the compatibility check.
    8. Parses the results of the compatibility check:
        - If the system is compatible, it returns a success message with all required components marked as compatible.
        - If the system is not compatible, it parses the detailed results and converts the status of each component (CPU, TPM, OS Drive Size, Secure Boot, and Memory) into string values:
            - Pass
            - Fail
            - Failed to Run
            - Undetermined
        - Returns a detailed string summarizing the compatibility status of each component and the overall result.

.NOTES
    - This script is intended for use on Windows 10 and Windows 11 systems only.
    - The `HardwareReadiness.ps1` script is downloaded from Microsoft's official website.
    - Ensure that the system has internet access to download the readiness script.

.EXAMPLE
    Run the script to check Windows 11 compatibility:
    ```powershell
    .\CWRMMImp-CheckWindows11Compatibility.ps1
    ```

.OUTPUTS
    - If compatible: `Compatible`
    - If not compatible: `CPU=(Exception from HRESULT: 0x80284008)|TPM=UNDETERMINED|OSDriveSize=PASS|Secureboot=PASS|Memory=PASS|Result=UNDETERMINED`
    - If unsupported OS: `Unsupported OS`
#>
$ProgressPreference = 'SilentlyContinue'
$ConfirmPreference = 'None'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted -Force -Confirm:$false
if ( [System.Environment]::OSVersion.Version.Major -eq 10 ) {
    $DownloadUrl = 'https://download.microsoft.com/download/e/1/e/e1e682c2-a2ee-46c7-ad1e-d0e38714a795/HardwareReadiness.ps1'
    $workingDirectory = 'C:\ProgramData\_Automation\Script\Check-Windows11Compatibility'
    $ScriptPath = "$workingDirectory\HardwareReadiness.ps1"
    if (!(Test-Path -Path $workingDirectory)) {
        New-Item -Path $workingDirectory -ItemType Directory -Force | Out-Null
    }
    Invoke-WebRequest -Uri $DownloadUrl -UseBasicParsing -OutFile $ScriptPath -ErrorAction SilentlyContinue
    if (!(Test-Path -Path $ScriptPath)) {
        return 'An error occurred and the script was unable to be downloaded. Exiting.'
    }
    $ReadinessCheck = & $ScriptPath
    $Obj = $ReadinessCheck[1] | ConvertFrom-Json -ErrorAction SilentlyContinue
    if ( $Obj.returnResult -eq 'CAPABLE' ) {
        return 'Compatible'
    } else {
        $logging = ($obj.logging -split ';(?![^{}]*\})').trim()
        $Storage = (($logging -match '^Storage:') -split '\. ')[-1].Trim()
        $Memory = (($logging -match '^Memory:') -split '\. ')[-1].Trim()
        $TPM = (($logging -match 'TPM:') -split '\. ')[-1].Trim()
        $Processor = (($logging -match 'Processor:') -split '\. ')[-1].Trim()
        $secureBoot = (($logging -match 'SecureBoot:') -split '\. ')[-1].Trim()
        return "CPU=$Processor|TPM=$TPM|OSDriveSize=$Storage|Secureboot=$secureBoot|Memory=$Memory|Result=$($Obj.returnResult)"
    }
} else {
    return 'Unsupported OS'
}
```

![PowerShell Script Execution Image](../../../static/img/Windows-11-Compatibility-Validation/image_11.png)  

Mark the `Continue on Failure` checkbox for the function.  
![Continue on Failure Image](../../../static/img/Windows-11-Compatibility-Validation/image_12.png)  

### Row 2 Logic: If/Then/Else

Add a new `If/Then/Else` logic.  
![If/Then/Else Logic Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_13.png)  
![If/Then/Else Logic Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_14.png)  

#### Row 2a Condition: Output Contains

Type `Compatible` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains Image](../../../static/img/Windows-11-Compatibility-Validation/image_15.png)  

#### Row 2b Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.  
![Set Custom Field Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_16.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Windows-11-Compatibility-Validation/image_7.png)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_17.png)  
![Set Custom Field Image 3](../../../static/img/Windows-11-Compatibility-Validation/image_18.png)  

Search and select `Windows 11 Compatible` in the `Search Custom Field` field, set `Yes` in the `Value` field, and click the `Save` button.  
![Set Custom Field Image 4](../../../static/img/Windows-11-Compatibility-Validation/image_19.png)  
![Set Custom Field Image 5](../../../static/img/Windows-11-Compatibility-Validation/image_20.png)  

#### Row 2c Logic: If/Then/Else

Add a new `If/Then/Else` logic inside the `Else` section.  
![Else Logic Image](../../../static/img/Windows-11-Compatibility-Validation/image_21.png)  

An empty logic will appear.  
![Empty Logic Image](../../../static/img/Windows-11-Compatibility-Validation/image_22.png)  

##### Row 2c(i) Condition: Output Contains

Type `An error occurred and the script` in the `Input Value or Variable` field and press `Enter`.  
![Output Contains Error Image](../../../static/img/Windows-11-Compatibility-Validation/image_23.png)  

Add another condition by clicking the `Add Condition` button.  
![Add Condition Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_24.png)  
![Add Condition Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_25.png)  

Change the logical operator to `Or` from `And`.  
![Change Logical Operator Image](../../../static/img/Windows-11-Compatibility-Validation/image_26.png)  

In the new condition, type `Unsupported OS` in the `Input Value or Variable` field and press `Enter`.  
![Unsupported OS Condition Image](../../../static/img/Windows-11-Compatibility-Validation/image_27.png)  

##### Row 2c(ii) Function: Script Exit

Click the `Add Row` button inside the `If` section after the above conditions.  
![Script Exit Add Row Image](../../../static/img/Windows-11-Compatibility-Validation/image_16.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Windows-11-Compatibility-Validation/image_28.png)  

Search and select the `Script Exit` function in the newly appeared row.  
![Script Exit Selection Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_29.png)  
![Script Exit Selection Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_30.png)  

The following function will pop up on the screen:  
![Script Exit Popup Image](../../../static/img/Windows-11-Compatibility-Validation/image_31.png)  

Paste the following lines in the `Error Message` field and click the `Save` button.  

```plaintext
%Output%
```

![Script Exit Error Message Image](../../../static/img/Windows-11-Compatibility-Validation/image_32.png)  

##### Row 2c(iii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the inner `Else` section.  
![Set Custom Field Image 6](../../../static/img/Windows-11-Compatibility-Validation/image_33.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Windows-11-Compatibility-Validation/image_7.png)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/Windows-11-Compatibility-Validation/image_17.png)  
![Set Custom Field Image 8](../../../static/img/Windows-11-Compatibility-Validation/image_18.png)  

Search and select `Windows 11 Compatible` in the `Search Custom Field` field and set `No` in the `Value` field and click the `Save` button.
![Set Custom Field Image 9](../../../static/img/Windows-11-Compatibility-Validation/image_47.png)  
![Set Custom Field Image 10](../../../static/img/Windows-11-Compatibility-Validation/image_48.png)  

##### Row 2c(iv) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the inner `Else` section after the above function.  
![Add New Row](../../../static/img/Windows-11-Compatibility-Validation/image_46.png)

A blank function will appear.  
![Blank Function Image](../../../static/img/Windows-11-Compatibility-Validation/image_7.png)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/Windows-11-Compatibility-Validation/image_17.png)  
![Set Custom Field Image 8](../../../static/img/Windows-11-Compatibility-Validation/image_18.png)  

Search and select `Windows 11 incompatible Base` in the `Search Custom Field` field, set `%Output%` in the `Value` field, and click the `Save` button.  
![Set Custom Field Image 9](../../../static/img/Windows-11-Compatibility-Validation/image_34.png)  
![Set Custom Field Image 10](../../../static/img/Windows-11-Compatibility-Validation/image_35.png)

---

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/Windows-11-Compatibility-Validation/image_36.png)  

## Completed Task

![Completed Task Image 1](../../../static/img/Windows-11-Compatibility-Validation/image_37.png)  
![Completed Task Image 2](../../../static/img/Windows-11-Compatibility-Validation/image_38.png)  

## Deployment

It is suggested to run the Task once per month against [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a).

- Go to `Automation` > `Tasks.`
- Search for `Windows 10 Machines` Task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Task Image](../../../static/img/Windows-11-Compatibility-Validation/image_39.png)  
- This screen will appear.  
![Schedule Screen Image](../../../static/img/Windows-11-Compatibility-Validation/image_40.png)  
- Select the `Schedule` button and click the calendar icon present in front of the `Recurrence` option.  
![Recurrence Option Image](../../../static/img/Windows-11-Compatibility-Validation/image_41.png)  
- Select the `Month(s)` for the `Repeat`, set `1` for `Dates`, and click the `OK` button to save the schedule.  
![Save Schedule Image](../../../static/img/Windows-11-Compatibility-Validation/image_42.png)  
- Click the `Select Targets` button to select the concerned target.  
![Select Targets Image](../../../static/img/Windows-11-Compatibility-Validation/image_43.png)  
- Search and select the [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) Device Group for the target.  
![Device Group Selection Image](../../../static/img/Windows-11-Compatibility-Validation/image_44.png)  
- Click the `Run` button to initiate the schedule.  
![Run Task Image](../../../static/img/Windows-11-Compatibility-Validation/image_45.png)  

## Output

- Script Log
- Custom Field

