---
id: '3ebba7bf-e121-40d0-b06e-2090ebdb9780'
title: 'Uninstall Microsoft Office'
title_meta: 'Uninstall Microsoft Office'
keywords: ['uninstall', 'microsoft', 'office', 'software', 'script']
description: 'This document provides a comprehensive guide on uninstalling Microsoft Office products using OffScrub. It details accepted versions, user parameters, task creation, and the execution of the script, ensuring users can effectively manage Office installations.'
tags: ['application', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

Allows the uninstallation of Microsoft Office products via OffScrub. Accepted Versions: All, 2003, 2007, 2010, 2013, 2016, and C2R. Leaving the parameter blank will remove all installed versions.

CW RMM implementation of [Invoke-OfficeScrub](https://proval.itglue.com/DOC-5078775-7593306) agnostic script.

## Sample Run

![Sample Run](../../../static/img/Uninstall-Microsoft-Office/image_1.png)

**To remove all installed versions:**

![Remove All](../../../static/img/Uninstall-Microsoft-Office/image_2.png)

**To remove selected versions:**

![Remove Selected 1](../../../static/img/Uninstall-Microsoft-Office/image_3.png)

![Remove Selected 2](../../../static/img/Uninstall-Microsoft-Office/image_4.png)

## Dependencies

[SWM - Software Uninstall - Invoke-OfficeScrub](https://proval.itglue.com/DOC-5078775-7593306)

## User Parameters

| Name    | Example                        | Accepted Values                                              | Required | Default | Type          | Description                                                                                   |
|---------|--------------------------------|-------------------------------------------------------------|----------|---------|---------------|-----------------------------------------------------------------------------------------------|
| Version | - All                          | - 2003- 2007- 2010- 2013- 2016- c2r- All | True     | All     | Text String   | Office Version to remove. Leaving it blank is equivalent to `All`.                          |

![User Parameters](../../../static/img/Uninstall-Microsoft-Office/image_5.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](../../../static/img/Uninstall-Microsoft-Office/image_6.png)

![Task Creation 2](../../../static/img/Uninstall-Microsoft-Office/image_7.png)

**Name:** `Uninstall Microsoft Office`

**Description:** `Allows the uninstallation of Microsoft Office products via OffScrub. Accepted Versions: All, 2003, 2007, 2010, 2013, 2016, and C2R. Leaving the parameter blank will remove all installed versions.`

**Category:** `Application`

![Task Creation 3](../../../static/img/Uninstall-Microsoft-Office/image_8.png)

## Parameters

### Version:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/Uninstall-Microsoft-Office/image_9.png)

This screen will appear.

![Parameter Screen](../../../static/img/Uninstall-Microsoft-Office/image_10.png)

- Set `Version` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/Uninstall-Microsoft-Office/image_11.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Uninstall-Microsoft-Office/image_12.png)

A blank function will appear.

![Blank Function](../../../static/img/Uninstall-Microsoft-Office/image_13.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell](../../../static/img/Uninstall-Microsoft-Office/image_14.png)

![PowerShell Function](../../../static/img/Uninstall-Microsoft-Office/image_15.png)

The following function will pop up on the screen:

![PowerShell Function Popup](../../../static/img/Uninstall-Microsoft-Office/image_16.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `3600` seconds. Click the `Save` button.

```
#region parameters
$version = '@version@'
$parameters = @{}
if ( ($version -match 'All|//SVersion//S') -or ([String]::IsNullOrWhiteSpace($version)) ) {
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
$WorkingDirectory = "C://ProgramData//_automation//script//$ProjectName"
$PS1Path = "$WorkingDirectory//$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
$LogPath = "$WorkingDirectory//$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory//$ProjectName-Error.txt"
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

![Execution](../../../static/img/Uninstall-Microsoft-Office/image_17.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/Uninstall-Microsoft-Office/image_18.png)

A blank function will appear.

![Blank Function 2](../../../static/img/Uninstall-Microsoft-Office/image_19.png)

Search and select the `Script Log` function.

![Select Script Log](../../../static/img/Uninstall-Microsoft-Office/image_20.png)

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Uninstall-Microsoft-Office/image_21.png)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/Uninstall-Microsoft-Office/image_22.png)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/Uninstall-Microsoft-Office/image_23.png)

## Completed Script

![Completed Script](../../../static/img/Uninstall-Microsoft-Office/image_24.png)

## Output

- Script log











