---
id: '45c3d0a0-aac8-4794-b40f-c41d7b3b8f43'
slug: /45c3d0a0-aac8-4794-b40f-c41d7b3b8f43
title: 'Update Adobe Creative Cloud'
title_meta: 'Update Adobe Creative Cloud'
keywords: ['adobe', 'creative', 'cloud', 'update', 'script']
description: 'This document provides a detailed guide on how to list or update products for Adobe Creative Cloud using a ConnectWise RMM implementation of the agnostic script Update-AdobeCC. It includes user parameters, task creation steps, and sample runs to facilitate the process.'
tags: ['adobe', 'application', 'update']
draft: false
unlisted: false
---

## Summary

Lists or updates products for Adobe Creative Cloud. CW RMM implementation of the agnostic script [Update-AdobeCC](/docs/baddd511-d11a-4d0e-be88-cd8c942b5e39).

## Sample Run

![Sample Run 1](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_1.webp)  
![Sample Run 2](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_2.webp)  
![Sample Run 3](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_3.webp)  

## Dependencies

[Update-AdobeCC](/docs/baddd511-d11a-4d0e-be88-cd8c942b5e39)

## User Parameters

| Name  | Example | Required | Type  | Description                              |
|-------|---------|----------|-------|------------------------------------------|
| List  | 0/1     | False    | Flag  | Lists the available updates for Adobe CC. |

![User Parameters](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_6.webp)  

**Name:** `Update Adobe Creative Cloud`  
**Description:** `Lists or updates products for Adobe Creative Cloud.`  
**Category:** `Application`  
![Task Creation Step 3](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_7.webp)  

## Parameters

### List

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_8.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_9.webp)  

- Set `List` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Parameter Example](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_10.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_11.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_12.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Step 1](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_13.webp)  
![PowerShell Script Step 2](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_14.webp)  

The following function will pop up on the screen:  
![PowerShell Script Popup](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_15.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```powershell
#region parameters
$List = '@List@'
if ( $List -match '1|Yes|True' ) {
    $Mode = 'List'
} else {
    $Mode = 'Update'
}
$Parameters = @{
    Mode = $Mode
}
#endregion
#region Setup - Variables
$ProjectName = 'Update-AdobeCC'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
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

![PowerShell Script Execution](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_16.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row for Script Log](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_17.webp)  

A blank function will appear.  
![Blank Function for Script Log](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_18.webp)  

Search and select the `Script Log` function.  
![Select Script Log](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_19.webp)  

The following function will pop up on the screen:  
![Script Log Popup](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_20.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_21.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_22.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/45c3d0a0-aac8-4794-b40f-c41d7b3b8f43/image_23.webp)  

## Output

- Script log  