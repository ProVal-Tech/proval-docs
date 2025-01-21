---
id: 'ac3caa49-5cb4-464b-be99-73433d16ba81'
title: 'Mozilla Firefox - Extension - Remove'
title_meta: 'Mozilla Firefox - Extension - Remove'
keywords: ['firefox', 'extension', 'remove', 'uninstall', 'script', 'configuration']
description: 'This document provides a detailed guide on how to remove an extension from the Mozilla Firefox browser, including sample runs, user parameters, task creation steps, and a PowerShell script for automation.'
tags: ['application', 'firefox', 'software', 'uninstallation']
draft: false
unlisted: false
---

## Summary

This document describes how to remove an extension from the Mozilla Firefox browser.

## Sample Run

![Sample Run 1](../../../static/img/Mozilla-Firefox---Extension---Remove/image_1.png)  
![Sample Run 2](../../../static/img/Mozilla-Firefox---Extension---Remove/image_2.png)  
![Sample Run 3](../../../static/img/Mozilla-Firefox---Extension---Remove/image_3.png)  

## Dependencies

[SWM - Software Configuration - Unregister-FirefoxExtension](<../../powershell/Unregister-FirefoxExtension.md>)

## User Parameters

| Name          | Example            | Required | Description                                                            |
|---------------|--------------------|----------|------------------------------------------------------------------------|
| ExtensionName | 'Unblock-Origin'    | True     | The name of the extension to remove.                                   |
| Mandate       |                    | False    | Use this switch to prevent future installation of the target addon in Firefox. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation 1](../../../static/img/Mozilla-Firefox---Extension---Remove/image_4.png)  
![Task Creation 2](../../../static/img/Mozilla-Firefox---Extension---Remove/image_5.png)  

**Name:** Mozilla Firefox - Extension - Remove  
**Description:** Removes an extension from the Mozilla Firefox browser.  
**Category:** Application  
![Task Creation 3](../../../static/img/Mozilla-Firefox---Extension---Remove/image_6.png)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/Mozilla-Firefox---Extension---Remove/image_7.png)  

This screen will appear.  
![Parameter Screen](../../../static/img/Mozilla-Firefox---Extension---Remove/image_8.png)  

- Set `ExtensionName` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/Mozilla-Firefox---Extension---Remove/image_9.png)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/Mozilla-Firefox---Extension---Remove/image_10.png)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Again](../../../static/img/Mozilla-Firefox---Extension---Remove/image_7.png)  

This screen will appear.  
![Parameter Screen Again](../../../static/img/Mozilla-Firefox---Extension---Remove/image_8.png)  

- Set `Mandate` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button Again](../../../static/img/Mozilla-Firefox---Extension---Remove/image_11.png)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button Again](../../../static/img/Mozilla-Firefox---Extension---Remove/image_10.png)  
![Final Parameter Screen](../../../static/img/Mozilla-Firefox---Extension---Remove/image_12.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/Mozilla-Firefox---Extension---Remove/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/Mozilla-Firefox---Extension---Remove/image_14.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection 1](../../../static/img/Mozilla-Firefox---Extension---Remove/image_15.png)  
![PowerShell Script Selection 2](../../../static/img/Mozilla-Firefox---Extension---Remove/image_16.png)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/Mozilla-Firefox---Extension---Remove/image_17.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.  

```
$ExtensionName = "@ExtensionName@"
$Mandate = '@Mandate@'
$ProjectName = 'Unregister-FirefoxExtension'
$WorkingDirectory = "C:/ProgramData/_Automation/Script/$ProjectName"
$ScriptPath = "$WorkingDirectory/$ProjectName.ps1"
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/Script/$ProjectName.ps1"
$LogPath = "$WorkingDirectory/$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory/$ProjectName-Error.txt"

[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Remove-Item $WorkingDirectory -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
Mkdir $WorkingDirectory 3>&1 2>&1 1>$Null
try {(New-Object System.Net.WebClient).DownloadFile($PS1URL, $ScriptPath)} catch {throw 'Script Download Failure'}

if ($Mandate -match '1|True|Yes') {
    & $ScriptPath -ExtensionName $ExtensionName -Mandate
} else {
    & $ScriptPath -ExtensionName $ExtensionName
}

if (!(Test-Path $LogPath)) {
    Throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}

if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}

Get-Content -Path $LogPath
```

![PowerShell Script Save](../../../static/img/Mozilla-Firefox---Extension---Remove/image_18.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Final Save](../../../static/img/Mozilla-Firefox---Extension---Remove/image_19.png)  

## Completed Task

![Completed Task](../../../static/img/Mozilla-Firefox---Extension---Remove/image_20.png)  

## Output

- Script Log



