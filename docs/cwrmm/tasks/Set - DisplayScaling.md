---
id: '8b3db9bc-3acc-40fb-96e3-9f6c271a2591'
title: 'Set Display Scaling for Windows Machines'
title_meta: 'Set Display Scaling for Windows Machines'
keywords: ['display', 'scaling', 'windows', 'custom', 'script']
description: 'This document outlines the implementation of a script to set custom display scaling for both existing and new users on Windows machines within an RMM environment. It includes user parameters, task creation steps, and example outputs.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This is an RMM implementation of the agnostic script [Agnostic - Set-DisplayScaling](<../../unsorted/Agnostic - Set-DisplayScaling.md>) to set custom display scaling on both existing and new users for Windows machines.

## Sample Run

![Sample Run](../../../static/img/Set---DisplayScaling/image_1.png)

To set the display scale to 100%:  
![Set Display Scale](../../../static/img/Set---DisplayScaling/image_2.png)

## Dependencies

[Agnostic - Set-DisplayScaling](<../../unsorted/Agnostic - Set-DisplayScaling.md>)

## User Parameters

| Name            | Example | Required | Description                                                                                                                                                                                                                              |
|-----------------|---------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ScalePercentage  | 150     | True     | Enter one of the scaling percentages from the options below: - 100 - to maximize the window zoom to 100% - 125 - to maximize the window zoom to 125% - 150 - to maximize the window zoom to 150% - 175 - to maximize the window zoom to 175% - 200 - to maximize the window zoom to 200% |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Create Script](../../../static/img/Set---DisplayScaling/image_3.png)  
![Script Creation](../../../static/img/Set---DisplayScaling/image_4.png)

**Name:** Set - DisplayScaling  
**Description:** This task sets custom display scaling on existing and new users for Windows machines.  
**Category:** Custom  
![Category](../../../static/img/Set---DisplayScaling/image_5.png)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Set---DisplayScaling/image_6.png)  

This screen will appear.  
![Parameter Screen](../../../static/img/Set---DisplayScaling/image_7.png)

- Set `ScalePercentage` in the `Parameter Name` field.
- Toggle the Required field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/Set---DisplayScaling/image_8.png)

- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/Set---DisplayScaling/image_9.png)

Parameters will look as shown below:  
![Parameters Example](../../../static/img/Set---DisplayScaling/image_10.png)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/Set---DisplayScaling/image_11.png)

A blank function will appear.  
![Blank Function](../../../static/img/Set---DisplayScaling/image_12.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Function](../../../static/img/Set---DisplayScaling/image_13.png)

The following function will pop up on the screen:  
![Function Popup](../../../static/img/Set---DisplayScaling/image_14.png)

Paste in the following PowerShell script and set the expected time of script execution to 300 seconds. Click the `Save` button.

```
# Parameters and Globals
# Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
if ( '@ScalePercentage@' -notin ('100','125','150','175','200' ) ) {
    throw "ScalePercentage can either be '100','125','150','175','200'."
} else {
    $ScalePercentage = '@ScalePercentage'
}

$Parameters = @{
    Scale = '@ScalePercentage@'
}

#region Setup - Variables
$ProjectName = 'Set-DisplayScaling'
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

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Script Log](../../../static/img/Set---DisplayScaling/image_15.png)

## Completed Task

![Completed Task](../../../static/img/Set---DisplayScaling/image_16.png)

## Output

- Script Log

