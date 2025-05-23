---
id: 'f3ecbc30-3826-4326-9a9d-4ea6411f22a9'
slug: /f3ecbc30-3826-4326-9a9d-4ea6411f22a9
title: 'Install Font'
title_meta: 'Install Font'
keywords: ['install', 'font', 'script', 'directory', 'file']
description: 'This document provides a comprehensive guide on how to install fonts from a specified directory or file using a script. It includes sample runs, user parameters, and detailed instructions for task creation and execution.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task is used to install fonts from a particular directory or file.

## Sample Run

![Sample Run 1](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_2.webp)  
![Sample Run 2](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_3.webp)  
![Sample Run 3](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_4.webp)  

## Dependencies

[Install-Font](/docs/2520190e-2751-45f1-8d60-501027004938)

## User Parameters

| Name  | Example                        | Required  | Description                                                              |
|-------|--------------------------------|-----------|--------------------------------------------------------------------------|
| Path  |   `C:/Fonts/times.ttf`         | Mandatory | This will contain the file path or a folder where multiple files are located. |

![User Parameters](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_5.webp)

**Note:** If the parameter is set to NULL, the script will throw an error.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_6.webp)  
![Task Creation 2](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_7.webp)  

**Name:** Install Font  
**Description:** This script is used to install fonts from a particular directory or file.  
**Category:** Custom  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_8.webp)  

This screen will appear.

![Parameter Screen](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_9.webp)  

- Set `Path` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_10.webp)  

Click the `Confirm` button to save the parameter.

![Confirm Parameter](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_11.webp)  

### Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_12.webp)  

A blank function will appear.

![Blank Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_13.webp)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell Script](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_14.webp)  
![PowerShell Script Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_15.webp)  

The following function will pop up on the screen:

![PowerShell Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_16.webp)  

```powershell
# # Parameters and Globals
# # Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.

$Path = '@Path@'

$Parameters = @{}

if ($Path -notmatch ":\\") {
    throw "Invalid Path."
} else {
    $Parameters["Path"] = $Path
}

#region Setup - Variables
$ProjectName = 'Install-Font'
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

![Row Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_17.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_18.webp)  

A blank function will appear.

![Blank Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_13.webp)  

Search and select the `Script Log` function.

![Select Script Log](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_19.webp)  
![Script Log Function](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_20.webp)  

The following function will pop up on the screen:

![Script Log Pop Up](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_21.webp)  

In the script log message, simply type `%output%` and click the `Save` button.

![Save Script Log](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_22.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_23.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/c16a83d6-7845-4478-9b25-c4947aac8f5d/image_24.webp)  

## Output

- Script log