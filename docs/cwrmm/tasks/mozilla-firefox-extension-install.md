---
id: 'd1bcd7a6-8544-4f1e-a20a-8470be76820e'
slug: /d1bcd7a6-8544-4f1e-a20a-8470be76820e
title: 'Mozilla Firefox - Extension - Install'
title_meta: 'Mozilla Firefox - Extension - Install'
keywords: ['firefox', 'extension', 'install', 'script', 'configuration']
description: 'This document provides a detailed guide on installing an extension on the Mozilla Firefox browser, including user parameters and task creation steps. It outlines dependencies, parameters required for the script, and provides a sample PowerShell script for execution.'
tags: ['application', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Installs an extension on the Mozilla Firefox Browser.

## Sample Run

![Sample Run 1](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_1.png) 
![Sample Run 2](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_2.png) 
![Sample Run 3](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_3.png)

## Dependencies

[SWM - Software Configuration - Register-FirefoxExtension](/docs/db0512b5-70cd-4145-aa69-de84f9b1846d)

## User Parameters

| Name           | Example            | Required | Description                                     |
|----------------|---------------------|----------|-------------------------------------------------|
| ExtensionName  | 'Unblock-Origin'    | True     | The name of the extension to install.           |
| Mandate        |                     | False    | Removes the user's right to remove the extension.|

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_4.png)  
![Task Creation Step 2](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_5.png)  

**Name:** Mozilla Firefox - Extension - Install  
**Description:** Installs an extension on the Mozilla Firefox Browser.  
**Category:** Application  
![Task Creation Image](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_6.png)  

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_7.png)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_8.png)  

- Set `ExtensionName` in the `Parameter Name` field.
- Enable the `Required Field` option.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_9.png)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_10.png)  

Add another parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_7.png)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_8.png)  

- Set `Mandate` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![Save Button](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_11.png)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Button](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_10.png)  

![Parameter Image](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_12.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_13.png)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_14.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Function](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_15.png) 
![PowerShell Function Selection](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_16.png)  

The following function will pop up on the screen:  
![Function Pop Up](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_17.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds. Click the `Save` button.  

```
$ExtensionName = "@ExtensionName@"
$Mandate = '@Mandate@'
$ProjectName = 'Register-FirefoxExtension'
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

![Save Script](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_18.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Button](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_19.png)  

## Completed Task

![Completed Task](../../../static/img/docs/d1bcd7a6-8544-4f1e-a20a-8470be76820e/image_20.png)  

## Output

- Script Log


