---
id: 'rmm-repair-office-automatic-updates'
title: 'Repair Office Automatic Updates'
title_meta: 'Repair Office Automatic Updates - Automating Resolution of Update Failures'
keywords: ['office', 'updates', 'repair', 'automatic', 'script', 'task']
description: 'This document outlines the process of checking and automatically resolving common failure points in Office automatic updates using a script designed for ConnectWise RMM. It includes detailed steps for task creation, script implementation, and logging results.'
tags: ['application', 'script', 'office', 'updates', 'connectwise', 'rmm']
draft: false
unlisted: false
---
## Summary

Checks common failure points in Office automatic updates and automatically resolves them. CW RMM implementation of the agnostic script [Repair-OfficeAutomaticUpdate](https://proval.itglue.com/DOC-5078775-12083860).

## Sample Run

![Sample Run 1](../../../static/img/Repair-Office-Automatic-Updates/image_1.png)

![Sample Run 2](../../../static/img/Repair-Office-Automatic-Updates/image_2.png)

## Dependencies

[SWM - Software Configuration - Agnostic - Repair-OfficeAutomaticUpdate](https://proval.itglue.com/DOC-5078775-12083860)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/Repair-Office-Automatic-Updates/image_3.png)

![Task Creation 2](../../../static/img/Repair-Office-Automatic-Updates/image_4.png)

**Name:** `Repair Office Automatic Updates`  
**Description:** `Checks common failure points in Office automatic updates and automatically resolves them.`  
**Category:** `Application`  

![Task Creation 3](../../../static/img/Repair-Office-Automatic-Updates/image_5.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Repair-Office-Automatic-Updates/image_6.png)

A blank function will appear.

![Blank Function](../../../static/img/Repair-Office-Automatic-Updates/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/Repair-Office-Automatic-Updates/image_8.png)

![PowerShell Script Selection 2](../../../static/img/Repair-Office-Automatic-Updates/image_9.png)

The following function will pop up on the screen:

![PowerShell Function](../../../static/img/Repair-Office-Automatic-Updates/image_10.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region Setup - Variables
$ProjectName = 'Repair-OfficeAutomaticUpdate'
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

![PowerShell Result](../../../static/img/Repair-Office-Automatic-Updates/image_11.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/Repair-Office-Automatic-Updates/image_12.png)

A blank function will appear.

![Blank Function 2](../../../static/img/Repair-Office-Automatic-Updates/image_13.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Repair-Office-Automatic-Updates/image_14.png)

The following function will pop up on the screen:

![Script Log Function](../../../static/img/Repair-Office-Automatic-Updates/image_15.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/Repair-Office-Automatic-Updates/image_16.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/Repair-Office-Automatic-Updates/image_17.png)

## Completed Script

![Completed Script](../../../static/img/Repair-Office-Automatic-Updates/image_18.png)

## Output

- Script Log



