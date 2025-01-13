---
id: 'rmm-lsuclient-install-lenovo-update'
title: 'LSUClient - Install Lenovo Update'
title_meta: 'LSUClient - Install Lenovo Update'
keywords: ['lenovo', 'update', 'install', 'script', 'rmm']
description: 'This document provides a detailed guide on utilizing the LSU Client PowerShell module to install applicable and silently installable updates on Lenovo machines with non-discharging batteries. It outlines the steps for task creation, script implementation, and verification of execution logs.'
tags: ['patching', 'windows', 'setup', 'software', 'script']
draft: false
unlisted: false
---
## Summary

This Script will utilize the LSU Client powershell module to install any updates that are both applicable and silently installable on any Lenovo machine whose battery is currently not discharging.

CW RMM implementation of [Invoke-LSUClientUpdate](https://proval.itglue.com/DOC-5078775-11429402) agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/LSUClient---Install-Lenovo-Update/image_1.png)

![Sample Run 2](../../../static/img/LSUClient---Install-Lenovo-Update/image_2.png)

## Dependencies

[EPM - Vendor Specific - Agnostic - Invoke-LSUClientUpdate](https://proval.itglue.com/DOC-5078775-11429402)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/LSUClient---Install-Lenovo-Update/image_3.png)

![Task Creation Image 2](../../../static/img/LSUClient---Install-Lenovo-Update/image_4.png)

**Name:** `LSUClient - Install Lenovo Update`

**Description:** `This Script will utilize the LSU Client powershell module to install any updates that are both applicable and silently installable on any Lenovo machine whose battery is currently not discharging.`

**Category:** `Patching`

![Task Creation Image 3](../../../static/img/LSUClient---Install-Lenovo-Update/image_5.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/LSUClient---Install-Lenovo-Update/image_6.png)

A blank function will appear.

![Blank Function Image](../../../static/img/LSUClient---Install-Lenovo-Update/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/LSUClient---Install-Lenovo-Update/image_8.png)

![PowerShell Script Selection 2](../../../static/img/LSUClient---Install-Lenovo-Update/image_9.png)

The following function will pop up on the screen:

![PowerShell Function Popup](../../../static/img/LSUClient---Install-Lenovo-Update/image_10.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```
#region Setup - Variables
$ProjectName = 'Invoke-LsuClientUpdate'
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

![PowerShell Script Image](../../../static/img/LSUClient---Install-Lenovo-Update/image_11.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image 2](../../../static/img/LSUClient---Install-Lenovo-Update/image_12.png)

A blank function will appear.

![Blank Function Image 2](../../../static/img/LSUClient---Install-Lenovo-Update/image_13.png)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/LSUClient---Install-Lenovo-Update/image_14.png)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/LSUClient---Install-Lenovo-Update/image_15.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/LSUClient---Install-Lenovo-Update/image_16.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Button](../../../static/img/LSUClient---Install-Lenovo-Update/image_17.png)

## Completed Task

![Completed Task Image](../../../static/img/LSUClient---Install-Lenovo-Update/image_18.png)

## Output

- Script log



