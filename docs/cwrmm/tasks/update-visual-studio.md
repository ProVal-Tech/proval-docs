---
id: '04ffcb6e-be50-4582-9b9b-050c39518811'
slug: /04ffcb6e-be50-4582-9b9b-050c39518811
title: 'Update Visual Studio'
title_meta: 'Update Visual Studio'
keywords: ['visualstudio', 'updates', 'automation', 'script', 'software']
description: 'This document outlines the process to automate the update of all installed Visual Studio versions using a ConnectWise RMM implementation. It includes step-by-step instructions for task creation, script setup, and execution, ensuring a seamless update process for users.'
tags: ['application', 'software', 'update']
draft: false
unlisted: false
---

## Summary

This document updates all installed Visual Studio versions automatically using the ConnectWise RMM implementation of the agnostic script [Update-VisualStudio](/docs/ef41c491-27c6-41d4-a478-eb66ca809399).

## Sample Run

![Sample Run 1](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_1.png)
![Sample Run 2](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_2.png)

## Dependencies

Refer to the [SWM - Software Update - Agnostic - Update-VisualStudio](/docs/ef41c491-27c6-41d4-a478-eb66ca809399) for dependencies.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_3.png)
![Task Creation Step 2](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_4.png)

**Name:** `Update Visual Studio`  
**Description:** `Updates all installed VS versions automatically`  
**Category:** `Application`  
![Task Creation Step 3](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_5.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_6.png)

A blank function will appear.

![Blank Function](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell Script](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_8.png)
![PowerShell Script Function](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_9.png)

The following function will pop up on the screen:

![PowerShell Script Pop Up](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_10.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```
#region Setup - Variables
$ProjectName = 'Update-VisualStudio'
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

![PowerShell Script Example](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_11.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row for Script Log](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_12.png)

A blank function will appear.

![Blank Function for Script Log](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_13.png)

Search and select the `Script Log` function.

![Select Script Log](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_14.png)

The following function will pop up on the screen:

![Script Log Pop Up](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_15.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_16.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Final Save](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_17.png)

## Completed Task

![Completed Task](../../../static/img/docs/04ffcb6e-be50-4582-9b9b-050c39518811/image_18.png)

## Output

- Script log

