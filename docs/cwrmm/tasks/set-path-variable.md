---
id: '017a7a32-e501-46df-ba3c-6d1ce48d8c5a'
slug: /017a7a32-e501-46df-ba3c-6d1ce48d8c5a
title: 'Set Path Variable'
title_meta: 'Set Path Variable'
keywords: ['environment', 'variable', 'path', 'machine', 'script']
description: 'This document outlines the process to set the Environmental Path variable at the Machine scope using a script in ConnectWise RMM. It provides detailed steps, sample runs, user parameters, and task creation instructions for implementing the Set Path Variable functionality.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

Sets the provided path(s) to the Environmental Path variable for a Path at the Machine scope. CW RMM implementation of the agnostic script [Set-PathVariable](/docs/f91caf21-f00c-4459-8b1f-634720a92f4b).

## Sample Run

![Sample Run Image 1](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_1.webp)

![Sample Run Image 2](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_2.webp)

![Sample Run Image 3](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_3.webp)

## Dependencies

[Set-PathVariable](/docs/f91caf21-f00c-4459-8b1f-634720a92f4b)

## User Parameters

| Name | Example | Required | Type | Description |
|------|---------|----------|------|-------------|
| Path | - 'C://Temp'  - 'C://Temp', 'C://Temp//ProgramData', 'D://Text Files' | True | Text String | Comma-separated list of the path(s) to add to the path variable. **Requirement:** <ul><li>Each path should be enclosed in single quotes.</li><li>Path should exist on the end machine.</li></ul> |

![User Parameters Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_5.webp)

![Task Creation Image 2](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_6.webp)

**Name:** `Set Path Variable`  
**Description:** `Sets the provided path(s) to the Environmental Path variable for a Path at the Machine scope.`  
**Category:** `Custom`  

![Task Creation Image 3](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_7.webp)

## Parameters

### Path

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_8.webp)

This screen will appear.

![Parameter Screen Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_9.webp)

- Set `Path` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_10.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_11.webp)

A blank function will appear.

![Blank Function Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_12.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Function Image 1](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_13.webp)

![PowerShell Function Image 2](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_14.webp)

The following function will pop up on the screen:

![PowerShell Script Popup Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_15.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```PowerShell
#region parameters
$Path = "@Path@"
if ( $path -match ':\\' ) {
    $Path = $($Path -split ',').Trim()
} else {
    throw 'Invalid path.'
}
$Parameters = @{
    Path = $Path
}
#endregion
#region Setup - Variables
$ProjectName = 'Set-PathVariable'
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

![PowerShell Script Execution Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_16.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row for Script Log Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_17.webp)

A blank function will appear.

![Blank Function for Script Log Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_18.webp)

Search and select the `Script Log` function.

![Script Log Function Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_19.webp)

The following function will pop up on the screen:

![Script Log Popup Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_20.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Save Script Log Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_21.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Final Save Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_22.webp)

## Completed Task

![Completed Task Image](../../../static/img/docs/017a7a32-e501-46df-ba3c-6d1ce48d8c5a/image_23.webp)

## Output

- Script log