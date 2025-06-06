---
id: 'ac3caa49-5cb4-464b-be99-73433d16ba81'
slug: /ac3caa49-5cb4-464b-be99-73433d16ba81
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

![Sample Run 1](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_1.webp)  
![Sample Run 2](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_2.webp)  
![Sample Run 3](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_3.webp)  

## Dependencies

[Unregister-FirefoxExtension](/docs/e9295813-fbf2-43fe-b6a0-20da0ae7b21d)

## User Parameters

| Name          | Example            | Required | Description                                                            |
|---------------|--------------------|----------|------------------------------------------------------------------------|
| ExtensionName | 'Unblock-Origin'    | True     | The name of the extension to remove.                                   |
| Mandate       |                    | False    | Use this switch to prevent future installation of the target addon in Firefox. |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation 1](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_4.webp)  
![Task Creation 2](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_5.webp)  

**Name:** Mozilla Firefox - Extension - Remove  
**Description:** Removes an extension from the Mozilla Firefox browser.  
**Category:** Application  
![Task Creation 3](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_6.webp)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_7.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_8.webp)  

- Set `ExtensionName` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_9.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_10.webp)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Again](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_7.webp)  

This screen will appear.  
![Parameter Screen Again](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_8.webp)  

- Set `Mandate` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button Again](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_11.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button Again](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_10.webp)  
![Final Parameter Screen](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_12.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_14.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection 1](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_15.webp)  
![PowerShell Script Selection 2](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_16.webp)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_17.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.  

```Powershell
$ExtensionName = "@ExtensionName@"
$Mandate = '@Mandate@'
$ProjectName = 'Unregister-FirefoxExtension'
$WorkingDirectory = "C:\ProgramData\_Automation\Script\$ProjectName"
$ScriptPath = "$WorkingDirectory\$ProjectName.ps1"
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/Script/$ProjectName.ps1"
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Remove-Item $WorkingDirectory -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
Mkdir $WorkingDirectory 3>&1 2>&1 1>$Null
try {(New-Object System.Net.WebClient).DownloadFile($PS1URL, $ScriptPath)} catch {throw 'Script Download Failure'}
if ( $Mandate -match '1|True|Yes' ) {
  & $ScriptPath -ExtensionName $ExtensionName -Mandate
} else {
  & $ScriptPath -ExtensionName $ExtensionName
}
if ( !(Test-Path $LogPath) ) {
  Throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
  $ErrorContent = ( Get-Content -Path $ErrorLogPath )
  throw $ErrorContent
}
Get-Content -Path $LogPath

```

![PowerShell Script Save](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_18.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Final Save](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_19.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/ac3caa49-5cb4-464b-be99-73433d16ba81/image_20.webp)  

## Output

- Script Log