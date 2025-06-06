---
id: '6e98d927-5337-44d1-ac5d-f92e2cad1ec7'
slug: /6e98d927-5337-44d1-ac5d-f92e2cad1ec7
title: 'LSUClient - Install Lenovo Update'
title_meta: 'LSUClient - Install Lenovo Update'
keywords: ['lenovo', 'update', 'install', 'script', 'rmm']
description: 'This document provides a detailed guide on utilizing the LSU Client PowerShell module to install applicable and silently installable updates on Lenovo machines with non-discharging batteries. It outlines the steps for task creation, script implementation, and verification of execution logs.'
tags: ['patching', 'setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script will utilize the LSU Client PowerShell module to install any updates that are both applicable and silently installable on any Lenovo machine whose battery is currently not discharging.

CW RMM implementation of [Invoke-LSUClientUpdate](/docs/da759e59-6f62-476d-a776-39b09e07ffbe) agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_1.webp)

![Sample Run 2](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_2.webp)

## Dependencies

[Invoke-LSUClientUpdate](/docs/da759e59-6f62-476d-a776-39b09e07ffbe)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_3.webp)

![Task Creation Image 2](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_4.webp)

**Name:** `LSUClient - Install Lenovo Update`

**Description:** `This script will utilize the LSU Client PowerShell module to install any updates that are both applicable and silently installable on any Lenovo machine whose battery is currently not discharging.`

**Category:** `Patching`

![Task Creation Image 3](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_5.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_6.webp)

A blank function will appear.

![Blank Function Image](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_7.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_8.webp)

![PowerShell Script Selection 2](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_9.webp)

The following function will pop up on the screen:

![PowerShell Function Popup](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_10.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```PowerShell
#region Setup - Variables
$ProjectName = 'Invoke-LsuClientUpdate'
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

![PowerShell Script Image](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_11.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image 2](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_12.webp)

A blank function will appear.

![Blank Function Image 2](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_13.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_14.webp)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_15.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_16.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Button](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_17.webp)

## Completed Task

![Completed Task Image](../../../static/img/docs/6e98d927-5337-44d1-ac5d-f92e2cad1ec7/image_18.webp)

## Output

- Script log