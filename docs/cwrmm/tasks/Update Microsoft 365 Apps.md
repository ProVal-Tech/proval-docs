---
id: 'cad2f0a6-69fb-41df-9fdf-8014b31f7b47'
title: 'Update Microsoft 365 Apps'
title_meta: 'Update Microsoft 365 Apps'
keywords: ['update', 'microsoft', '365', 'apps', 'office', 'click-to-run']
description: 'This document provides a detailed guide on how to run the Office Click-to-Run client to update Microsoft 365 Apps using ConnectWise RMM. It includes sample runs, task creation steps, and necessary dependencies for successful implementation.'
tags: ['application', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to run the Office Click-to-Run client to update Microsoft 365 Apps using the ConnectWise RMM implementation of the agnostic script [Update-Office](<../../powershell/Update-Office.md>).

## Sample Run

![Image 1](../../../static/img/Update-Microsoft-365-Apps/image_1.png)  
![Image 2](../../../static/img/Update-Microsoft-365-Apps/image_2.png)  

## Dependencies

- [SWM - Software Configuration - Agnostic - Update-Office](<../../powershell/Update-Office.md>)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Image 3](../../../static/img/Update-Microsoft-365-Apps/image_3.png)  
![Image 4](../../../static/img/Update-Microsoft-365-Apps/image_4.png)  

**Name:** `Update Microsoft 365 Apps`  
**Description:** `Runs the Office Click-to-Run client to update Microsoft 365 Apps.`  
**Category:** `Application`  
![Image 5](../../../static/img/Update-Microsoft-365-Apps/image_5.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image 6](../../../static/img/Update-Microsoft-365-Apps/image_6.png)  

A blank function will appear.  
![Image 7](../../../static/img/Update-Microsoft-365-Apps/image_7.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![Image 8](../../../static/img/Update-Microsoft-365-Apps/image_8.png)  
![Image 9](../../../static/img/Update-Microsoft-365-Apps/image_9.png)  

The following function will pop up on the screen:  
![Image 10](../../../static/img/Update-Microsoft-365-Apps/image_10.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region Setup - Variables
$ProjectName = 'Update-Office'
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
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![Image 11](../../../static/img/Update-Microsoft-365-Apps/image_11.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Image 12](../../../static/img/Update-Microsoft-365-Apps/image_12.png)  

A blank function will appear.  
![Image 13](../../../static/img/Update-Microsoft-365-Apps/image_13.png)  

Search and select the `Script Log` function.  
![Image 14](../../../static/img/Update-Microsoft-365-Apps/image_14.png)  

The following function will pop up on the screen:  
![Image 15](../../../static/img/Update-Microsoft-365-Apps/image_15.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Image 16](../../../static/img/Update-Microsoft-365-Apps/image_16.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Image 17](../../../static/img/Update-Microsoft-365-Apps/image_17.png)  

## Completed Task

![Image 18](../../../static/img/Update-Microsoft-365-Apps/image_18.png)  

## Output

- Script log
