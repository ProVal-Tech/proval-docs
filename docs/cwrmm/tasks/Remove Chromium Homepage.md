---
id: 'c1459ee7-e52f-4f03-8bdc-7ddba542a6fb'
slug: /c1459ee7-e52f-4f03-8bdc-7ddba542a6fb
title: 'Remove Chromium Homepage'
title_meta: 'Remove Chromium Homepage'
keywords: ['chromium', 'homepage', 'browsers', 'edge', 'chrome', 'brave', 'rmm']
description: 'This document outlines the implementation of a script to remove homepage settings from popular Chromium-based browsers including Edge, Chrome, and Brave using ConnectWise RMM. It includes user parameters, task creation steps, and sample runs.'
tags: ['setup', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to remove homepage settings from popular Chromium-based browsers (Edge, Chrome, and Brave). It includes the CW RMM implementation of [Remove-ChromiumHomepage](<../../powershell/Remove-ChromiumHomepage.md>).

## Sample Run

![Sample Run 1](../../../static/img/Remove-Chromium-Homepage/image_1.png)  
![Sample Run 2](../../../static/img/Remove-Chromium-Homepage/image_2.png)  
![Sample Run 3](../../../static/img/Remove-Chromium-Homepage/image_3.png)  

## Dependencies

[SWM - Software Configuration - Remove-ChromiumHomepage](<../../powershell/Remove-ChromiumHomepage.md>)

## User Parameters

| Name      | Example                                                                                       | Required | Type        | Description                                                                                                                                                                                                 |
|-----------|-----------------------------------------------------------------------------------------------|----------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `Target`  | - Chrome - Edge - Brave - Chrome, Edge - Edge, Brave - Chrome, Edge, Brave | False    | Text String | Name of the browser(s) to remove the homepage from. The script will clear/remove the homepage of all three browsers (Chrome, Edge, and Brave) if the parameter is left blank.                             |

![User Parameters](../../../static/img/Remove-Chromium-Homepage/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/Remove-Chromium-Homepage/image_5.png)  
![Task Creation 2](../../../static/img/Remove-Chromium-Homepage/image_6.png)  

**Name:** `Remove Chromium Homepage`  
**Description:** `Removes homepage settings from popular Chromium-based browsers (Edge, Chrome, and Brave).`  
**Category:** `Application`  

![Task Creation Icon](../../../static/img/Remove-Chromium-Homepage/image_7.png)

## Parameters

### Target:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/Remove-Chromium-Homepage/image_8.png)  

This screen will appear.

![Parameter Setup](../../../static/img/Remove-Chromium-Homepage/image_9.png)  

- Set `Target` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Save](../../../static/img/Remove-Chromium-Homepage/image_10.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/Remove-Chromium-Homepage/image_11.png)  

A blank function will appear.

![Blank Function](../../../static/img/Remove-Chromium-Homepage/image_12.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Function 1](../../../static/img/Remove-Chromium-Homepage/image_13.png)  
![PowerShell Function 2](../../../static/img/Remove-Chromium-Homepage/image_14.png)  

The following function will pop up on the screen:  

![PowerShell Function](../../../static/img/Remove-Chromium-Homepage/image_15.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Target = '@Target@'
$Browser = @()
if ( $Target -match '/STarget/S' -or ($null -eq $Target) ) {
    $Browser += 'Brave', 'Chrome', 'Edge'
} elseif ( $target.Length -lt 2  ) {
    $Browser += 'Brave', 'Chrome', 'Edge'
} else {
    if ( $Target -match 'Brave' ) {
        $Browser += 'Brave'
    }
    if ( $Target -match 'Chrome' ) {
        $Browser += 'Chrome'
    }
    if ( $Target -match 'Edge' ) {
        $Browser += 'Edge'
    }
}
$parameters = @{
    Target = $Browser
}
```

```
#region Setup - Variables
$ProjectName = 'Remove-ChromiumHomepage'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
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
```

```
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Row 1 Complete](../../../static/img/Remove-Chromium-Homepage/image_16.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row for Script Log](../../../static/img/Remove-Chromium-Homepage/image_17.png)  

A blank function will appear.

![Blank Function for Script Log](../../../static/img/Remove-Chromium-Homepage/image_18.png)  

Search and select the `Script Log` function.

![Script Log Function 1](../../../static/img/Remove-Chromium-Homepage/image_19.png)  
![Script Log Function 2](../../../static/img/Remove-Chromium-Homepage/image_20.png)  

The following function will pop up on the screen:  

![Script Log Function](../../../static/img/Remove-Chromium-Homepage/image_21.png)  

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save](../../../static/img/Remove-Chromium-Homepage/image_22.png)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/Remove-Chromium-Homepage/image_23.png)  

## Completed Script

![Completed Script](../../../static/img/Remove-Chromium-Homepage/image_24.png)  

## Output

- Script log  
![Script Log Output](../../../static/img/Remove-Chromium-Homepage/image_25.png)  


