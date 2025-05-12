---
id: 'bfcc2aec-a83b-49ac-bfbe-274cbf112a6e'
slug: /bfcc2aec-a83b-49ac-bfbe-274cbf112a6e
title: 'DUO Auth Proxy - Install/Update Latest Version'
title_meta: 'DUO Auth Proxy - Install/Update Latest Version'
keywords: ['duo', 'install', 'upgrade', 'authentication', 'proxy', 'script']
description: 'This document provides a comprehensive guide on how to install or update the DUO Authentication Proxy application to the latest version. It includes sample runs, dependencies, task creation steps, and implementation guidance to ensure successful deployment.'
tags: ['application', 'deployment', 'update']
draft: false
unlisted: false
---

## Summary

The script installs or updates the DUO Authentication Proxy application to the latest available version.

## Sample Run

![Sample Run 1](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_1.webp)  
![Sample Run 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_2.webp)  

## Dependencies

[CW RMM Custom Fields - DUO Auth Proxy Deployment](/docs/94f21e35-d184-4fb5-9215-898bb367a0e9)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_3.webp)  
![Task Creation 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_4.webp)  

**Name:** `DUO Install & Upgrade - Latest Version`  
**Description:** `This script will install or update DUO if the currently installed instance is older than the latest released version. This script checks the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe).`  
**Category:** `Application`  

![Task Creation 3](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_5.webp)  

## Task

### Row 1 Function: PowerShell Script

Add a new `Add Row` button.

![Add Row](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_6.webp)  

Search and select the `PowerShell Script` function.  

![PowerShell Script](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_7.webp)  

The following function will pop up on the screen:  

![PowerShell Function](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_8.webp)  

Paste the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```powershell
$ProgressPreference = 'SilentlyContinue'
$ErrorActionPreference = 'Silentlycontinue'
$URL = 'https://dl.duosecurity.com/duoauthproxy-latest.exe'
$WorkingDirectory = 'C:\ProgramData\_Automation\Script\DuoAuthProxy'
$Path = "$WorkingDirectory\DuoAuthProxyInstaller.exe"
$File = (Invoke-WebRequest -uri https://dl.duosecurity.com/duoauthproxy-latest.exe -UseBasicParsing -Method Head).headers.'Content-Disposition' 
$DuoVersion = "$(($File -replace '.*duoauthproxy-','' -replace '\.exe"$',''))"
#region Setup - Folder Structure
if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    }
    catch {
        return "ERROR: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
} if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
#region write script
$response = Invoke-WebRequest -Uri $URL -OutFile $Path -UseBasicParsing
if (!(Test-Path -Path $Path)) {
    return 'ERROR: An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion
$DUOCurrentVersion = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'DUO Security Authentication Proxy' } | Select-Object -ExpandProperty DisplayVersion
if ($DuoVersion -eq $DUOCurrentVersion) {
    return 'DUO Security Authentication Proxy is already up to date.'
}
elseif ($DUOCurrentVersion -match '[0-9]') {
    & $Path /S
    Start-Sleep -Seconds 120
    $DUOCurrentVersion = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'DUO Security Authentication Proxy' } | Select-Object -ExpandProperty DisplayVersion
    if ($DuoVersion -eq $DUOCurrentVersion) {
        Write-Output 'DUO Security Authentication Proxy is successfully updated.'
    }
    else {
        return 'ERROR: DUO Security Authentication Proxy is failed to update.'
    }
}
else {
    & $Path /S
    Start-Sleep -Seconds 120
    $DUOCurrentVersion = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'DUO Security Authentication Proxy' } | Select-Object -ExpandProperty DisplayVersion
    if ($DuoVersion -eq $DUOCurrentVersion) {
        Write-Output 'DUO Security Authentication Proxy is successfully installed.'
    }
    else {
        return 'ERROR: DUO Security Authentication Proxy is failed to install.'
    }
}
```

![PowerShell Script 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_9.webp)  

### Row 2 Logic: If/Then

Add a new `If/Then/Else` logic from the Add Logic dropdown menu.

![If/Then Logic](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_10.webp)  

#### ROW 2a Condition: Output Contains

Type `ERROR:` in the Value box.

![Output Contains](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_11.webp)  

#### Row 2b Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 2b](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_6.webp)  

Search and select the `Set Custom Field` function.

![Set Custom Field](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_12.webp)  

The following function will pop up on the screen:  

![Set Custom Field Function](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_13.webp)  

- Search and select the Computer-Level Custom Field `DUO Auth Proxy Result` from the Custom Field dropdown menu.
- Set `Failed` in the `Value` field.
- Click the `Save` button.  

![Set Custom Field Save](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_14.webp)  
![Set Custom Field Save 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_15.webp)  

#### Row 2c Function: Script Exit

Add a new row by clicking the `Add Row` button.

![Add Row 2c](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_6.webp)  

A blank function will appear.  

![Blank Function](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_16.webp)  

Search and select the `Script Exit` function.

![Script Exit](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_17.webp)  
![Script Exit 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_18.webp)  

The following function will pop up on the screen:  

![Script Exit Function](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_19.webp)  

In the script exit message, type:

```PlainText
Failed to install the "DUO Security Authentication Proxy" application. Refer to the logs:
%Output%
```

and click the `Save` button.

![Script Exit Save](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_20.webp)  

### Row 3 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row 3](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_21.webp)  

A blank function will appear.  

![Blank Function 3](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_16.webp)  

Search and select the `Script Log` function.

![Script Log](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_22.webp)  
![Script Log 2](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_23.webp)  

The following function will pop up on the screen:  

![Script Log Function](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_24.webp)  

In the script log message, type:

```PlainText
Successfully installed the "DUO Security Authentication Proxy" application. Refer to the logs:
%Output%
```

and click the `Save` button.

![Script Log Save](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_25.webp)  

### Row 4 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.

![Add Row 4](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_6.webp)  

Search and select the `Set Custom Field` function.

![Set Custom Field 4](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_12.webp)  

The following function will pop up on the screen:  

![Set Custom Field Function 4](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_13.webp)  

- Search and select the Computer-Level Custom Field `DUO Auth Proxy Result` from the Custom Field dropdown menu.
- Set `Success` in the `Value` field.
- Click the `Save` button.

![Set Custom Field Save 4](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_26.webp)  
![Set Custom Field Save 4b](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_27.webp)  

### Row 5 Function: Script Exit

Add a new row by clicking the `Add Row` button.

![Add Row 5](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_6.webp)  

A blank function will appear.  

![Blank Function 5](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_16.webp)  

Search and select the `Script Exit` function.

![Script Exit 5](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_17.webp)  
![Script Exit 5b](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_18.webp)  

The following function will pop up on the screen:  

![Script Exit Function 5](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_19.webp)  

In the script exit message, leave it blank and click the `Save` button.

![Script Exit Save 5](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_28.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_29.webp)  

## Implementation

It is suggested to run the task once per week against the group `DUO Auth Proxy Deployment`.

- Go to `Automation` > `Tasks`.
- Search for the `DUO Auth Proxy - Install/Update Latest Version` task.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.

![Schedule Task](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_30.webp)  

This screen will appear.

![Schedule Screen](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_31.webp)  

Select the `Schedule` button and click the calendar-looking button present in front of the `Recurrence` option.

![Schedule Recurrence](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_32.webp)  

Select the `Month(s)` for the `Repeat`, `1` for `Dates`, and click the `OK` button to save the schedule.

![Schedule Save](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_33.webp)  

Click the `Select Targets` button to select the concerned target.

![Select Targets](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_34.webp)  

Search and select the `Duo Auth Proxy Deployment` Device Group for the target.

![Select Device Group](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_35.webp)  

Click the `Run` button to initiate the schedule.

![Run Task](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_36.webp)  

## Output

Script log  
Custom field  

![Output](../../../static/img/docs/775e0b37-b55c-47fb-bec6-a01314ac123f/image_37.webp)  