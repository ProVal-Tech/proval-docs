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

![Sample Run 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_1.webp)  
![Sample Run 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_2.webp)  
![Sample Run 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_3.webp)  

## Dependencies

[Protect Screen Lock Script](https://file.provaltech.com/repo/script/Protect-ScreenLock.ps1)

## User Parameters

| Name             | Example                        | Required | Default | Type          | Description                                                                                                                                                       |
|------------------|--------------------------------|----------|---------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScreenSaverPath  | C:/Temp/ScreenSaver/Saver.scr  | False    |         | Text String   | Optional parameter to specify the path of the screensaver file. The script will not set a screensaver if this parameter is not provided.                       |
| Timeout          | 900                            | True     | 900     | Number Value  | The maximum timeout value for the screensaver. Defaults to 900 seconds.                                                                                       |
| DomainException   | 0/1                           | False    |         | Flag          | Set to run a GPRESULT instead of making configuration changes when a machine is part of a domain.                                                                |

![User Parameters Image](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_6.webp)  

**Name:** `Protect Screen Lock`  
**Description:** `This script sets a specified .scr file as the default screensaver for all users, manages lockscreen timeout settings, and handles domain exceptions using Strapper. If no screensaver path is provided, this portion of the script is skipped.`  
**Category:** `Security`  
![Task Creation Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_7.webp)  

## Parameters

### ScreensaverPath:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![ScreensaverPath Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_8.webp)  

This screen will appear.  
![ScreensaverPath Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_9.webp)  

- Set `ScreensaverPath` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![ScreensaverPath Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_10.webp)  

### Timeout:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Timeout Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_8.webp)  

This screen will appear.  
![Timeout Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_9.webp)  

- Set `Timeout` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Number Value` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` button.
- Set `900` in the `Value` field.  
- Click the `Save` button.  
![Timeout Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_11.webp)  

### Domain Exception:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Domain Exception Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_8.webp)  

This screen will appear.  
![Domain Exception Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_9.webp)  

- Set `DomainException` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Domain Exception Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_12.webp)  

## Task Creation

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Creation Row Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_13.webp)  

A blank function will appear.  
![Task Creation Row Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_14.webp)  

### Row 1 Function: PowerShell Script
Search and select the `PowerShell Script` function.  
![Row 1 Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_15.webp)  
![Row 1 Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_16.webp)  

The following function will pop up on the screen:  
![Row 1 Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_17.webp)  

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
![Row 1 Step 4](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_18.webp)  

### Row 2 Function: Script Log
Add a new row by clicking the `Add Row` button.  
![Row 2 Step 1](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_19.webp)  

A blank function will appear.  
![Row 2 Step 2](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_20.webp)  

Search and select the `Script Log` function.  
![Row 2 Step 3](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_21.webp)  

The following function will pop up on the screen:  
![Row 2 Step 4](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_22.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Row 2 Step 5](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_23.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Step 6](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_24.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/a2e5e9e8-7601-42a9-9941-88a5142ee69a/image_25.webp)  

## Output

- Script log
