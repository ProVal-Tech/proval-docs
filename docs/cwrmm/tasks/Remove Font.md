---
id: 'c563d6fc-13b1-4cc5-9461-745e2a25b49d'
title: 'Remove Font from Windows Machines'
title_meta: 'Remove Font from Windows Machines'
keywords: ['remove', 'font', 'windows', 'script', 'uninstall']
description: 'This document provides a comprehensive guide on removing installed fonts from Windows machines using a script. It includes sample runs, user parameters, task creation steps, and detailed instructions for implementing the script in ConnectWise RMM.'
tags: ['uninstallation', 'windows']
draft: false
unlisted: false
---
## Summary

Remove the installed font from the Windows machines. Accepts the '*' wildcard to remove multiple matching fonts. CW RMM implementation of the agnostic script [Remove-Font](<../../powershell/Remove-Font.md>).

## Sample Run

![Sample Run 1](../../../static/img/Remove-Font/image_1.png)  
![Sample Run 2](../../../static/img/Remove-Font/image_2.png)  
![Sample Run 3](../../../static/img/Remove-Font/image_3.png)  

## Dependencies

[SWM - Software Uninstall - Agnostic - Script - Remove-Font](<../../powershell/Remove-Font.md>)

## User Parameters

| Name   | Example         | Required | Type         | Description                                         |
|--------|------------------|----------|--------------|-----------------------------------------------------|
| Title  | Malicious Font    | True     | Text String  | Title to the font to remove from the system.       |

![User Parameter Image](../../../static/img/Remove-Font/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](../../../static/img/Remove-Font/image_5.png)  
![Task Creation Image 2](../../../static/img/Remove-Font/image_6.png)  

**Name:** `Remove Font`  
**Description:** `Remove the installed font from the Windows machines. Accepts the '*' wildcard to remove multiple matching fonts.`  
**Category:** `Custom`  

![Task Creation Image 3](../../../static/img/Remove-Font/image_7.png)

## Parameters

### Title:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/Remove-Font/image_8.png)  

This screen will appear.  

![Add Parameter Image 2](../../../static/img/Remove-Font/image_9.png)  

- Set `Title` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](../../../static/img/Remove-Font/image_10.png)

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/Remove-Font/image_11.png)  

A blank function will appear.

![Blank Function Image](../../../static/img/Remove-Font/image_12.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/Remove-Font/image_13.png)  
![PowerShell Script Selection 2](../../../static/img/Remove-Font/image_14.png)  

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/Remove-Font/image_15.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Title = '@Title@'
if ( [String]::IsNullOrWhiteSpace($Title) -or $Title -match '//STitle//S' ) {
    throw 'Title is a mandatory parameter.'
}
$Parameters = @{
    Title = $Title
}
#endregion
#region Setup - Variables
$ProjectName = 'Remove-Font'
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

![PowerShell Script Image](../../../static/img/Remove-Font/image_16.png)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image 2](../../../static/img/Remove-Font/image_17.png)  

A blank function will appear.

![Blank Function Image 2](../../../static/img/Remove-Font/image_18.png)  

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/Remove-Font/image_19.png)  

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/Remove-Font/image_20.png)  

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/Remove-Font/image_21.png)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script Image](../../../static/img/Remove-Font/image_22.png)  

## Completed Task

![Completed Task Image](../../../static/img/Remove-Font/image_23.png)  

## Output

- Script log












