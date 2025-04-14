---
id: '3d2491ec-2965-4101-8e89-5a51e3fba641'
slug: /3d2491ec-2965-4101-8e89-5a51e3fba641
title: 'Remove Path Variable'
title_meta: 'Remove Path Variable'
keywords: ['environment', 'path', 'variable', 'remove', 'script', 'machine']
description: 'This document provides a detailed guide on how to remove specified paths from the Environmental Path variable at the Machine scope using a ConnectWise RMM implementation of the agnostic script Remove-PathVariable.'
tags: ['setup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to remove the provided path(s) from the Environmental Path variable for a Path at the Machine scope. It covers the ConnectWise RMM implementation of the agnostic script [Remove-PathVariable](/docs/5eccc080-da21-4b13-b21d-df5c985a056a).

## Sample Run

![Sample Run 1](../../../static/img/Remove-Path-Variable/image_1.png)  
![Sample Run 2](../../../static/img/Remove-Path-Variable/image_2.png)  
![Sample Run 3](../../../static/img/Remove-Path-Variable/image_3.png)  

## Dependencies

[EPM - Windows Configuration - Agnostic - Remove-PathVariable](/docs/5eccc080-da21-4b13-b21d-df5c985a056a)

## User Parameters

| Name  | Example                                                                 | Required | Type        | Description                                                                                                      |
|-------|-------------------------------------------------------------------------|----------|-------------|------------------------------------------------------------------------------------------------------------------|
| Path  | - 'C://Temp' - 'C://Temp', 'C://Temp//ProgramData', 'D://Text Files' | True     | Text String | Comma-separated list of the path(s) to remove from the path variable. **Requirement:** Each path should be enclosed in single quotes. The path should exist on the end machine. |

![User Parameters Image](../../../static/img/Remove-Path-Variable/image_4.png)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/Remove-Path-Variable/image_5.png)  
![Task Creation Image 2](../../../static/img/Remove-Path-Variable/image_6.png)  

**Name:** `Remove Path Variable`  
**Description:** `Removes the provided path(s) from the Environmental Path variable for a Path at the Machine scope.`  
**Category:** `Custom`  

![Task Creation Image 3](../../../static/img/Remove-Path-Variable/image_7.png)  

## Parameters

### Path:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image](../../../static/img/Remove-Path-Variable/image_8.png)  

This screen will appear.  
![Parameter Screen Image](../../../static/img/Remove-Path-Variable/image_9.png)  

- Set `Path` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Parameter Setup Image](../../../static/img/Remove-Path-Variable/image_10.png)  

## Task Creation

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/Remove-Path-Variable/image_11.png)  

A blank function will appear.  
![Blank Function Image](../../../static/img/Remove-Path-Variable/image_12.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Function Image 1](../../../static/img/Remove-Path-Variable/image_13.png)  
![PowerShell Function Image 2](../../../static/img/Remove-Path-Variable/image_14.png)  

The following function will pop up on the screen:  
![PowerShell Function Image 3](../../../static/img/Remove-Path-Variable/image_15.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```
#region parameters
$Path = "@Path@"
if ($Path -match ':\\') {
    $Path = $($Path -split ',').Trim()
} else {
    throw 'Invalid path.'
}
$Parameters = @{
    Path = $Path
}
#endregion
#region Setup - Variables
$ProjectName = 'Remove-PathVariable'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:/ProgramData/_automation/script/$ProjectName"
$PS1Path = "$WorkingDirectory/$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
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
#region log verification
if (!(Test-Path $LogPath)) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if (Test-Path $ErrorLogPath) {
    $ErrorContent = (Get-Content -Path $ErrorLogPath)
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![Row 1 Function Image](../../../static/img/Remove-Path-Variable/image_16.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Image 2](../../../static/img/Remove-Path-Variable/image_17.png)  

A blank function will appear.  
![Blank Function Image 2](../../../static/img/Remove-Path-Variable/image_18.png)  

Search and select the `Script Log` function.  
![Script Log Function Image](../../../static/img/Remove-Path-Variable/image_19.png)  

The following function will pop up on the screen:  
![Script Log Function Image 2](../../../static/img/Remove-Path-Variable/image_20.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Save Script Log Image](../../../static/img/Remove-Path-Variable/image_21.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/Remove-Path-Variable/image_22.png)  

## Completed Task

![Completed Task Image](../../../static/img/Remove-Path-Variable/image_23.png)  

## Output

- Script log

