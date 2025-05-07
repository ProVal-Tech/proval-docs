---
id: 'c563d6fc-13b1-4cc5-9461-745e2a25b49d'
slug: /c563d6fc-13b1-4cc5-9461-745e2a25b49d
title: 'Remove Font'
title_meta: 'Remove Font'
keywords: ['remove', 'font', 'windows', 'script', 'uninstall']
description: 'This document provides a comprehensive guide on removing installed fonts from Windows machines using a script. It includes sample runs, user parameters, task creation steps, and detailed instructions for implementing the script in ConnectWise RMM.'
tags: ['uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This document outlines how to remove installed fonts from Windows machines. It accepts the '*' wildcard to remove multiple matching fonts. The CW RMM implementation of the agnostic script can be found in [Remove-Font](/docs/a88b469b-0384-49f8-b959-16e701c538ad  ).

## Sample Run

![Sample Run 1](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_1.webp)  
![Sample Run 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_2.webp)  
![Sample Run 3](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_3.webp)  

## Dependencies

[SWM - Software Uninstall - Agnostic - Script - Remove-Font](/docs/a88b469b-0384-49f8-b959-16e701c538ad  )

## User Parameters

| Name   | Example         | Required | Type         | Description                                         |
|--------|------------------|----------|--------------|-----------------------------------------------------|
| Title  | Malicious Font    | True     | Text String  | Title of the font to remove from the system.       |

![User Parameter Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_5.webp)  
![Task Creation Image 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_6.webp)  

**Name:** `Remove Font`  
**Description:** `Remove the installed font from the Windows machines. Accepts the '*' wildcard to remove multiple matching fonts.`  
**Category:** `Custom`  

![Task Creation Image 3](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_7.webp)

## Parameters

### Title:

Add a new parameter by clicking the `Add Parameter` button located at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_8.webp)  

This screen will appear.  

![Add Parameter Image 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_9.webp)  

- Set `Title` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_10.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_11.webp)  

A blank function will appear.

![Blank Function Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_12.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection 1](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_13.webp)  
![PowerShell Script Selection 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_14.webp)  

The following function will pop up on the screen:

![PowerShell Script Popup](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_15.webp)  

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `300`. Click the `Save` button.

```
#region parameters
$Title = '@Title@'
if ( [String]::IsNullOrWhiteSpace($Title) -or $Title -match '\\STitle\\S' ) {
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
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A security application seems to have restricted the execution of the PowerShell script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![PowerShell Script Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_16.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_17.webp)  

A blank function will appear.

![Blank Function Image 2](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_18.webp)  

Search and select the `Script Log` function.

![Script Log Selection](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_19.webp)  

The following function will pop up on the screen:

![Script Log Popup](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_20.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_21.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_22.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/c563d6fc-13b1-4cc5-9461-745e2a25b49d/image_23.webp)  

## Output

- Script log