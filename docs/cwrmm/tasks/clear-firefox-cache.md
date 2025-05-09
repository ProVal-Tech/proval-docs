---
id: 'b4921df9-1b7e-439a-80b9-28ca3d58f506'
slug: /b4921df9-1b7e-439a-80b9-28ca3d58f506
title: 'Clear Firefox Cache'
title_meta: 'Clear Firefox Cache'
keywords: ['firefox', 'cache', 'gecko', 'script', 'rmm']
description: 'This document provides a detailed guide on how to clear the Gecko engine (Firefox) browser caches using a script in ConnectWise RMM. It includes sample runs, task creation steps, and the complete script implementation.'
tags: ['application', 'logging']
draft: false
unlisted: false
---

## Summary

This document outlines how to clear the Gecko engine (Firefox) browser caches using the ConnectWise RMM implementation of [Clear-GeckoCache](/docs/4a400b6b-d468-417f-914b-8094e645fdb4).

## Sample Run

![Sample Run Image 1](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_1.webp)  
![Sample Run Image 2](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_2.webp)  

## Dependencies

[SWM - Software Configuration - Script - Clear-GeckoCache](/docs/4a400b6b-d468-417f-914b-8094e645fdb4)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_4.webp)  

**Name:** `Clear Firefox Cache`  
**Description:** `Clears Gecko engine (Firefox) browser caches`  
**Category:** `Application`  
![Task Creation Image 3](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_5.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_6.webp)  

A blank function will appear.  
![Task Image 2](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_8.webp)  
![Task Image 4](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_9.webp)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_10.webp)  

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$ProjectName = 'Clear-GeckoCache'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
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
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Task Image 6](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_11.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Image 7](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_12.webp)  

A blank function will appear.  
![Task Image 8](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_13.webp)  

Search and select the `Script Log` function.  
![Task Image 9](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_14.webp)  

The following function will pop up on the screen:  
![Task Image 10](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_15.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Task Image 11](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_16.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 12](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_17.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_18.webp)  

## Output

- Script Log  
![Output Image](../../../static/img/docs/b4921df9-1b7e-439a-80b9-28ca3d58f506/image_19.webp)  
