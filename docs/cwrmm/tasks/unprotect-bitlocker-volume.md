---
id: '904664df-741e-4c18-9667-6bf351b4754c'
slug: /904664df-741e-4c18-9667-6bf351b4754c
title: 'Unprotect Bitlocker Volume'
title_meta: 'Unprotect Bitlocker Volume'
keywords: ['bitlocker', 'protection', 'disable', 'volumes', 'security']
description: 'This document provides detailed instructions on how to disable Bitlocker protection on one or all volumes. It includes sample runs, dependencies, user parameters, task creation steps, and script execution details.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

Disable Bitlocker protection on one (or all) volumes.

## Sample Run

![Sample Run 1](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_1.webp)  
![Sample Run 2](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_2.webp)  
![Sample Run 3](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_3.webp)  

## Dependencies

[Unprotect-BitLockerVolume](/docs/22114d12-c60e-479e-93a5-50d3450b6631)

## User Parameters

| Name       | Example       | Required   | Description                                                        |
|------------|---------------|------------|--------------------------------------------------------------------|
| MountPoint | C:            | Partially  | The target volume to remove Bitlocker protection from.             |
| All        | True / False  | Partially  | Use this switch to remove Bitlocker protection from all volumes.   |

**Note:**

- The `All` parameter will take precedence if both parameters are specified.
- If no parameters are set, the script will attempt to disable BitLocker on the system drive.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  

![Task Creation 1](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_4.webp)  
![Task Creation 2](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_5.webp)  

**Name:** Unprotect Bitlocker Volume  
**Description:** Disable Bitlocker protection on one (or all) volumes.  
**Category:** Security  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_6.webp)  

This screen will appear.  

![Parameter Screen](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_7.webp)  

- Set `MountPoint` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_8.webp)  

Click the `Confirm` button to save the parameter.  

![Confirm Save](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_9.webp)  

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_6.webp)  

This screen will appear.  

![Parameter Screen Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_7.webp)  

- Set `All` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_10.webp)  

Click the `Confirm` button to save the parameter.  

![Confirm Save Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_11.webp)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  

![Add Row](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_12.webp)  

A blank function will appear.  

![Blank Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_13.webp)  

Search and select the `PowerShell Script` function.  

![Select PowerShell Script](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_14.webp)  

![PowerShell Script Selected](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_15.webp)  

The following function will pop up on the screen:  

![PowerShell Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_16.webp)  

```powershell
# # Parameters and Globals
# # Be sure that the name of the hashtable property matches the name of the parameter of the script that you are calling.
$mountPoint = '@MountPoint@'
$all = '@All@'
$Parameters = @{}
if ( $all -match '1|Yes|True' ) {
    $Parameters.Add( 'All', $true )
} else {
    if ( $mountPoint -notmatch '^[A-z]{1}:{0,1}$' ) {
    $mountPoint = $env:SystemDrive
    } 
    $Parameters.Add( 'MountPoint', $mountPoint )
}
#region Setup - Variables
$ProjectName = 'Unprotect-BitLockerVolume'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$Workingpath = $WorkingDirectory
$LogPath = "$WorkingDirectory\$ProjectName-log.txt"
$ErrorLogPath = "$WorkingDirectory\$ProjectName-Error.txt"
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

![Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_17.webp)  

## Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  

![Add Row for Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_18.webp)  

A blank function will appear.  

![Blank Function for Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_13.webp)  

Search and select the `Script Log` function.  

![Select Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_19.webp)  

![Script Log Selected](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_20.webp)  

The following function will pop up on the screen:  

![Script Log Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_21.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  

![Save Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_22.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  

![Save Script](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_23.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_24.webp)  

## Output

- Script log
