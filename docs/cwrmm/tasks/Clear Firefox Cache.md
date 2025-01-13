---
id: 'rmm-clear-firefox-cache'
title: 'Clear Firefox Cache'
title_meta: 'Clear Firefox Cache - Script Implementation'
keywords: ['firefox', 'cache', 'gecko', 'script', 'rmm']
description: 'This document provides a detailed guide on how to clear the Gecko engine (Firefox) browser caches using a script in ConnectWise RMM. It includes sample runs, task creation steps, and the complete script implementation.'
tags: ['application', 'script', 'logging', 'configuration']
draft: false
unlisted: false
---
## Summary

Clears Gecko engine (Firefox) browser caches. CW RMM implementation of [Clear-GeckoCache](https://proval.itglue.com/DOC-5078775-10371997).

## Sample Run

![Sample Run Image 1](../../../static/img/Clear-Firefox-Cache/image_1.png)  
![Sample Run Image 2](../../../static/img/Clear-Firefox-Cache/image_2.png)  

## Dependencies

[SWM - Software Configuration - Script - Clear-GeckoCache](https://proval.itglue.com/DOC-5078775-10371997)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/Clear-Firefox-Cache/image_3.png)  
![Task Creation Image 2](../../../static/img/Clear-Firefox-Cache/image_4.png)  

**Name:** `Clear Firefox Cache`  
**Description:** `Clears Gecko engine (Firefox) browser caches`  
**Category:** `Application`  
![Task Creation Image 3](../../../static/img/Clear-Firefox-Cache/image_5.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/Clear-Firefox-Cache/image_6.png)  

A blank function will appear.  
![Task Image 2](../../../static/img/Clear-Firefox-Cache/image_7.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/Clear-Firefox-Cache/image_8.png)  
![Task Image 4](../../../static/img/Clear-Firefox-Cache/image_9.png)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/Clear-Firefox-Cache/image_10.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
$ProjectName = 'Clear-GeckoCache'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"
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
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Task Image 6](../../../static/img/Clear-Firefox-Cache/image_11.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Image 7](../../../static/img/Clear-Firefox-Cache/image_12.png)  

A blank function will appear.  
![Task Image 8](../../../static/img/Clear-Firefox-Cache/image_13.png)  

Search and select the `Script Log` function.  
![Task Image 9](../../../static/img/Clear-Firefox-Cache/image_14.png)  

The following function will pop up on the screen:  
![Task Image 10](../../../static/img/Clear-Firefox-Cache/image_15.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Task Image 11](../../../static/img/Clear-Firefox-Cache/image_16.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 12](../../../static/img/Clear-Firefox-Cache/image_17.png)  

## Completed Script

![Completed Script](../../../static/img/Clear-Firefox-Cache/image_18.png)  

## Output

- Script Log  
![Output Image](../../../static/img/Clear-Firefox-Cache/image_19.png)  



