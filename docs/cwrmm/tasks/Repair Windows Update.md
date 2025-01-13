---
id: 'rmm-repair-windows-update'
title: 'Repair Windows Update'
title_meta: 'Repair Windows Update - Script to Reset Windows Update Settings'
keywords: ['windows', 'update', 'repair', 'script', 'settings']
description: 'This document provides a comprehensive guide on using a script to reset Windows update settings. It outlines the steps necessary to implement the script within the ConnectWise RMM platform, including user parameters, task creation, and execution details. The script aims to reset Windows update settings, though it may not resolve all update-related issues.'
tags: ['windows', 'script', 'update', 'patching', 'configuration']
draft: false
unlisted: false
---
## Summary

Script used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings. CW RMM implementation of [Repair-WindowsUpdate](https://proval.itglue.com/DOC-5078775-11167373) agnostic script.

## Sample Run

![Sample Run 1](..\..\..\static\img\Repair-Windows-Update\image_1.png)

![Sample Run 2](..\..\..\static\img\Repair-Windows-Update\image_2.png)

![Sample Run 3](..\..\..\static\img\Repair-Windows-Update\image_3.png)

## Dependencies

[SEC - Windows Update - Agnostic - Repair-WindowsUpdate](https://proval.itglue.com/DOC-5078775-11167373)

## User Parameters

| Name     | Example | Required | Type  | Description                                                                 |
|----------|---------|----------|-------|-----------------------------------------------------------------------------|
| SfcScan  | 0/1     | False    | Flag  | This flag toggles an optional sfc scan.                                    |

![User Parameters Image](..\..\..\static\img\Repair-Windows-Update\image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](..\..\..\static\img\Repair-Windows-Update\image_5.png)

![Task Creation Image 2](..\..\..\static\img\Repair-Windows-Update\image_6.png)

**Name:** `Repair Windows Update`  
**Description:** `Script used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.`  
**Category:** `Patching`  

![Task Creation Image 3](..\..\..\static\img\Repair-Windows-Update\image_7.png)

## Parameters

### SfcScan:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Parameter Setup Image 1](..\..\..\static\img\Repair-Windows-Update\image_8.png)

This screen will appear.

![Parameter Setup Image 2](..\..\..\static\img\Repair-Windows-Update\image_9.png)

- Set `SfcScan` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image 3](..\..\..\static\img\Repair-Windows-Update\image_10.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Image 1](..\..\..\static\img\Repair-Windows-Update\image_11.png)

A blank function will appear.

![Task Image 2](..\..\..\static\img\Repair-Windows-Update\image_12.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Task Image 3](..\..\..\static\img\Repair-Windows-Update\image_13.png)

![Task Image 4](..\..\..\static\img\Repair-Windows-Update\image_14.png)

The following function will pop up on the screen:

![Task Image 5](..\..\..\static\img\Repair-Windows-Update\image_15.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```
#region parameters
$SfcScan = '@SfcScan@'
if ( $SfcScan -match '1|Yes|True' ) {
    $Parameters = @{
        SfcScan = $true
    }
}
#endregion
#region Setup - Variables
$ProjectName = 'Repair-WindowsUpdate'
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

![Task Image 6](..\..\..\static\img\Repair-Windows-Update\image_16.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Task Image 7](..\..\..\static\img\Repair-Windows-Update\image_17.png)

A blank function will appear.

![Task Image 8](..\..\..\static\img\Repair-Windows-Update\image_18.png)

Search and select the `Script Log` function.

![Task Image 9](..\..\..\static\img\Repair-Windows-Update\image_19.png)

The following function will pop up on the screen:

![Task Image 10](..\..\..\static\img\Repair-Windows-Update\image_20.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Task Image 11](..\..\..\static\img\Repair-Windows-Update\image_21.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Task Image 12](..\..\..\static\img\Repair-Windows-Update\image_22.png)

## Completed Script

![Completed Script Image](..\..\..\static\img\Repair-Windows-Update\image_23.png)

## Output

- Script log


