---
id: 'f05a636f-889c-4d3a-9eaa-039e0166cb51'
slug: /f05a636f-889c-4d3a-9eaa-039e0166cb51
title: 'Install SnapAgent'
title_meta: 'Install SnapAgent'
keywords: ['blackpoint', 'snapagent', 'installer', 'script', 'connectwise']
description: 'This document provides a comprehensive guide on installing BlackPoint SnapAgent through ConnectWise RMM using an agnostic script. It includes sample runs, user parameters, task creation steps, and detailed PowerShell scripting instructions.'
tags: ['application', 'installation', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines the installation of BlackPoint SnapAgent using the ConnectWise RMM implementation of the agnostic script [Install-SnapAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9).

## Sample Run

![Sample Run 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_1.webp)  
![Sample Run 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_2.webp)  
![Sample Run 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_3.webp)  

## Dependencies

- [Install-SnapAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9)  

## User Parameters

| Name | Example | Required | Type | Description |
|------|---------|----------|------|-------------|
| Path | [https://file.something.com/SnapAgent/SnapAgent_Installer.exe](https://file.something.com/SnapAgent/SnapAgent_Installer.exe) | True | Text String | Download URL for the installer. |

![User Parameters](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_6.webp)  

**Name:** `Install SnapAgent`  
**Description:** `Installs BlackPoint SnapAgent`  
**Category:** `Application`  
![Task Creation Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_7.webp)  

## Parameters

### DownloadUrl:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_9.webp)  

- Set `DownloadUrl` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_10.webp)  

## Task Creation

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_11.webp)  

A blank function will appear.  
![Add Row Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_12.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_13.webp)  
![PowerShell Script Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_14.webp)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_15.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Url = '@DownloadURL@'
if ( $Url -notmatch ':\\\\\\' ) {
    throw 'Invalid download URL.'
}
$Parameters = @{
    URL = $Url
}
#endregion
#region Setup - Variables
$ProjectName = 'Install-SnapAgent'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\\ProgramData\\_automation\\script\\$ProjectName"
$PS1Path = "$WorkingDirectory\\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory\\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\\$ProjectName-Error.txt"
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

![PowerShell Script Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_16.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Script Log Step 1](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_17.webp)  

A blank function will appear.  
![Script Log Step 2](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_18.webp)  

Search and select the `Script Log` function.  
![Script Log Step 3](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_19.webp)  

The following function will pop up on the screen:  
![Script Log Function](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_20.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Script Log Step 4](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_21.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Script Log Step 5](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_22.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/f05a636f-889c-4d3a-9eaa-039e0166cb51/image_23.webp)  

## Output

- Script log