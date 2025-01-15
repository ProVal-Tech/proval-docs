---
id: 'f17a9912-b0d6-4b48-812d-380a4dc9de90'
title: 'Update PowerShellGet Module'
title_meta: 'Update PowerShellGet Module'
keywords: ['powershellget', 'update', 'module', 'script', 'install']
description: 'This document provides a comprehensive guide on how to install or update the PowerShellGet module to the latest version available in the PowerShell Gallery, including sample runs, dependencies, task creation steps, and script execution details.'
tags: ['installation', 'update', 'script', 'custom', 'security']
draft: false
unlisted: false
---
## Summary

Installs or updates PowerShellGet to the latest version available in the PowerShell Gallery. CW RMM implementation of the agnostic script [Update-PowerShellGet](https://file.provaltech.com/repo/script/Update-PowerShellGet.ps1).

## Sample Run

![Sample Run 1](../../../static/img/Update-PowerShellGet-Module/image_1.png)

![Sample Run 2](../../../static/img/Update-PowerShellGet-Module/image_2.png)

## Dependencies

[https://file.provaltech.com/repo/script/Update-PowerShellGet.ps1](https://file.provaltech.com/repo/script/Update-PowerShellGet.ps1)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/Update-PowerShellGet-Module/image_3.png)

![Task Creation 2](../../../static/img/Update-PowerShellGet-Module/image_4.png)

**Name:** `Update PowerShellGet Module`  
**Description:** `Installs or updates PowerShellGet to the latest version available in the PowerShell Gallery.`  
**Category:** `Custom`  

![Task Creation 3](../../../static/img/Update-PowerShellGet-Module/image_5.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Update-PowerShellGet-Module/image_6.png)

A blank function will appear.

![Blank Function](../../../static/img/Update-PowerShellGet-Module/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/Update-PowerShellGet-Module/image_8.png)

![PowerShell Script Selection 2](../../../static/img/Update-PowerShellGet-Module/image_9.png)

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/Update-PowerShellGet-Module/image_10.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

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

![PowerShell Script Saved](../../../static/img/Update-PowerShellGet-Module/image_11.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row](../../../static/img/Update-PowerShellGet-Module/image_12.png)

A blank function will appear.

![Blank Function](../../../static/img/Update-PowerShellGet-Module/image_13.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Update-PowerShellGet-Module/image_14.png)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Update-PowerShellGet-Module/image_15.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/Update-PowerShellGet-Module/image_16.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Script Saved](../../../static/img/Update-PowerShellGet-Module/image_17.png)

## Completed Task

![Completed Task](../../../static/img/Update-PowerShellGet-Module/image_18.png)

## Output

- Script log






