---
id: 'rmm-install-font'
title: 'Install Font'
title_meta: 'Install Font - A Guide to Installing Fonts via Script'
keywords: ['install', 'font', 'script', 'directory', 'file']
description: 'This document provides a comprehensive guide on how to install fonts from a specified directory or file using a script. It includes sample runs, user parameters, and detailed instructions for task creation and execution.'
tags: ['setup', 'software', 'windows', 'configuration']
draft: false
unlisted: false
---
## Summary

This Task is used to install the fonts from a particular directory or file.

## Sample Run

![Sample Run 1](..\..\..\static\img\Install-Font\image_2.png)  
![Sample Run 2](..\..\..\static\img\Install-Font\image_3.png)  
![Sample Run 3](..\..\..\static\img\Install-Font\image_4.png)  

## Dependencies

[SWM - Software Install - Agnostic - Script - Install-Font](https://proval.itglue.com/DOC-5078775-10371922)

## User Parameters

| Name  | Example                        | Required  | Description                                                              |
|-------|--------------------------------|-----------|--------------------------------------------------------------------------|
| Path  | - C:\Fonts\times.ttf          | Mandatory | This will contain the file path or a folder where multiple files are located. <br> - C:\Fonts |

![User Parameters](..\..\..\static\img\Install-Font\image_5.png)

**Note:**  
- If parameter is set to NULL, the script will throw an error.

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation 1](..\..\..\static\img\Install-Font\image_6.png)  
![Task Creation 2](..\..\..\static\img\Install-Font\image_7.png)  

**Name:** Install Font  
**Description:** This script is used to install the fonts from a particular directory or file.  
**Category:** Custom  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](..\..\..\static\img\Install-Font\image_8.png)  

This screen will appear.

![Parameter Screen](..\..\..\static\img\Install-Font\image_9.png)  

- Set `Path` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter](..\..\..\static\img\Install-Font\image_10.png)  

Click the `Confirm` button to save the parameter.

![Confirm Parameter](..\..\..\static\img\Install-Font\image_11.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row](..\..\..\static\img\Install-Font\image_12.png)  

A blank function will appear.

![Blank Function](..\..\..\static\img\Install-Font\image_13.png)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Select PowerShell Script](..\..\..\static\img\Install-Font\image_14.png)  
![PowerShell Script Function](..\..\..\static\img\Install-Font\image_15.png)  

The following function will pop up on the screen:

![PowerShell Function](..\..\..\static\img\Install-Font\image_16.png)  

```powershell
# Parameters and Globals
# Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
$Path = '@Path@'
$Parameters = @{}

if ($Path -notmatch ":\") {
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
```

```powershell
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Row Function](..\..\..\static\img\Install-Font\image_17.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row](..\..\..\static\img\Install-Font\image_18.png)  

A blank function will appear.

![Blank Function](..\..\..\static\img\Install-Font\image_13.png)  

Search and select the `Script Log` function.

![Select Script Log](..\..\..\static\img\Install-Font\image_19.png)  

![Script Log Function](..\..\..\static\img\Install-Font\image_20.png)  

The following function will pop up on the screen:

![Script Log Pop Up](..\..\..\static\img\Install-Font\image_21.png)  

In the script log message, simply type `%output%` and click the `Save` button.

![Save Script Log](..\..\..\static\img\Install-Font\image_22.png)  

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script](..\..\..\static\img\Install-Font\image_23.png)  

## Completed Task

![Completed Task](..\..\..\static\img\Install-Font\image_24.png)  

## Output

- Script log



