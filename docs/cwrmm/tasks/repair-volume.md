---
id: 'e49d58ba-bf8a-437b-8303-ac6266df35e2'
slug: /e49d58ba-bf8a-437b-8303-ac6266df35e2
title: 'Repair Volume'
title_meta: 'Repair Volume'
keywords: ['chkdsk', 'repair', 'volume', 'drives', 'script']
description: 'This document provides a detailed guide on how to run a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired. It includes implementation steps for ConnectWise RMM users, user parameters, task creation instructions, and sample runs.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to run a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired. It provides a ConnectWise RMM implementation of the [Invoke-RepairVolume](/docs/5fc50641-00ec-41c0-b4c8-472d93cd8cfe) agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_1.webp)
![Sample Run 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_2.webp)
![Sample Run 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_3.webp)

## Dependencies

[Invoke-RepairVolume](/docs/5fc50641-00ec-41c0-b4c8-472d93cd8cfe)

## User Parameters

| Name        | Example  | Required | Type        | Description                                                                                      |
|-------------|----------|----------|-------------|--------------------------------------------------------------------------------------------------|
| Driveletters| C, D, E | False    | Text String | The letters of the target drives. The script will fall back to all internal drives if left blank. |
| Repair      | 0/1      | False    | Flag        | Toggles the repair option.                                                                       |
| Full        | 0/1      | False    | Flag        | Toggles the full offline repair option when using repair.                                        |

![User Parameters](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_5.webp)
![Task Creation Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_6.webp)

**Name:** `Repair Volume`  
**Description:** `Runs a PowerShell equivalent of chkdsk on any or all drives, with the option to repair if desired.`  
**Category:** `Maintenance`  

![Task Creation Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_7.webp)

## Parameters

### Driveletters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Driveletters Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_8.webp)

This screen will appear.

![Driveletters Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_9.webp)

- Set `Driveletters` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Driveletters Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_10.webp)

### Repair

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Repair Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_8.webp)

This screen will appear.

![Repair Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_9.webp)

- Set `Repair` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Repair Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_11.webp)

### Full

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Full Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_8.webp)

This screen will appear.

![Full Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_9.webp)

- Set `Full` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Full Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_12.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_13.webp)

A blank function will appear.

![Task Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_14.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Function Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_15.webp)
![Row 1 Function Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_16.webp)

The following function will pop up on the screen:

![Row 1 Function Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_17.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```Powershell
#region parameters
$Driveletters = '@Driveletters@'
if ( !([String]::IsNullOrWhiteSpace($Driveletters)) ) {
    $Driveletters = $($Driveletters -replace '\s', '').trimend(',')
}
$Repair = '@Repair@'
$Full = '@Full@'
$Parameters = @{}
if ( $Driveletters -match '^[A-z](,(\s{0,})[A-z]){0,25}$' ) {
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

![Row 1 Function Step 4](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_18.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Row 2 Function Step 1](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_19.webp)

A blank function will appear.

![Row 2 Function Step 2](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_20.webp)

Search and select the `Script Log` function.

![Row 2 Function Step 3](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_21.webp)

The following function will pop up on the screen:

![Row 2 Function Step 4](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_22.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Row 2 Function Step 5](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_23.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Row 2 Function Step 6](../../../static/img/docs/e49d58ba-bf8a-437b-8303-ac6266df35e2/image_24.webp)

## Output

- Script log
