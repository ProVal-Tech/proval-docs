---
id: 'e90f2a06-b9f8-4a59-bb22-5a2f1102f51f'
slug: /e90f2a06-b9f8-4a59-bb22-5a2f1102f51f
title: 'Install Perch Log Shipper'
title_meta: 'Install Perch Log Shipper'
keywords: ['perch', 'log', 'shipper', 'windows', 'install']
description: 'This document provides a comprehensive guide on deploying Perch Log Shipper on Windows machines, including sample runs, user parameters, task creation steps, and script details.'
tags: ['installation', 'logging', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This task deploys Perch Log Shipper on Windows machines.

## Sample Run

![Sample Run 1](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_6.webp)  
![Sample Run 2](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_7.webp)  
![Sample Run 3](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_8.webp)  

## Dependencies

[SWM - Software Install - Agnostic - Install - PerchLogShipper](/docs/41fd7a2b-4604-4ef1-bd74-c7a4325da37e)

## User Parameters

| Name  | Example              | Required  | Description                       |
|-------|----------------------|-----------|-----------------------------------|
| Token | hwu76-whduh-hhjdhj   | Mandatory | Populate it with an installation code. |

![User Parameters Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_9.webp)

**Note:** 
- If no parameters are set, the script will throw an error: "Invalid Token does not contain a value."

## Task Creation

Install PerchLogShipper. Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_10.webp)  
![Task Creation Image 2](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_11.webp)

**Name:** Install PerchLogShipper  
**Description:** This task deploys Perch Log Shipper on Windows machines.  
**Category:** Custom  

![Task Creation Image 3](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_12.webp)  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_13.webp)  

This screen will appear.  

![Parameter Screen Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_14.webp)  

- Set `Token` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_15.webp)  

Click the `Confirm` button to save the parameter.

![Confirm Parameter Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_16.webp)  

### Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_17.webp)  

A blank function will appear.

![Blank Function Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_18.webp)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Script Selection Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_19.webp)  
![PowerShell Script Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_20.webp)  

The following function will pop up on the screen:  

![PowerShell Function Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_21.webp)  

```powershell
# Parameters and Globals
# Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
$Token = '@Token@'
$Parameters = @{}
if ($Token.Length -gt 5) {
    $Parameters["Token"] = $Token
} else {
    throw "Invalid Token does not contain a value."
}

#region Setup - Variables
$ProjectName = 'Install-PerchLogShipper'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\\ProgramData\\_automation\\script\\$ProjectName"
$PS1Path = "$WorkingDirectory\\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory\\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\\$ProjectName-Error.txt"
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

![Row 1 Function Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_22.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_23.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_18.webp)  

Search and select the `Script Log` function.  
![Script Log Selection Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_24.webp)  
![Script Log Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_25.webp)  

The following function will pop up on the screen:  
![Script Log Function Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_26.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Save Script Log Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_27.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_28.webp)  

### Completed Task

![Completed Task Image](../../../static/img/docs/4a21e214-958c-4b97-9194-2fa517342001/image_29.webp)  

## Output

- Script log