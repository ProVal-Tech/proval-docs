---
id: 'b2c83951-fe1d-4d71-b334-223590be3cc4'
slug: /b2c83951-fe1d-4d71-b334-223590be3cc4
title: 'Create - Desktop Shortcut'
title_meta: 'Create - Desktop Shortcut'
keywords: ['shortcut', 'desktop', 'uri', 'icon', 'management']
description: 'This document provides a comprehensive guide on how to create a shortcut in the Public Desktop folder using a script. It includes sample runs, user parameters, implementation steps, and detailed instructions for setting up the task in the Script Editor.'
tags: ['setup', 'software']
draft: false
unlisted: false
---

## Summary

This document describes how to create a shortcut in the Public Desktop folder.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_1.webp)

To add a desktop shortcut for [https://chatgpt.com/](https://chatgpt.com/):

![Sample Run Image 2](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_2.webp)

Select `Run Now` and click on `Run Task`:

![Sample Run Image 3](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_3.webp)

## Dependencies

[New-DesktopUriShortcut](/docs/56fa7d90-7c83-4c4a-ac0e-c49a6d5701af)

## User Parameters

| Name          | Example                                         | Required | Description                                                                                      |
|---------------|-------------------------------------------------|----------|--------------------------------------------------------------------------------------------------|
| TargetUri     | [https://www.google.com/](https://www.google.com/) | True     | The target path of the shortcut. This can be a local or web URI. Must begin with '\<DRIVE_LETTER>:/', 'Https://', or 'http://' |
| ShortcutName  | Google                                          | False    | The optional name of the shortcut being set. If not provided, the file name or DnsSafeHost property will be used as the shortcut name. |
| IconLocation   | --                                             | False    | Optionally set an *.ico file as the shortcut icon.                                            |

![User Parameters Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_4.webp)

## Implementation

Create a new `Script Editor` style script in the system to implement this task.

![Implementation Image 1](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_5.webp)

![Implementation Image 2](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_6.webp)

**Name:** Create - Desktop Shortcut  \
**Description:** Creates a shortcut in the Public Desktop folder.  \
**Category:** Management  

![Implementation Image 3](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_7.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Parameters Image 1](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_8.webp)

This screen will appear.

![Parameters Image 2](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_9.webp)

### TargetUri

- Set `TargetUri` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Toggle ON the `Required Field` button.
- Click the `Save` button.

![TargetUri Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_10.webp)

Click the `Confirm` button to save the parameter.

![TargetUri Confirm Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_11.webp)

### ShortcutName

- Set `ShortcutName` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![ShortcutName Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_12.webp)

Click the `Confirm` button to save the parameter.

![ShortcutName Confirm Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_13.webp)

### IconLocation

- Set `IconLocation` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![IconLocation Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_14.webp)

Click the `Confirm` button to save the parameter.

![IconLocation Confirm Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_15.webp)

Once all the parameters are created, it should look like this:

![Parameters Created Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_16.webp)

Proceed with the following steps to create a task.

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_17.webp)

A blank function will appear.

![Task Blank Function Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_18.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_19.webp)

The following function will pop up on the screen:

![PowerShell Script Popup Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_20.webp)

Copy the below PowerShell commands and paste them in the `PowerShell Script Editor` box:

```PowerShell
# # Parameters and Globals
# # Parameters and Globals # # Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.

$TargetUri = '@TargetUri@'
$ShortcutName = '@ShortcutName@'
$IconLocation = '@IconLocation@'
$Parameters = @{}

if (( $IconLocation -match '\.ico$') ) 
{$Parameters['IconLocation'] = $IconLocation}

if ($TargetUri -match ':') {
$Parameters['TargetUri'] = $TargetUri
} else {
throw 'Invalid Target'}

$Parameters['ShortcutName'] = $ShortcutName

#region Setup - Variables
$ProjectName = 'New-DesktopUriShortcut'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
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

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![PowerShell Script Editor Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_21.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Script Log Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_22.webp)

A blank function will appear.

![Script Log Blank Function Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_18.webp)

Search and select the `Script Log` function.

![Script Log Function Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_23.webp)

The following function will pop up on the screen:

![Script Log Popup Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_24.webp)

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_25.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Script Log Save Confirmation Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_26.webp)

## Completed Task

The Script Editor should look like this:

![Completed Task Image](../../../static/img/docs/b2c83951-fe1d-4d71-b334-223590be3cc4/image_27.webp)

## Output

- Script log