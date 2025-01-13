---
id: 'rmm-chromium-browsers-extension-install'
title: 'Install Extensions on Popular Chromium Browsers'
title_meta: 'Install Extensions on Popular Chromium Browsers'
keywords: ['extensions', 'chromium', 'chrome', 'edge', 'brave', 'vivaldi']
description: 'This document provides a comprehensive guide on installing extensions on popular Chromium-based browsers including Chrome, Edge, Brave, Vivaldi, and Chromium. It includes user parameters, task creation steps, and sample scripts for effective implementation.'
tags: ['configuration', 'installation', 'software', 'web-browser', 'windows']
draft: false
unlisted: false
---
## Summary

Install Extensions on Popular Chromium Browsers ('Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium').

## Sample Run

![Sample Run 1](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_1.png)  
![Sample Run 2](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_2.png)  
![Sample Run 3](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_3.png)  

## Dependencies

[SWM - Software Configuration - Register-ChromiumExtension](https://proval.itglue.com/DOC-5078775-10372099)

## User Parameters

| Name        | Example                                   | Required | Description                                                                                                                                                                                                                           |
|-------------|-------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ExtensionID | nakcddgmfmjmdbfahkkiijejmmfkfipc         | True     | The ExtensionID of the Extension(s) from the Google Chrome Store. Multiple IDs can be separated by a comma. Example: `'kgjfgplpablkjnlkjmjdecgdpfankdle', 'cjpalhdlnbpafiamejdnhcphjbkeiagm'                                    |
| Target      | Chrome                                    | False    | Designates the target browser to add the extension to. Defaults to applying settings to all available targets. Available Options: `'Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium'`. Multiple IDs can be separated by a comma: `'Chrome', 'Edge', 'Brave'` |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_4.png)  
![Task Creation Image 2](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_5.png)  

**Name:** Chromium Browsers - Extension - Install  
**Description:** Install Extensions on Popular Chromium Browsers ('Chrome', 'Edge', 'Brave', 'Vivaldi', 'Chromium')  
**Category:** Application  
![Task Creation Image 3](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_6.png)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_7.png)  

This screen will appear.  
![Parameter Image 2](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_8.png)  

- Set `ExtensionID` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Image 3](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_9.png)  
- It will ask for the confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Image 4](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_10.png)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 5](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_7.png)  

This screen will appear.  
![Parameter Image 6](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_8.png)  

- Set `Target` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Parameter Image 7](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_11.png)  
- It will ask for the confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Parameter Image 8](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_10.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_12.png)  

A blank function will appear.  
![Task Image 2](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_13.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_14.png)  
![Task Image 4](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_15.png)  

The following function will pop up on the screen:  
![Task Image 5](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_16.png)  

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

![Task Image 6](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_17.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 7](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_18.png)  

## Completed Task

![Completed Task Image](..\..\..\static\img\Chromium-Browsers---Extension---Install\image_19.png)  

## Output

- Script Log



