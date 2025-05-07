---
id: 'ee16e74b-f20e-4917-b025-b565c6556807'
slug: /ee16e74b-f20e-4917-b025-b565c6556807
title: 'Repair Print Spooler'
title_meta: 'Repair Print Spooler'
keywords: ['print', 'spooler', 'service', 'reset', 'troubleshoot']
description: 'This document provides a detailed guide on using a script to reset the Print Spooler service, check and start necessary dependencies, and log the service status before and after repair. It is aimed at troubleshooting and resolving common issues with the Print Spooler service in a ConnectWise RMM environment.'
tags: ['logging']
draft: false
unlisted: false
---

## Summary

This script resets the Print Spooler service, checks and starts necessary dependencies, and logs the service status before and after repair. Use this script to troubleshoot and repair common issues with the Print Spooler service. CW RMM implementation of the agnostic script [Repair-PrintSpooler](https://file.provaltech.com/repo/script/Repair-PrintSpooler.ps1).

## Sample Run

![Sample Run 1](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_1.png)  
![Sample Run 2](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_2.png)  
![Sample Run 3](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_3.png)

## Dependencies

[Repair-PrintSpooler.ps1](https://file.provaltech.com/repo/script/Repair-PrintSpooler.ps1)

## User Parameters

| Name       | Example | Required | Type | Description                                   |
|------------|---------|----------|------|-----------------------------------------------|
| ClearQueue | 0/1     | False    | Flag | Optional flag to clear the print queue.      |

![User Parameters Image](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_5.png)  
![Task Creation 2](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_6.png)

**Name:** `Repair Print Spooler`  
**Description:** `This script resets the Print Spooler service, checks and starts necessary dependencies, and logs the service status before and after repair.`  
**Category:** `Custom`  

![Task Creation 3](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_7.png)

## Parameters

### ClearQueue:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_8.png)

This screen will appear.  
![Parameter Screen](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_9.png)

- Set `ClearQueue` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Settings](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_10.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_11.png)

A blank function will appear.  
![Blank Function](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_12.png)

### Row 1 Function: PowerShell Script
Search and select the `PowerShell Script` function.

![PowerShell Selection 1](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_13.png)  
![PowerShell Selection 2](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_14.png)

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_15.png)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$ClearQueue = '@ClearQueue@'
if ( $ClearQueue -match '1|Yes|True' ) {
    $Parameters = @{
        ClearQueue = $true
    }
}
#endregion
#region Setup - Variables
$ProjectName = 'Repair-PrintSpooler'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
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
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![PowerShell Execution](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_16.png)

### Row 2 Function: Script Log
Add a new row by clicking the `Add Row` button.  
![Add Row 2](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_17.png)

A blank function will appear.  
![Blank Function 2](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_18.png)

Search and select the `Script Log` function.  
![Script Log Selection](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_19.png)

The following function will pop up on the screen:  
![Script Log Function](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_20.png)

In the script log message, simply type `%Output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_21.png)

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_22.png)

## Completed Script

![Completed Script](../../../static/img/docs/ee16e74b-f20e-4917-b025-b565c6556807/image_23.png)

## Output

- Script log

