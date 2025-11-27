---
id: '3ebba7bf-e121-40d0-b06e-2090ebdb9780'
slug: /3ebba7bf-e121-40d0-b06e-2090ebdb9780
title: 'Uninstall Microsoft Office'
title_meta: 'Uninstall Microsoft Office'
keywords: ['uninstall', 'microsoft', 'office', 'software', 'script']
description: 'This document provides a comprehensive guide on uninstalling Microsoft Office products using OffScrub. It details accepted versions, user parameters, task creation, and the execution of the script, ensuring users can effectively manage Office installations.'
tags: ['application', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document allows the uninstallation of Microsoft Office products via OffScrub. Accepted Versions: All, 2003, 2007, 2010, 2013, 2016, and C2R. Leaving the parameter blank will remove all installed versions.

CW RMM implementation of [Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed) agnostic script.

## Sample Run

![Sample Run](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_1.webp)

**To remove all installed versions:**

![Remove All](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_2.webp)

**To remove selected versions:**

![Remove Selected 1](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_3.webp)

![Remove Selected 2](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_4.webp)

## Dependencies

[Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed)

## User Parameters

| Name    | Example                        | Accepted Values                                              | Required | Default | Type          | Description                                                                                   |
|---------|--------------------------------|-------------------------------------------------------------|----------|---------|---------------|-----------------------------------------------------------------------------------------------|
| Version | - All                          | - 2003 - 2007 - 2010 - 2013 - 2016 - C2R - All             | True     | All     | Text String   | Office Version to remove. Leaving it blank is equivalent to `All`.                          |

![User Parameters](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_5.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_6.webp)

![Task Creation 2](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_7.webp)

**Name:** `Uninstall Microsoft Office`

**Description:** `Allows the uninstallation of Microsoft Office products via OffScrub. Accepted Versions: All, 2003, 2007, 2010, 2013, 2016, and C2R. Leaving the parameter blank will remove all installed versions.`

**Category:** `Application`

![Task Creation 3](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_8.webp)

## Parameters

### Version:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_9.webp)

This screen will appear.

![Parameter Screen](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_10.webp)

- Set `Version` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_11.webp)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_12.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_13.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_14.webp)

![PowerShell Function](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_15.webp)

The following function will pop up on the screen:

![PowerShell Function Popup](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_16.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```PowerShell
#region parameters
$version = '@version@'
$parameters = @{}
if ( ($version -match 'All|\SVersion\S') -or ([String]::IsNullOrWhiteSpace($version)) ) {
    $parameters.Add('All', $true)
} else {
    if ( $version -match '2003' ) {
        $parameters.Add('Office03', $true)
    }
    if ( $version -match '2007' ) {
        $parameters.Add('Office07', $true)
    }
    if ( $version -match '2010' ) {
        $parameters.Add('Office10', $true)
    }
    if ( $version -match '2013' ) {
        $parameters.Add('Office13', $true)
    }
    if ( $version -match '2016' ) {
        $parameters.Add('Office16', $true)
    }
    if ( $version -match 'C2R' ) {
        $parameters.Add('Officec2r', $true)
    }
}
if ( !($parameters) ) {
    throw 'Invalid version specified. Please specify either ''All'', ''2003'', ''2007'', ''2010'', ''2013'', ''2016'', or ''C2R''.'
}
#endregion
#region Setup - Variables
$ProjectName = 'Invoke-OfficeScrub'
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
try {
    Invoke-WebRequest -Uri $PS1URL -OutFile $PS1path -UseBasicParsing -ErrorAction Stop
} catch {
    if (!(Test-Path -Path $PS1Path )) {
        throw ('Failed to download the script from ''{0}'', and no local copy of the script exists on the machine. Reason: {1}' -f $PS1URL, $($Error[0].Exception.Message))
    }
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

![Execution](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_17.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_18.webp)

A blank function will appear.

![Blank Function 2](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_19.webp)

Search and select the `Script Log` function.

![Select Script Log](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_20.webp)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_21.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_22.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_23.webp)

## Completed Script

![Completed Script](../../../static/img/docs/3ebba7bf-e121-40d0-b06e-2090ebdb9780/image_24.webp)

## Output

- Script log