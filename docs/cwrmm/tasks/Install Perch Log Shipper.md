---
id: 'rmm-install-perchlogshipper'
title: 'Install Perch Log Shipper'
title_meta: 'Install Perch Log Shipper on Windows Machines'
keywords: ['perch', 'log', 'shipper', 'windows', 'install']
description: 'This document provides a comprehensive guide on deploying Perch Log Shipper on Windows machines, including sample runs, user parameters, task creation steps, and script details.'
tags: ['installation', 'windows', 'software', 'script', 'logging']
draft: false
unlisted: false
---
## Summary

This Task deploys Perch Log Shipper on Windows machines.

## Sample Run

![Sample Run 1](..\..\..\static\img\Install-Perch-Log-Shipper\image_6.png)  
![Sample Run 2](..\..\..\static\img\Install-Perch-Log-Shipper\image_7.png)  
![Sample Run 3](..\..\..\static\img\Install-Perch-Log-Shipper\image_8.png)  

## Dependencies

[SWM - Software Install - Agnostic - Install - PerchLogShipper](https://proval.itglue.com/DOC-5078775-14959900)

## User Parameters

| Name  | Example              | Required  | Description                       |
|-------|----------------------|-----------|-----------------------------------|
| Token | hwu76-whduh-hhjdhj   | Mandatory | Populate it with an installation code. |

![User Parameters Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_9.png)

**Note:** 
- If no parameters are set, the script will throw an error "Invalid Token does not contain a value."

## Task Creation

Install PerchLogShipper. Create a new `Script Editor` style script in the system to implement this Task.

![Task Creation Image 1](..\..\..\static\img\Install-Perch-Log-Shipper\image_10.png)  
![Task Creation Image 2](..\..\..\static\img\Install-Perch-Log-Shipper\image_11.png)

**Name:** Install PerchLogShipper  
**Description:** This Task deploys Perch Log Shipper on Windows machines.  
**Category:** Custom  

![Task Creation Image 3](..\..\..\static\img\Install-Perch-Log-Shipper\image_12.png)  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_13.png)  

This screen will appear.  

![Parameter Screen Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_14.png)  

- Set `Token` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Save Parameter Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_15.png)  

Click the `Confirm` button to save the parameter.

![Confirm Parameter Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_16.png)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_17.png)  

A blank function will appear.

![Blank Function Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_18.png)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Script Selection Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_19.png)  
![PowerShell Script Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_20.png)  

The following function will pop up on the screen:  

![PowerShell Function Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_21.png)  

```powershell
# # Parameters and Globals
# # Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
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
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
```

![Row 1 Function Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_22.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_23.png)  

A blank function will appear.  
![Blank Function Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_18.png)  

Search and select the `Script Log` function.  
![Script Log Selection Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_24.png)  
![Script Log Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_25.png)  

The following function will pop up on the screen:  
![Script Log Function Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_26.png)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Save Script Log Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_27.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_28.png)  

### Completed Task

![Completed Task Image](..\..\..\static\img\Install-Perch-Log-Shipper\image_29.png)  

## Output

- Script log



