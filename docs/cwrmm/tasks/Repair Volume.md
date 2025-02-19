---
id: 'e49d58ba-bf8a-437b-8303-ac6266df35e2'
title: 'Repair Volume'
title_meta: 'Repair Volume'
keywords: ['chkdsk', 'repair', 'volume', 'drives', 'script']
description: 'This document provides a detailed guide on how to run a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired. It includes implementation steps for ConnectWise RMM users, user parameters, task creation instructions, and sample runs.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to run a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired. It provides a ConnectWise RMM implementation of the [Invoke-RepairVolume](<../../powershell/Invoke-RepairVolume.md>) agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/Repair-Volume/image_1.png)
![Sample Run 2](../../../static/img/Repair-Volume/image_2.png)
![Sample Run 3](../../../static/img/Repair-Volume/image_3.png)

## Dependencies

[EPM - Disk - Agnostic - Script - Invoke-RepairVolume](<../../powershell/Invoke-RepairVolume.md>)

## User Parameters

| Name        | Example  | Required | Type        | Description                                                                                      |
|-------------|----------|----------|-------------|--------------------------------------------------------------------------------------------------|
| Driveletters| C, D, E | False    | Text String | The letters of the target drives. The script will fall back to all internal drives if left blank. |
| Repair      | 0/1      | False    | Flag        | Toggles the repair option.                                                                       |
| Full        | 0/1      | False    | Flag        | Toggles the full offline repair option when using repair.                                        |

![User Parameters](../../../static/img/Repair-Volume/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/Repair-Volume/image_5.png)
![Task Creation Step 2](../../../static/img/Repair-Volume/image_6.png)

**Name:** `Repair Volume`  
**Description:** `Runs a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired.`  
**Category:** `Maintenance`  

![Task Creation Step 3](../../../static/img/Repair-Volume/image_7.png)

## Parameters

### Driveletters:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Driveletters Step 1](../../../static/img/Repair-Volume/image_8.png)

This screen will appear.

![Driveletters Step 2](../../../static/img/Repair-Volume/image_9.png)

- Set `Driveletters` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Driveletters Step 3](../../../static/img/Repair-Volume/image_10.png)

### Repair:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Repair Step 1](../../../static/img/Repair-Volume/image_8.png)

This screen will appear.

![Repair Step 2](../../../static/img/Repair-Volume/image_9.png)

- Set `Repair` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Repair Step 3](../../../static/img/Repair-Volume/image_11.png)

### Full:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Full Step 1](../../../static/img/Repair-Volume/image_8.png)

This screen will appear.

![Full Step 2](../../../static/img/Repair-Volume/image_9.png)

- Set `Full` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Full Step 3](../../../static/img/Repair-Volume/image_12.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Step 1](../../../static/img/Repair-Volume/image_13.png)

A blank function will appear.

![Task Step 2](../../../static/img/Repair-Volume/image_14.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Function Step 1](../../../static/img/Repair-Volume/image_15.png)
![Row 1 Function Step 2](../../../static/img/Repair-Volume/image_16.png)

The following function will pop up on the screen:

![Row 1 Function Step 3](../../../static/img/Repair-Volume/image_17.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Driveletters = '@Driveletters@'
if ( !([String]::IsNullOrWhiteSpace($Driveletters)) ) {
    $Driveletters = $($Driveletters -replace '\\s', '').trimend(',')
}
$Repair = '@Repair@'
$Full = '@Full@'
$Parameters = @{}
if ( $Driveletters -match '^[A-z](,(\\s{0,})[A-z]){0,25}$' ) {
    $Driveletters = $Driveletters -split ','
    $parameters.Add('Driveletters', $Driveletters)
}
if ($Repair -match '1|Yes|True') {
    $Parameters.Add('Repair', $true)
}
if ($Full -match '1|Yes|True') {
    $Parameters.Add('Full', $true)
}
#endregion
#region Setup - Variables
$ProjectName = 'Invoke-RepairVolume'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\\ProgramData\\_automation\\script\\$ProjectName"
$PS1Path = "$WorkingDirectory\\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory\\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\\$ProjectName-Error.txt"
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
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![Row 1 Function Step 4](../../../static/img/Repair-Volume/image_18.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Row 2 Function Step 1](../../../static/img/Repair-Volume/image_19.png)

A blank function will appear.

![Row 2 Function Step 2](../../../static/img/Repair-Volume/image_20.png)

Search and select the `Script Log` function.

![Row 2 Function Step 3](../../../static/img/Repair-Volume/image_21.png)

The following function will pop up on the screen:

![Row 2 Function Step 4](../../../static/img/Repair-Volume/image_22.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Row 2 Function Step 5](../../../static/img/Repair-Volume/image_23.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Row 2 Function Step 6](../../../static/img/Repair-Volume/image_24.png)

## Output

- Script log



