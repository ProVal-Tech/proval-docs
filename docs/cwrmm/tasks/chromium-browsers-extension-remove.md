---
id: '3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6'
slug: /3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6
title: 'Chromium Browsers - Extension - Remove'
title_meta: 'Chromium Browsers - Extension - Remove'
keywords: ['chromium', 'extensions', 'remove', 'chrome', 'edge', 'brave', 'vivaldi']
description: 'This document provides a detailed guide on how to remove extensions from popular Chromium-based browsers including Chrome, Edge, Brave, Vivaldi, and Chromium. It includes user parameters, task creation steps, and a sample PowerShell script for automation.'
tags: ['security', 'software', 'web-browser', 'windows']
draft: false
unlisted: false
---

## Summary

Remove extensions from popular Chromium browsers (Chrome, Edge, Brave, Vivaldi, and Chromium).

## Sample Run

![Sample Run 1](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_1.webp)  
![Sample Run 2](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_2.webp)  
![Sample Run 3](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_3.webp)  

## Dependencies

[Unregister-ChromiumExtension](/docs/6910db0c-af2e-4b19-a262-3c3491f01b73)

## User Parameters

| Name        | Example                                   | Required | Description                                                                                                                                                                                                                      |
|-------------|-------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ExtensionID | nakcddgmfmjmdbfahkkiijejmmfkfipc         | True     | The ExtensionID of the extension(s) from the Google Chrome Store. Multiple IDs can be separated by a comma. Example: `'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'                                 |
| Target      | Chrome                                    | False    | Designates the target browser to remove the extension from. Defaults to applying settings to all available targets. Available options: `'Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium'`. Multiple IDs can be separated by a comma: `'Chrome', 'Edge', 'Brave'` |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation 1](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_4.webp)  
![Task Creation 2](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_5.webp)  

**Name:** Chromium Browsers - Extension - Remove  
**Description:** Removes extensions from popular Chromium browsers (Chrome, Edge, Brave, Vivaldi, and Chromium)  
**Category:** Application  
![Task Creation 3](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_6.webp)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Addition 1](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_7.webp)  

This screen will appear.  
![Parameter Addition 2](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_8.webp)  

- Set `ExtensionID` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Addition 3](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_9.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Addition 4](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_10.webp)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Addition 1](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_7.webp)  

This screen will appear.  
![Parameter Addition 2](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_8.webp)  

- Set `Target` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Addition 5](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_11.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Addition 4](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_10.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Row Addition](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_12.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_13.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection 1](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_14.webp)  
![PowerShell Script Selection 2](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_15.webp)  

The following function will pop up on the screen:  
![PowerShell Script Function](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_16.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.

```powershell
$ExtensionID = "@ExtensionID@"
$Target = "@Target@"
$ProjectName = 'Unregister-ChromiumExtension'
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
if ( $Target -match '^(Chromium|Chrome|Edge|Brave|Vivaldi)$' ) {
  & $ScriptPath -ExtensionID $ExtensionID -Target $Target
} else {
  & $ScriptPath -ExtensionID $ExtensionID
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

![PowerShell Script Save](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_17.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![PowerShell Script Save Confirmation](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_18.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/3fe05c7c-eb5a-4125-ae8e-a86bd30d03b6/image_19.webp)  

## Output

- Script Log