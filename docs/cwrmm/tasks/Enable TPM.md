---
id: '9cecaa1e-c694-4442-a6a5-948217978e50'
title: 'Enable TPM'
title_meta: 'Enable TPM - Trusted Platform Module Provisioning'
keywords: ['tpm', 'provisioning', 'trusted', 'platform', 'module', 'security']
description: 'This document details the process of initializing TPM as part of the provisioning process for a Trusted Platform Module (TPM). It includes user parameters, task creation steps, and sample runs for successful implementation within ConnectWise RMM.'
tags: ['security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document initializes TPM as part of the provisioning process for a Trusted Platform Module (TPM). Provisioning is the process of preparing a TPM for use. This guide covers the CW RMM implementation of [Enable TPM](<../../cwa/scripts/Bitlocker - Enable TPM.md>).

## Sample Run

![Sample Run Image 1](../../../static/img/Enable-TPM/image_1.png)  
![Sample Run Image 2](../../../static/img/Enable-TPM/image_2.png)  
![Sample Run Image 3](../../../static/img/Enable-TPM/image_3.png)  

## Dependencies

[SEC - Encryption - Script - Bitlocker - Enable TPM](<../../cwa/scripts/Bitlocker - Enable TPM.md>)

## User Parameters

| Name                      | Example | Required | Type | Description |
|---------------------------|---------|----------|------|-------------|
| `AllowClear`              | 0/1     | False    | Flag | Indicates that the provisioning process clears the TPM, if necessary, to move the TPM closer to complying with the latest Windows standards. |
| `AllowPhysicalPresence`   | 0/1     | False    | Flag | Indicates that the provisioning process may send physical presence commands that require a user to be present in order to continue. |
| `AllowRestart`            | 0/1     | False    | Flag | Allows the script to automatically restart or shut down the machine. This can happen during the initialization of TPM. |

![User Parameters Image](../../../static/img/Enable-TPM/image_4.png)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/Enable-TPM/image_5.png)  
![Task Creation Image 2](../../../static/img/Enable-TPM/image_6.png)  

**Name:** `Enable TPM`  
**Description:** `Initializes TPM as part of the provisioning process for a Trusted Platform Module (TPM). Provisioning is the process of preparing a TPM for use.`  
**Category:** `Setup`  
![Task Creation Image 3](../../../static/img/Enable-TPM/image_7.png)  

## Parameters

### AllowClear:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![AllowClear Image 1](../../../static/img/Enable-TPM/image_8.png)  

This screen will appear.  
![AllowClear Image 2](../../../static/img/Enable-TPM/image_9.png)  

- Set `AllowClear` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![AllowClear Image 3](../../../static/img/Enable-TPM/image_10.png)  

### AllowPhysicalPresence:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![AllowPhysicalPresence Image 1](../../../static/img/Enable-TPM/image_8.png)  

This screen will appear.  
![AllowPhysicalPresence Image 2](../../../static/img/Enable-TPM/image_9.png)  

- Set `AllowPhysicalPresence` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![AllowPhysicalPresence Image 3](../../../static/img/Enable-TPM/image_11.png)  

### AllowRestart:

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![AllowRestart Image 1](../../../static/img/Enable-TPM/image_8.png)  

This screen will appear.  
![AllowRestart Image 2](../../../static/img/Enable-TPM/image_9.png)  

- Set `AllowRestart` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  
![AllowRestart Image 3](../../../static/img/Enable-TPM/image_12.png)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/Enable-TPM/image_13.png)  

A blank function will appear.  
![Task Image 2](../../../static/img/Enable-TPM/image_14.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Row 1 Function Image 1](../../../static/img/Enable-TPM/image_15.png)  
![Row 1 Function Image 2](../../../static/img/Enable-TPM/image_16.png)  

The following function will pop up on the screen:  
![Row 1 Function Image 3](../../../static/img/Enable-TPM/image_17.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

```powershell
#region parameters
$AllowClear = '@AllowClear@'
$AllowPhysicalPresence = '@AllowPhysicalPresence@'
$AllowRestart = '@AllowRestart@'

$Parameters = @{}

if ( $AllowClear -match '1|Yes|True' ) {
    $Parameters.Add('AllowClear', $true)
}
if ( $AllowPhysicalPresence -match '1|Yes|True' ) {
    $Parameters.Add('AllowPhysicalPresence', $true)
}
if ( $AllowRestart -match '1|Yes|True' ) {
    $Parameters.Add('AllowRestart', $true)
}

#region Setup - Variables
$ProjectName = 'Enable-TPM'
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

![Row 1 Function Image 4](../../../static/img/Enable-TPM/image_18.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Row 2 Function Image 1](../../../static/img/Enable-TPM/image_19.png)  

A blank function will appear.  
![Row 2 Function Image 2](../../../static/img/Enable-TPM/image_20.png)  

Search and select the `Script Log` function.  
![Row 2 Function Image 3](../../../static/img/Enable-TPM/image_21.png)  

The following function will pop up on the screen:  
![Row 2 Function Image 4](../../../static/img/Enable-TPM/image_22.png)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Row 2 Function Image 5](../../../static/img/Enable-TPM/image_23.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Row 2 Function Image 6](../../../static/img/Enable-TPM/image_24.png)  

## Completed Script

![Completed Script Image](../../../static/img/Enable-TPM/image_25.png)  

## Output

- Script Log  
![Output Image](../../../static/img/Enable-TPM/image_26.png)  
