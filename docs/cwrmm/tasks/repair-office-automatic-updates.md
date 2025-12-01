---
id: '6abb79b5-4638-4d53-b960-f11972f0f96d'
slug: /6abb79b5-4638-4d53-b960-f11972f0f96d
title: 'Repair Office Automatic Updates'
title_meta: 'Repair Office Automatic Updates'
keywords: ['office', 'updates', 'repair', 'automatic', 'script', 'task']
description: 'This document outlines the process of checking and automatically resolving common failure points in Office automatic updates using a script designed for ConnectWise RMM. It includes detailed steps for task creation, script implementation, and logging results.'
tags: ['application', 'connectwise', 'office']
draft: false
unlisted: false
---

## Summary

This document checks common failure points in Office automatic updates and automatically resolves them. It provides a ConnectWise RMM implementation of the agnostic script [Repair-OfficeAutomaticUpdate](/docs/ae9fa5e1-eb5b-45e5-8777-977d50e39c97).

## Sample Run

![Sample Run 1](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_1.webp)

![Sample Run 2](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_2.webp)

## Dependencies

[Repair-OfficeAutomaticUpdate](/docs/ae9fa5e1-eb5b-45e5-8777-977d50e39c97)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_3.webp)

![Task Creation 2](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_4.webp)

**Name:** `Repair Office Automatic Updates`  
**Description:** `Checks common failure points in Office automatic updates and automatically resolves them.`  
**Category:** `Application`  

![Task Creation 3](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_5.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_6.webp)

A blank function will appear.

![Blank Function](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_7.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_8.webp)

![PowerShell Script Selection 2](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_9.webp)

The following function will pop up on the screen:

![PowerShell Function](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_10.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```PowerShell
#region Setup - Variables
$ProjectName = 'Repair-OfficeAutomaticUpdate'
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

![PowerShell Result](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_11.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 2](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_12.webp)

A blank function will appear.

![Blank Function 2](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_13.webp)

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_14.webp)

The following function will pop up on the screen:

![Script Log Function](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_15.webp)

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_16.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_17.webp)

## Completed Script

![Completed Script](../../../static/img/docs/6abb79b5-4638-4d53-b960-f11972f0f96d/image_18.webp)

## Output

- Script Log