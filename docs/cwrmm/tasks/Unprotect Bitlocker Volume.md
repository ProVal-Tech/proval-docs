---
id: '904664df-741e-4c18-9667-6bf351b4754c'
title: 'Disable Bitlocker Protection on Volumes'
title_meta: 'Disable Bitlocker Protection on Volumes'
keywords: ['bitlocker', 'protection', 'disable', 'volumes', 'security']
description: 'This document provides detailed instructions on how to disable Bitlocker protection on one or all volumes. It includes sample runs, dependencies, user parameters, task creation steps, and script execution details.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

Disable Bitlocker protection on one (or all) volumes.

## Sample Run

![Sample Run 1](../../../static/img/Unprotect-Bitlocker-Volume/image_1.png)  
![Sample Run 2](../../../static/img/Unprotect-Bitlocker-Volume/image_2.png)  
![Sample Run 3](../../../static/img/Unprotect-Bitlocker-Volume/image_3.png)  

## Dependencies

[SEC - Encryption - Agnostic - Unprotect-BitLockerVolume](<../../powershell/Unprotect-BitLockerVolume.md>)

## User Parameters

| Name       | Example       | Required   | Description                                                        |
|------------|---------------|------------|--------------------------------------------------------------------|
| MountPoint | C:            | Partially  | The target volume to remove Bitlocker protection from.             |
| All        | True / False  | Partially  | Use this switch to remove Bitlocker protection from all volumes.   |

**Note:**  
- The `All` parameter will take precedence if both parameters are specified.
- If no parameters are set, the script will attempt to disable BitLocker on the system drive.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  

![Task Creation 1](../../../static/img/Unprotect-Bitlocker-Volume/image_4.png)  
![Task Creation 2](../../../static/img/Unprotect-Bitlocker-Volume/image_5.png)  

**Name:** Unprotect Bitlocker Volume  
**Description:** Disable Bitlocker protection on one (or all) volumes.  
**Category:** Security  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter](../../../static/img/Unprotect-Bitlocker-Volume/image_6.png)  

This screen will appear.  

![Parameter Screen](../../../static/img/Unprotect-Bitlocker-Volume/image_7.png)  

- Set `MountPoint` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter](../../../static/img/Unprotect-Bitlocker-Volume/image_8.png)  

Click the `Confirm` button to save the parameter.  

![Confirm Save](../../../static/img/Unprotect-Bitlocker-Volume/image_9.png)  

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter Again](../../../static/img/Unprotect-Bitlocker-Volume/image_6.png)  

This screen will appear.  

![Parameter Screen Again](../../../static/img/Unprotect-Bitlocker-Volume/image_7.png)  

- Set `All` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter Again](../../../static/img/Unprotect-Bitlocker-Volume/image_10.png)  

Click the `Confirm` button to save the parameter.  

![Confirm Save Again](../../../static/img/Unprotect-Bitlocker-Volume/image_11.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  

![Add Row](../../../static/img/Unprotect-Bitlocker-Volume/image_12.png)  

A blank function will appear.  

![Blank Function](../../../static/img/Unprotect-Bitlocker-Volume/image_13.png)  

Search and select the `PowerShell Script` function.  

![Select PowerShell Script](../../../static/img/Unprotect-Bitlocker-Volume/image_14.png)  

![PowerShell Script Selected](../../../static/img/Unprotect-Bitlocker-Volume/image_15.png)  

The following function will pop up on the screen:  

![PowerShell Function](../../../static/img/Unprotect-Bitlocker-Volume/image_16.png)  

```powershell
# Parameters and Globals
# Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
$mountPoint = '@MountPoint@'
$all = '@All@'
$Parameters = @{}

if ($all -match '1|Yes|True') {
    $Parameters.Add('All', $true)
} else {
    if ($mountPoint -notmatch '^[A-z]{1}:{0,1}$') {
        $mountPoint = $env:SystemDrive
    }
    $Parameters.Add('MountPoint', $mountPoint)
}

#region Setup - Variables
$ProjectName = 'Unprotect-BitLockerVolume'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
#endregion

#region Setup - Folder Structure
New-Item -Path $WorkingDirectory -ItemType Directory -ErrorAction SilentlyContinue | Out-Null
$response = Invoke-WebRequest -Uri $PS1URL -UseBasicParsing
if (($response.StatusCode -ne 200) -and (!(Test-Path -Path $PS1Path))) {
    throw "No pre-downloaded script exists and the script '$PS1URL' failed to download. Exiting."
} elseif ($response.StatusCode -eq 200) {
    Remove-Item -Path $PS1Path -ErrorAction SilentlyContinue
    [System.IO.File]::WriteAllLines($PS1Path, $response.Content)
}
if (!(Test-Path -Path $PS1Path)) {
    throw 'An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion

#region Execution
if ($Parameters) {
    & $PS1Path @Parameters
} else {
    & $PS1Path
}
#endregion
```

```powershell
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Script Log](../../../static/img/Unprotect-Bitlocker-Volume/image_17.png)  

## Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  

![Add Row for Script Log](../../../static/img/Unprotect-Bitlocker-Volume/image_18.png)  

A blank function will appear.  

![Blank Function for Script Log](../../../static/img/Unprotect-Bitlocker-Volume/image_13.png)  

Search and select the `Script Log` function.  

![Select Script Log](../../../static/img/Unprotect-Bitlocker-Volume/image_19.png)  

![Script Log Selected](../../../static/img/Unprotect-Bitlocker-Volume/image_20.png)  

The following function will pop up on the screen:  

![Script Log Function](../../../static/img/Unprotect-Bitlocker-Volume/image_21.png)  

In the script log message, simply type `%output%` and click the `Save` button.  

![Save Script Log](../../../static/img/Unprotect-Bitlocker-Volume/image_22.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  

![Save Script](../../../static/img/Unprotect-Bitlocker-Volume/image_23.png)  

## Completed Task

![Completed Task](../../../static/img/Unprotect-Bitlocker-Volume/image_24.png)  

## Output

- Script log

