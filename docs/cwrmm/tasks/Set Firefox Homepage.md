---
id: '708255d7-3abc-4e10-b9f5-3f943f435695'
title: 'Set Firefox Homepage'
title_meta: 'Set Firefox Homepage'
keywords: ['firefox', 'homepage', 'script', 'rmm', 'configuration']
description: 'This document provides a detailed guide on how to set a homepage in Firefox using ConnectWise RMM. It includes user parameters, task creation steps, sample runs, and the PowerShell script necessary for implementation.'
tags: ['application', 'firefox', 'setup']
draft: false
unlisted: false
---

## Summary

Applies a homepage to Firefox. CW RMM implementation of [Set-FirefoxHomepage](<../../powershell/Set-FirefoxHomepage.md>).

## Sample Run

![Sample Run 1](../../../static/img/Set-Firefox-Homepage/image_1.png)  
![Sample Run 2](../../../static/img/Set-Firefox-Homepage/image_2.png)  
![Sample Run 3](../../../static/img/Set-Firefox-Homepage/image_3.png)  

## Dependencies

[SWM - Software Configuration - Set-FirefoxHomepage](<../../powershell/Set-FirefoxHomepage.md>)  

## User Parameters

| Name                        | Example                               | Required | Type         | Description                           |
|-----------------------------|---------------------------------------|----------|--------------|---------------------------------------|
| `Homepage`                  | [https://www.provaltech.com](https://www.provaltech.com) | True     | Text String  | The URL to the desired homepage.      |
| `EnforceHomepageStartup`    | 0/1                                   | False    | Flag         | Sets the browser to display the homepage on startup. |

![User Parameters Image](../../../static/img/Set-Firefox-Homepage/image_4.png)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/Set-Firefox-Homepage/image_5.png)  
![Task Creation Image 2](../../../static/img/Set-Firefox-Homepage/image_6.png)  

**Name:** `Set Firefox Homepage`  
**Description:** `Applies a homepage to Firefox.`  
**Category:** `Application`  
![Task Creation Image 3](../../../static/img/Set-Firefox-Homepage/image_7.png)  

## Parameters

### Homepage:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](../../../static/img/Set-Firefox-Homepage/image_8.png)  

This screen will appear.  
![Parameter Image 2](../../../static/img/Set-Firefox-Homepage/image_9.png)  

- Set `Homepage` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Parameter Image 3](../../../static/img/Set-Firefox-Homepage/image_10.png)  

### EnforceHomepageStartup:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](../../../static/img/Set-Firefox-Homepage/image_8.png)  

This screen will appear.  
![Parameter Image 2](../../../static/img/Set-Firefox-Homepage/image_9.png)  

- Set `EnforceHomepageStartup` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Parameter Image 4](../../../static/img/Set-Firefox-Homepage/image_11.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/Set-Firefox-Homepage/image_12.png)  

A blank function will appear.  
![Task Image 2](../../../static/img/Set-Firefox-Homepage/image_13.png)  

### Row 1 Function: PowerShell Script
Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/Set-Firefox-Homepage/image_14.png)  
![Task Image 4](../../../static/img/Set-Firefox-Homepage/image_15.png)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/Set-Firefox-Homepage/image_16.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.  

```powershell
#region parameters
$Homepage = '@Homepage@'
$EnforceHomepageStartup = '@EnforceHomepageStartup@'
if ( $Homepage -match '/SHomePage/S' -or ($null -eq $Homepage) ) {
    throw 'Homepage is not set correctly.'
} elseif ( $Homepage.Length -lt 2 ) {
    throw 'Homepage is not set correctly.'
}
$parameters = @{
    Homepage = $Homepage
}
if ( $EnforceHomepageStartup -match '1|Yes|True' ) {
    $parameters.Add('EnforceHomepageStartup', $true)
}
#endregion

#region Setup - Variables
$ProjectName = 'Set-FirefoxHomepage'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$Workingpath = $WorkingDirectory
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

if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Task Image 6](../../../static/img/Set-Firefox-Homepage/image_17.png)  

### Row 2 Function: Script Log
Add a new row by clicking the `Add Row` button.  
![Task Image 7](../../../static/img/Set-Firefox-Homepage/image_18.png)  

A blank function will appear.  
![Task Image 8](../../../static/img/Set-Firefox-Homepage/image_19.png)  

Search and select the `Script Log` function.  
![Task Image 9](../../../static/img/Set-Firefox-Homepage/image_20.png)  

The following function will pop up on the screen:  
![Task Image 10](../../../static/img/Set-Firefox-Homepage/image_21.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Task Image 11](../../../static/img/Set-Firefox-Homepage/image_22.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 12](../../../static/img/Set-Firefox-Homepage/image_23.png)  

## Completed Script

![Completed Script](../../../static/img/Set-Firefox-Homepage/image_24.png)  

## Output

- Script Log  
![Output Log](../../../static/img/Set-Firefox-Homepage/image_25.png)  



