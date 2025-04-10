---
id: 'a2e5e9e8-7601-42a9-9941-88a5142ee69a'
slug: /a2e5e9e8-7601-42a9-9941-88a5142ee69a
title: 'Protect Screen Lock'
title_meta: 'Protect Screen Lock'
keywords: ['screensaver', 'timeout', 'domain', 'security', 'configuration']
description: 'This document provides a comprehensive guide on using the Protect Screen Lock script to set a specified .scr file as the default screensaver for all users, manage lockscreen timeout settings, and handle domain exceptions using Strapper. It includes user parameters, task creation steps, and sample runs for effective implementation.'
tags: ['domain', 'security']
draft: false
unlisted: false
---

## Summary

This script sets a specified .scr file as the default screensaver for all users, manages lockscreen timeout settings, and handles domain exceptions using Strapper. If no screensaver path is provided, this portion of the script is skipped. CW RMM implementation of the agnostic script [Protect-Screenlock](https://file.provaltech.com/repo/script/Protect-ScreenLock.ps1).

## Sample Run

![Sample Run 1](../../../static/img/Protect-Screen-Lock/image_1.png)  
![Sample Run 2](../../../static/img/Protect-Screen-Lock/image_2.png)  
![Sample Run 3](../../../static/img/Protect-Screen-Lock/image_3.png)  

## Dependencies

[Protect Screen Lock Script](https://file.provaltech.com/repo/script/Protect-ScreenLock.ps1)

## User Parameters

| Name             | Example                        | Required | Default | Type          | Description                                                                                                                                                       |
|------------------|--------------------------------|----------|---------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScreenSaverPath  | C:/Temp/ScreenSaver/Saver.scr  | False    |         | Text String   | Optional parameter to specify the path of the screensaver file. The script will not set a screensaver if this parameter is not provided.                       |
| Timeout          | 900                            | True     | 900     | Number Value  | The maximum timeout value for the screensaver. Defaults to 900 seconds.                                                                                       |
| DomainException   | 0/1                           | False    |         | Flag          | Set to run a GPRESULT instead of making configuration changes when a machine is part of a domain.                                                                |

![User Parameters Image](../../../static/img/Protect-Screen-Lock/image_4.png)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/Protect-Screen-Lock/image_5.png)  
![Task Creation Step 2](../../../static/img/Protect-Screen-Lock/image_6.png)  

**Name:** `Protect Screen Lock`  
**Description:** `This script sets a specified .scr file as the default screensaver for all users, manages lockscreen timeout settings, and handles domain exceptions using Strapper. If no screensaver path is provided, this portion of the script is skipped.`  
**Category:** `Security`  
![Task Creation Step 3](../../../static/img/Protect-Screen-Lock/image_7.png)  

## Parameters

### ScreensaverPath:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![ScreensaverPath Step 1](../../../static/img/Protect-Screen-Lock/image_8.png)  

This screen will appear.  
![ScreensaverPath Step 2](../../../static/img/Protect-Screen-Lock/image_9.png)  

- Set `ScreensaverPath` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![ScreensaverPath Step 3](../../../static/img/Protect-Screen-Lock/image_10.png)  

### Timeout:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Timeout Step 1](../../../static/img/Protect-Screen-Lock/image_8.png)  

This screen will appear.  
![Timeout Step 2](../../../static/img/Protect-Screen-Lock/image_9.png)  

- Set `Timeout` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Number Value` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `900` in the `Value` field.  
- Click the `Save` button.  
![Timeout Step 3](../../../static/img/Protect-Screen-Lock/image_11.png)  

### Domain Exception:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Domain Exception Step 1](../../../static/img/Protect-Screen-Lock/image_8.png)  

This screen will appear.  
![Domain Exception Step 2](../../../static/img/Protect-Screen-Lock/image_9.png)  

- Set `DomainException` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Domain Exception Step 3](../../../static/img/Protect-Screen-Lock/image_12.png)  

## Task Creation

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Creation Row Step 1](../../../static/img/Protect-Screen-Lock/image_13.png)  

A blank function will appear.  
![Task Creation Row Step 2](../../../static/img/Protect-Screen-Lock/image_14.png)  

### Row 1 Function: PowerShell Script
Search and select the `PowerShell Script` function.  
![Row 1 Step 1](../../../static/img/Protect-Screen-Lock/image_15.png)  
![Row 1 Step 2](../../../static/img/Protect-Screen-Lock/image_16.png)  

The following function will pop up on the screen:  
![Row 1 Step 3](../../../static/img/Protect-Screen-Lock/image_17.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.  
```powershell
#region parameters
$ScreensaverPath = '@ScreensaverPath@'
$Timeout = '@Timeout@'
$DomainException = '@DomainException@'
$Parameters = @{}
if ( $ScreensaverPath -match '/.scr' ) {
    $Parameters.add('ScreensaverPath', $ScreensaverPath)
}
if ( $Timeout -match '^[0-9]{1,}$' ) {
    $Parameters.Add('Timeout', $Timeout)
} else {
    $Parameters.Add('Timeout', 900)
}
if ($DomainException -match '1|Yes|True') {
    $Parameters.Add('DomainException', $true)
}
#endregion
#region Setup - Variables
$ProjectName = 'Protect-Screenlock'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
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
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```
![Row 1 Step 4](../../../static/img/Protect-Screen-Lock/image_18.png)  

### Row 2 Function: Script Log
Add a new row by clicking the `Add Row` button.  
![Row 2 Step 1](../../../static/img/Protect-Screen-Lock/image_19.png)  

A blank function will appear.  
![Row 2 Step 2](../../../static/img/Protect-Screen-Lock/image_20.png)  

Search and select the `Script Log` function.  
![Row 2 Step 3](../../../static/img/Protect-Screen-Lock/image_21.png)  

The following function will pop up on the screen:  
![Row 2 Step 4](../../../static/img/Protect-Screen-Lock/image_22.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Row 2 Step 5](../../../static/img/Protect-Screen-Lock/image_23.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Step 6](../../../static/img/Protect-Screen-Lock/image_24.png)  

## Completed Task

![Completed Task](../../../static/img/Protect-Screen-Lock/image_25.png)  

## Output

- Script log


