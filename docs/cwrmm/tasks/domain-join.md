---
id: 'a0374bc3-b579-4299-b952-5bb3d0440c52'
slug: /a0374bc3-b579-4299-b952-5bb3d0440c52
title: 'Domain Join'
title_meta: 'Domain Join'
keywords: ['domain', 'join', 'computer', 'rmm', 'management']
description: 'This document provides a detailed guide on how to join a non-domain joined computer to a domain using a specific script within ConnectWise RMM. It includes user parameters, task creation steps, and sample run images to assist users in the implementation process.'
tags: ['domain', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes how to join a non-domain joined computer to a domain. The machine will be forcefully rebooted if required. It covers the CW RMM implementation of the agnostic script [Join-Domain](/docs/fb3e4906-6520-4b5b-bc35-db7b79b45f7d).

## Sample Run

![Sample Run 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_1.webp)  
![Sample Run 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_2.webp)  
![Sample Run 3](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_3.webp)  

## Dependencies

- [Join-Domain](/docs/fb3e4906-6520-4b5b-bc35-db7b79b45f7d)

## User Parameters

| Name        | Example                     | Required | Type        | Description                                 |
|-------------|-----------------------------|----------|-------------|---------------------------------------------|
| DomainName  | ProValDev.local             | True     | Text String | The name of the domain to join.            |
| DomainAdmin | Administrator                | True     | Text String | Username of a domain administrator.         |
| Password    | "QWfqw2%R@@$@FQW:RVV!'qwdwq" | True     | Text String | Password of the domain administrator.       |

![User Parameters](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Step 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_5.webp)  
![Task Creation Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_6.webp)  

**Name:** `Domain Join`  
**Description:** `Joins a non-domain joined computer to a domain. The machine will be forcefully rebooted if required.`  
**Category:** `Management`  
![Task Creation Step 3](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_7.webp)  

## Parameters

### DomainName

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_9.webp)  

- Set `DomainName` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_10.webp)  

### DomainAdmin

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_9.webp)  

- Set `DomainAdmin` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_11.webp)  

### Password

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Add Parameter Step 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_8.webp)  

This screen will appear.  
![Add Parameter Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_9.webp)  

- Set `Password` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Add Parameter Step 3](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_12.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_14.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Function Step 1](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_15.webp)  
![PowerShell Function Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_16.webp)  

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_17.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `600` seconds. Click the `Save` button.  

```powershell
[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingConvertToSecureStringWithPlainText', '')]
[CmdletBinding()]
Param()
#region parameters
$DomainName = '@DomainName@'
$Admin = '@DomainAdmin@'
$password = @'
@Password@
'@
if ( ($DomainName -match '\SDomainName\S') -or ([String]::IsNullOrWhiteSpace($DomainName)) ) {
    throw 'Invalid domain name. Please provide a valid domain name.'
}
if ( ($Admin -match '\SDomainAdmin\S') -or ([String]::IsNullOrWhiteSpace($Admin)) ) {
    throw 'Invalid domain admin account. Please provide a valid domain admin account.'
}
if ( ($password -match '\SPassword\S') -or ([String]::IsNullOrWhite($password)) ) {
    throw 'Invalid password. Please provide a valid password.'
}
$securePwd = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object -TypeName pscredential -ArgumentList $Admin, $securePwd
$Parameters = @{
    DomainName = $DomainName
    Credential = $credential
}
#endregion
#region Setup - Variables
$ProjectName = 'Invoke-OfficeScrub'
[Net.ServicePointManager]::SecurityProtocol = [enum]::ToObject([Net.SecurityProtocolType], 3072)
$BaseURL = 'https://file.provaltech.com/repo'
$PS1URL = "$BaseURL/script/$ProjectName.ps1"
$WorkingDirectory = "C:\ProgramData\_automation\script\$ProjectName"
$PS1Path = "$WorkingDirectory\$ProjectName.ps1"
$WorkingPath = $WorkingDirectory
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
#region log verification
if ( !(Test-Path $LogPath) ) {
    throw 'PowerShell Failure. A Security application seems to have restricted the execution of the PowerShell Script.'
}
if ( Test-Path $ErrorLogPath ) {
    $ErrorContent = ( Get-Content -Path $ErrorLogPath )
    throw $ErrorContent
}
Get-Content -Path $LogPath
#endregion
```

![PowerShell Script Completion](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_18.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_19.webp)  

A blank function will appear.  
![Blank Function Step 2](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_20.webp)  

Search and select the `Script Log` function.  
![Script Log Function](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_21.webp)  

The following function will pop up on the screen:  
![Script Log Function Popup](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_22.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Script Log Save](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_23.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Script Save](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_24.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/a0374bc3-b579-4299-b952-5bb3d0440c52/image_25.webp)  

## Output

- Script log
