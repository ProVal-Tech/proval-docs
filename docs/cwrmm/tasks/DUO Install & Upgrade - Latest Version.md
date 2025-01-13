---
id: 'rmm-duo-install-upgrade'
title: 'DUO Install & Upgrade - Latest Version'
title_meta: 'DUO Install & Upgrade - Latest Version'
keywords: ['duo', 'installer', 'update', 'authentication', 'windows']
description: 'This document provides a comprehensive guide on how to install or update DUO for Windows Login. The script checks if the currently installed version is older than the latest release, verifies the installer hash, and downloads the latest installer from the official DUO site before deploying it.'
tags: ['installation', 'update', 'software', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

This script will install or update DUO if the currently installed instance is older than the latest released version. This script does match the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe).

## Sample Run

![Sample Run 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_1.png)  
![Sample Run 2](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_2.png)  

## Dependencies

[CW RMM Custom Fields - Duo Authentication for Windows Logon Deployment](https://proval.itglue.com/DOC-5078775-17914127) 

## Variables

| Name         | Description                                                                                                         |
|--------------|---------------------------------------------------------------------------------------------------------------------|
| DUOHost      | Collects the host key for deployment stored in the company custom field "DUO Windows Login Host".                   |
| DUOSKEY      | Collects the Skey for DUO deployment stored in the company custom field "Duo Windows Login SKEY".                  |
| DUOIKEY      | Collects the Ikey for DUO deployment stored in the company custom field "Duo Windows Login IKEY".                  |
| AutopushOvr  | Collects the value stored in the endpoint custom field "DUO Autopush Ovrr".                                       |
| AutopushSvr  | Collects the value stored in the company custom field "DUO Autopush Server".                                       |
| AutopushWks  | Collects the value stored in the company custom field "DUO Autopush Wks".                                         |
| EnableOfflineOvr | Collects the value stored in the endpoint custom field "DUO EnableOffline Ovrr".                                |
| EnableOfflineSvr | Collects the value stored in the company custom field "DUO EnableOffline Server".                              |
| EnableOfflineWks | Collects the value stored in the company custom field "DUO EnableOffline Wks".                                 |
| FailOpenOvr  | Collects the value stored in the endpoint custom field "DUO FailOpen Ovrr".                                       |
| FailOpenSvr  | Collects the value stored in the company custom field "DUO FailOpen Server".                                       |
| FailOpenWks  | Collects the value stored in the company custom field "DUO FailOpen Wks".                                         |
| RDPOnlyOvr   | Collects the value stored in the endpoint custom field "DUO RDPOnly Ovrr".                                        |
| RDPOnlySvr   | Collects the value stored in the company custom field "DUO RDPOnly Server".                                       |
| RDPOnlyWks   | Collects the value stored in the company custom field "DUO RDPOnly Wks".                                         |
| SmartCardOvr | Collects the value stored in the endpoint custom field "DUO SmartCard Ovrr".                                       |
| SmartCardSvr | Collects the value stored in the company custom field "DUO SmartCard Server".                                       |
| SmartCardWks | Collects the value stored in the company custom field "DUO SmartCard Wks".                                         |

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_3.png)  
![Task Creation 2](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_4.png)  

**Name:** `DUO Install & Upgrade - Latest Version`  
**Description:** `This script will install or update DUO if the currently installed instance is older than the latest released version. This script does match the hash of the installer from the official website before deploying it. This script downloads the latest installer from [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe).`  
**Category:** `Application`  
![Task Creation 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_5.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Step 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_6.png)  

A blank function will appear.  
![Task Step 2](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_7.png)  

### Row 1 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `DUOHost` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Windows Login Host` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_10.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_11.png)  

### Row 2 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `DUOSKEY` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `Duo Windows Login SKEY` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_12.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_13.png)  

### Row 3 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `DUOIKEY` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `Duo Windows Login IKEY` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_14.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_15.png)  

### Row 4 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `AutopushOvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Autopush Ovrr` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_16.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_17.png)  

### Row 5 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `AutopushSvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Autopush Server` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_18.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_19.png)  

### Row 6 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `AutopushWks` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Autopush Wks` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_20.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_21.png)  

### Row 7 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `EnableOfflineOvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO EnableOffline Ovrr` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_22.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_23.png)  

### Row 8 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `EnableOfflineSvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO EnableOffline Server` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_24.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_25.png)  

### Row 9 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `EnableOfflineWks` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO EnableOffline Wks` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_26.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_27.png)  

### Row 10 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `FailOpenOvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Failopen Ovrr` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_28.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_29.png)  

### Row 11 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `FailOpenSvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO FailOpen Server` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_30.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_31.png)  

### Row 12 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `FailOpenWks` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO FailOpen Wks` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_32.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_33.png)  

### Row 13 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `RDPOnlyOvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO RDPOnly Ovrr` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_34.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_35.png)  

### Row 14 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `RDPOnlySvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO RDPOnly Server` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_36.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_37.png)  

### Row 15 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `RDPOnlyWks` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO RDPOnly Wks` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_38.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_39.png)  

### Row 16 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `SmartCardOvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO SmartCard Ovrr` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_40.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_41.png)  

### Row 17 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `SmartCardSvr` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Smartcard Server` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_42.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_43.png)  

### Row 18 Function: Set Pre-defined Variable

Search and select the `Set Pre-defined Variable` function.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_8.png)  

The following function will pop up on the screen:  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_9.png)  

- Select the `Custom Field` radio button.
- Set `SmartCardWks` in the `Variable Name` field.
- Search and select the Client-Level Custom Field `DUO Smartcard Wks` from the Custom Field dropdown menu.
- Click the `Save` button.  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_44.png)  
![Task Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_45.png)  

### Row 19 Function: PowerShell Script

Add a new row by clicking the `Add Row` button.  
![Task Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_46.png)  

Search and select the `PowerShell Script` function.  
![Task Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_47.png)  

The following function will pop up on the screen:  
![Task Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_48.png)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

```
$Osinfo = (Get-CimInstance -ClassName Win32_OperatingSystem).caption
$AutopushOvr = '@AutopushOvr@'
$AutopushSvr = '@AutopushSvr@'
$AutopushWks = '@AutopushWks@'
$EnableOfflineOvr = '@EnableOfflineOvr@'
$EnableOfflineSvr = '@EnableOfflineSvr@'
$EnableOfflineWks = '@EnableOfflineWks@'
$FailOpenOvr = '@FailOpenOvr@'
$FailOpenSvr = '@FailOpenSvr@'
$FailOpenWks = '@FailOpenWks@'
$RDPOnlyOvr = '@RDPOnlyOvr@'
$RDPOnlySvr = '@RDPOnlySvr@'
$RDPOnlyWks = '@RDPOnlyWks@'
$SmartCardOvr = '@SmartCardOvr@'
$SmartCardSvr = '@SmartCardSvr@'
$SmartCardWks = '@SmartCardWks@'
$DUOHost = '@DUOHost@'
$DUOIKEY = '@DUOIKEY@'
$DUOSKEY = '@DUOSKEY@'
```

```powershell
if ($DUOHost -eq '' -or $DUOHost -match '@DUOHost') {
    return 'ERROR: DUO Host missing.'
}
```

```powershell
if ($DUOIKEY -eq '' -or $DUOIKEY -match '@DUOIKEY') {
    return 'ERROR: DUO Host missing.'
}
```

```powershell
if ($DUOSKEY -eq '' -or $DUOSKEY -match '@DUOSKEY') {
    return 'ERROR: DUO Host missing.'
}
```

```powershell
$Arguments = @()
if ($AutopushOvr -eq 'Yes' -or ($AutopushSvr -eq 'Yes' -and $Osinfo -match 'Server') -or ($AutopushWks -eq 'Yes' -and $Osinfo -match 'Windows 10|11')) {
    $Arguments += 'AUTOPUSH="#1"'
}
```

```powershell
if ($FailOpenOvr -eq 'Yes' -or ($FailOpenSvr -eq 'Yes' -and $Osinfo -match 'Server') -or ($FailOpenWks -eq 'Yes' -and $Osinfo -match 'Windows 10|11')) {
    $Arguments += 'FAILOPEN="#1"'
}
```

```powershell
if ($SmartCardOvr -eq 'Yes' -or ($SmartCardSvr -eq 'Yes' -and $Osinfo -match 'Server') -or ($SmartCardWks -eq 'Yes' -and $Osinfo -match 'Windows 10|11')) {
    $Arguments += 'SMARTCARD="#1"'
}
```

```powershell
if ($RDPOnlyOvr -eq 'Yes' -or ($RDPOnlySvr -eq 'Yes' -and $Osinfo -match 'Server') -or ($RDPOnlyWks -eq 'Yes' -and $Osinfo -match 'Windows 10|11')) {
    $Arguments += 'RDPONLY="#1"'
}
```

```powershell
if ($EnableOfflineOvr -eq 'Yes' -or ($EnableOfflineSvr -eq 'Yes' -and $Osinfo -match 'Server') -or ($EnableOfflineWks -eq 'Yes' -and $Osinfo -match 'Windows 10|11')) {
    $Arguments += 'ENABLEOFFLINE="#1"'
}
```

```powershell
$ArgumentsString = $Arguments -join ' '
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
$Content = Invoke-WebRequest [https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe) -UseBasicParsing -method Head
$Content.RawContent -match '(duo[\\-a-z0-9\\.]*?\\.exe)' | Out-Null
$DuoFilename = $Matches[1]
if ($DuoFilename -match '(duo[\\-a-z0-9\\.]*?\\.exe)') {
    Write-Output "$DuoFilename"
} else {
    return 'ERROR: URL has an issue'
}
```

```powershell
$RawHash = Invoke-WebRequest [https://duo.com/docs/checksums#duo-windows-logon](https://duo.com/docs/checksums#duo-windows-logon) -UseBasicParsing
$RawHash -match "([a-z0-9]{64}) +$DuoFilename" | Out-Null 
$DuoRawHash = $Matches[1]   

#region Setup - Variables
$URL = '[https://dl.duosecurity.com/duo-win-login-latest.exe](https://dl.duosecurity.com/duo-win-login-latest.exe)'
$WorkingDirectory = 'C:\\ProgramData\\_Automation\\Script\\DuoAuth'
$Path = "$WorkingDirectory\\DuoInstaller.exe"
#endregion
```

```powershell
#region Setup - Folder Structure
if ( !(Test-Path $WorkingDirectory) ) {
    try {
        New-Item -Path $WorkingDirectory -ItemType Directory -Force -ErrorAction Stop | Out-Null
    } catch {
        return "ERROR: Failed to Create $WorkingDirectory. Reason: $($Error[0].Exception.Message)"
    }
}
if (-not ( ( ( Get-Acl $WorkingDirectory ).Access | Where-Object { $_.IdentityReference -Match 'EveryOne' } ).FileSystemRights -Match 'FullControl' ) ) {
    $ACl = Get-Acl $WorkingDirectory
    $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule('Everyone', 'FullControl', 'ContainerInherit, ObjectInherit', 'none', 'Allow')
    $Acl.AddAccessRule($AccessRule)
    Set-Acl $WorkingDirectory $Acl
}
#endregion
```

```powershell
#region write script
$response = Invoke-WebRequest -Uri $URL -OutFile $Path -UseBasicParsing
if (!(Test-Path -Path $Path)) {
    return 'ERROR: An error occurred and the script was unable to be downloaded. Exiting.'
}
#endregion
```

```powershell
$DuoVersion = (Get-ItemProperty "$Path").VersionInfo.FileVersion
$CurrentHash = (Get-FileHash -Path $Path -Algorithm SHA256).Hash
If ($DuoRawHash -eq $CurrentHash) {
    $DUOCurrentVersion = Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Duo Authentication for Windows Logon' } | Select-Object -ExpandProperty DisplayVersion
    if ($DuoVersion -eq $DUOCurrentVersion) {
        return 'DUO Windows for login is already up to date.'
    } elseif ($DUOCurrentVersion -match '[0-9]') {
        Start-Process -FilePath $Path -ArgumentList "/S /V`\" REBOOT=ReallySuppress /qn IKEY=`\"$DUOIKEY`\" SKEY=`\"$DUOSKEY`\" HOST=`\"$DUOHost`\" $ArgumentsString`\"" -Wait -WindowStyle Hidden
        Start-Sleep -Seconds 30
        $DUOCurrentVersion = Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Duo Authentication for Windows Logon' } | Select-Object -ExpandProperty DisplayVersion
        if ($DuoVersion -eq $DUOCurrentVersion) {
            Write-Output 'Duo Authentication for Windows Logon is successfully updated.'
        } else {
            return 'ERROR: Duo Authentication for Windows Logon failed to update.'
        }
    } else {
        Start-Process -FilePath $Path -ArgumentList "/S /V`\" REBOOT=ReallySuppress /qn IKEY=`\"$DUOIKEY`\" SKEY=`\"$DUOSKEY`\" HOST=`\"$DUOHost`\" $ArgumentsString`\"" -Wait -WindowStyle Hidden
        Start-Sleep -Seconds 30
        $DUOCurrentVersion = Get-ChildItem -Path HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Uninstall, HKLM:\\SOFTWARE\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Uninstall | Get-ItemProperty | Where-Object { $_.DisplayName -match 'Duo Authentication for Windows Logon' } | Select-Object -ExpandProperty DisplayVersion
        if ($DuoVersion -eq $DUOCurrentVersion) {
            Write-Output 'Duo Authentication for Windows Logon is successfully installed.'
        } else {
            return 'ERROR: Duo Authentication for Windows Logon failed to install.'
        }
    }
} else {
    return 'ERROR: DUO Installer hash failed to match'
}
```

![Task Step 7](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_49.png)  

## Row 20 Logic: If/Then

Add a new `If/Then/Else` logic from the Add Logic dropdown menu.  
![Task Step 8](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_50.png)  

### Row 20a Condition: Output Contains

Type `ERROR:` in the Value box.  
![Task Step 9](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_51.png)  

### Row 20b Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Task Step 10](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_46.png)  

Search and Select the `Set Custom Field` function.  
![Task Step 11](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_52.png)  

The following function will pop up on the screen:  
![Task Step 12](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_53.png)  

- Search and select the Computer-Level Custom Field `DUO Deployment Result` from the Custom Field dropdown menu.
- Set `Failed` in the `Value` field.  
- Click the `Save` button.  
![Task Step 13](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_54.png)  
![Task Step 14](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_55.png)  

### Row 20c Function: Script Exit

Add a new row by clicking the `Add Row` button.  
![Task Step 15](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_46.png)  

Search and select the `Script Exit` function.  
![Task Step 16](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_56.png)  

The following function will pop up on the screen:  
![Task Step 17](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_57.png)  

In the script exit message, simply type  
```
Failed to install the DUO Authentication for Windows Login application. Refer to the logs:
%Output%
```
and click the `Save` button.  
![Task Step 18](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_58.png)  

## Row 21 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Step 19](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_59.png)  

A blank function will appear.  
![Task Step 20](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_60.png)  

Search and select the `Script Log` function.  
![Task Step 21](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_61.png)  

The following function will pop up on the screen:  
![Task Step 22](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_62.png)  

In the script log message, type  
```
Successfully installed the DUO Authentication for Windows Login application. Refer to the logs:
%Output%
```
and click the `Save` button.  
![Task Step 23](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_63.png)  

## Row 22 Function: Set Custom Field

Add a new row by clicking the `Add Row` button.  
![Task Step 24](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_46.png)  

Search and Select the `Set Custom Field` function.  
![Task Step 25](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_52.png)  

The following function will pop up on the screen:  
![Task Step 26](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_53.png)  

- Search and select the Computer-Level Custom Field `DUO Deployment Result` from the Custom Field dropdown menu.
- Set `Success` in the `Value` field.  
- Click the `Save` button.  
![Task Step 27](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_64.png)  
![Task Step 28](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_65.png)  

## Row 23 Function: Script Exit

Add a new row by clicking the `Add Row` button.  
![Task Step 29](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_46.png)  

Search and select the `Script Exit` function.  
![Task Step 30](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_56.png)  

The following function will pop up on the screen:  
![Task Step 31](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_66.png)  

In the script exit message, leave it blank  
and click the `Save` button.  
![Task Step 32](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_67.png)  

## Completed Task

![Completed Task 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_68.png)  
![Completed Task 2](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_69.png)  

## Implementation

It is suggested to run the Task once per week against the group `DUO Auth for Windows Login Deployment`.  

- Goto `Automation` > `Tasks`.
- Search for `DUO Install & Upgrade - Latest Version` Task.
- Select the concerned task.
- Click on `Schedule` the button to schedule the task/script.  
![Implementation Step 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_70.png)  

This screen will appear.  
![Implementation Step 2](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_71.png)  

- Select the `Schedule` button and click the calendar-looking button present in front of the `Recurrence` option.  
![Implementation Step 3](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_72.png)  

- Select the `Month(s)` for the `Repeat`, `1` for `Dates` and click the `OK` button to save the schedule.  
![Implementation Step 4](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_73.png)  

- Click the `Select Targets` button to select the concerned target.  
![Implementation Step 5](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_74.png)  

- Search and select the [`Duo Auth for Windows Login Deployment`](https://proval.itglue.com/5078775/docs/17914126) Device Group for the target.  
![Implementation Step 6](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_75.png)  

- Click the `Run` button to initiate the schedule.  
![Implementation Step 7](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_76.png)  

## Output

Custom Field  
![Output 1](..\..\..\static\img\DUO-Install-&-Upgrade---Latest-Version\image_77.png)  

Script Log  




