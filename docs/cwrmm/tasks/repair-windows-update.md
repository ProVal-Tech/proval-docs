---
id: '7c19c014-844e-40b8-951e-bf3609052d92'
slug: /7c19c014-844e-40b8-951e-bf3609052d92
title: 'Repair Windows Update'
title_meta: 'Repair Windows Update'
keywords: ['windows', 'update', 'repair', 'script', 'settings', 'dism', 'sfc']
description: 'This document provides a comprehensive guide on using a script to reset Windows update settings. It outlines the steps necessary to implement the script within the ConnectWise RMM platform, including user parameters, task creation, and execution details. The script aims to reset Windows update settings, though it may not resolve all update-related issues.'
tags: ['patching', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script is used to reset Windows update settings. Running the script does not guarantee resolution of any issues with Windows updates; it simply attempts to reset the settings. This is a ConnectWise RMM implementation of the [Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc) agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_1.webp)

![|Sample Run 2](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image.webp)

![Sample Run 3](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_3.webp)

## Dependencies

[Repair-WindowsUpdate](/docs/39345bfd-d9e2-4e68-9d7a-3e8b443140cc)

## User Parameters

| Name     | Example | Required | Type  | Description                                                                 |
|----------|---------|----------|-------|-----------------------------------------------------------------------------|
| SfcScan  | 0/1     | False    | Flag  | This flag toggles an optional SFC scan.                                    |
| DISMRepair  | 0/1     | False    | Flag  | This flag toggles an optional DISM Repair.                                    |

![User Parameter Image](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/{902A43AB-6450-48E4-A3E6-ED4FCC57C4C3}.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_5.webp)

![Task Creation Image 2](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_6.webp)

**Name:** `Repair Windows Update`  \
**Description:** `Script used to reset Windows update settings. It is not necessary that running the script will resolve any issue with the Windows updates. It will simply attempt to reset Windows update settings.`  \
**Category:** `Patching`  

![Task Creation Image 3](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_7.webp)

## Parameters

### SfcScan:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Parameter Setup Image 1](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_8.webp)

This screen will appear.

![Parameter Setup Image 2](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_9.webp)

- Set `SfcScan` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image 3](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_10.webp)

Add another parameter by clicking the Add Parameter button

![Parameter Setup Image 1](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_8.webp)



- Set `DismRepair` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![DISM Parameter Image](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image-1.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Image 1](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_11.webp)

A blank function will appear.

![Task Image 2](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_12.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Task Image 3](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_13.webp)

![Task Image 4](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_14.webp)

The following function will pop up on the screen:

![Task Image 5](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_15.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```
#region parameters
$SfcScan = '@SfcScan@'
$DISMRepair = '@DISMRepair@'
 
$Parameters = @{}
 
if ( $SfcScan -match '1|Yes|True' ) {
    $Parameters.Add('SfcScan', $true)
}
if ( $DISMRepair -match '1|Yes|True' ) {
	$Parameters.Add('DISMRepair', $true)
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

![Task Image](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/{C72E91DA-4F21-4745-A33F-02A4941718F0}.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Task Image 7](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_17.webp)

A blank function will appear.

![Task Image 8](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_18.webp)

Search and select the `Script Log` function.

![Task Image 9](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_19.webp)

The following function will pop up on the screen:

![Task Image 10](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_20.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Task Image 11](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_21.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Task Image 12](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_22.webp)

## Completed Script

![Completed Script Image](../../../static/img/docs/7c19c014-844e-40b8-951e-bf3609052d92/image_23.webp)

## Output

- Script log
