---
id: '86ce1f15-d85b-472a-b35f-c4c357036ee2'
title: 'Remove Wifi Profile'
title_meta: 'Remove Wifi Profile'
keywords: ['wifi', 'profile', 'remove', 'script', 'connectwise', 'rmm']
description: 'This document provides a comprehensive guide on how to implement a script that removes a specified Wifi profile from a system using ConnectWise RMM. It includes dependencies, user parameters, task creation steps, and complete script details.'
tags: ['security', 'configuration', 'windows', 'networking']
draft: false
unlisted: false
---
## Summary

This script removes the specified Wifi profile from the system. A brief summary of what this script is used for and any important notes about how to run the script. CW RMM implementation of the agnostic script [Remove-WifiProfile](https://proval.itglue.com/DOC-5078775-16088533).

## Sample Run

![Sample Run 1](../../../static/img/Remove-Wifi-Profile/image_1.png)  
![Sample Run 2](../../../static/img/Remove-Wifi-Profile/image_2.png)  
![Sample Run 3](../../../static/img/Remove-Wifi-Profile/image_3.png)  

## Dependencies

[EPM - Windows Configuration - Agnostic Script - Remove-WifiProfile](https://proval.itglue.com/DOC-5078775-16088533)

## User Parameters

| Name         | Example           | Required | Type         | Description                          |
|--------------|-------------------|----------|--------------|--------------------------------------|
| ProfileName  | suspiciousProfile  | True     | Text String  | Name of the Wifi Profile to remove. |

![User Parameters](../../../static/img/Remove-Wifi-Profile/image_4.png)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Step 1](../../../static/img/Remove-Wifi-Profile/image_5.png)  
![Task Creation Step 2](../../../static/img/Remove-Wifi-Profile/image_6.png)  

**Name:** `Remove Wifi Profile`  
**Description:** `This script removes the specified Wifi profile from the system.`  
**Category:** `Security`  

![Task Creation Step 3](../../../static/img/Remove-Wifi-Profile/image_7.png)  

## Parameters

### ProfileName:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Step 1](../../../static/img/Remove-Wifi-Profile/image_8.png)  

This screen will appear.  

![Add Parameter Step 2](../../../static/img/Remove-Wifi-Profile/image_9.png)  

- Set `ProfileName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/Remove-Wifi-Profile/image_10.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Step 1](../../../static/img/Remove-Wifi-Profile/image_11.png)  

A blank function will appear.

![Add Row Step 2](../../../static/img/Remove-Wifi-Profile/image_12.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Function Step 1](../../../static/img/Remove-Wifi-Profile/image_13.png)  
![Row 1 Function Step 2](../../../static/img/Remove-Wifi-Profile/image_14.png)  

The following function will pop up on the screen:  

![Row 1 Function Step 3](../../../static/img/Remove-Wifi-Profile/image_15.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$ProfileName = '@ProfileName@'
if ( [String]::IsNullOrWhiteSpace($ProfileName) -or $Title -match '/SProfileName/S' ) {
    throw 'ProfileName is a mandatory parameter.'
}
$Parameters = @{
    ProfileName = $ProfileName
}
#endregion
#region Setup - Variables
$ProjectName = 'Remove-WifiProfile'
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
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![Row 1 Function Step 4](../../../static/img/Remove-Wifi-Profile/image_16.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Row 2 Function Step 1](../../../static/img/Remove-Wifi-Profile/image_17.png)  

A blank function will appear.

![Row 2 Function Step 2](../../../static/img/Remove-Wifi-Profile/image_18.png)  

Search and select the `Script Log` function.

![Row 2 Function Step 3](../../../static/img/Remove-Wifi-Profile/image_19.png)  

The following function will pop up on the screen:  

![Row 2 Function Step 4](../../../static/img/Remove-Wifi-Profile/image_20.png)  

In the script log message, simply type `%Output%` and click the `Save` button.

![Row 2 Function Step 5](../../../static/img/Remove-Wifi-Profile/image_21.png)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Row 2 Function Step 6](../../../static/img/Remove-Wifi-Profile/image_22.png)  

## Completed Script

![Completed Script](../../../static/img/Remove-Wifi-Profile/image_23.png)  

## Output

- Script log






