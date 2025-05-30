---
id: '36fa496a-be60-416f-87a6-f725a1241540'
slug: /36fa496a-be60-416f-87a6-f725a1241540
title: 'Chromium Browsers - Extension - Install'
title_meta: 'Chromium Browsers - Extension - Install'
keywords: ['extensions', 'chromium', 'chrome', 'edge', 'brave', 'vivaldi']
description: 'This document provides a comprehensive guide on installing extensions on popular Chromium-based browsers including Chrome, Edge, Brave, Vivaldi, and Chromium. It includes user parameters, task creation steps, and sample scripts for effective implementation.'
tags: ['installation', 'software', 'web-browser', 'windows']
draft: false
unlisted: false
---

## Summary

Install Extensions on Popular Chromium Browsers ('Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium').

## Sample Run

![Sample Run 1](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_1.webp)  
![Sample Run 2](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_2.webp)  
![Sample Run 3](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_3.webp)  

## Dependencies

[Register-ChromiumExtension](/docs/481992c0-adcd-4275-bd5c-aa59fd4a7b17)

## User Parameters

| Name        | Example                                   | Required | Description                                                                                                                                                                                                                           |
|-------------|-------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ExtensionID | nakcddgmfmjmdbfahkkiijejmmfkfipc         | True     | The ExtensionID of the Extension(s) from the Google Chrome Store. Multiple IDs can be separated by a comma. Example: `'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'                                    |
| Target      | Chrome                                    | False    | Designates the target browser to add the extension to. Defaults to applying settings to all available targets. Available Options: `'Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium'`. Multiple IDs can be separated by a comma: `'Chrome', 'Edge', 'Brave'` |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_4.webp)  
![Task Creation Image 2](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_5.webp)  

**Name:** Chromium Browsers - Extension - Install  
**Description:** Install Extensions on Popular Chromium Browsers ('Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium')  
**Category:** Application  
![Task Creation Image 3](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_6.webp)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_7.webp)  

This screen will appear.  
![Parameter Image 2](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_8.webp)  

- Set `ExtensionID` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Image 3](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_9.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Image 4](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_10.webp)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 5](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_7.webp)  

This screen will appear.  
![Parameter Image 6](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_8.webp)  

- Set `Target` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Image 7](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_11.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Image 8](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_10.webp)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_12.webp)  

A blank function will appear.  
![Task Image 2](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_13.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_14.webp)  
![Task Image 4](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_15.webp)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_16.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.  

```powershell
$ExtensionID = "@ExtensionID@"
$Target = "@Target@"
$ProjectName = 'Register-ChromiumExtension'
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

![Task Image 6](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_17.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 7](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_18.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/36fa496a-be60-416f-87a6-f725a1241540/image_19.webp)  

## Output

- Script Log