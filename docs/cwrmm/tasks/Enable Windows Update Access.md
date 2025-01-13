---
id: 'rmm-enable-windows-update-access'
title: 'Enable Windows Update Access'
title_meta: 'Enable Windows Update Access'
keywords: ['windows', 'update', 'registry', 'access', 'disable']
description: 'This document provides a detailed guide on how to enable Windows Update access by overwriting the DisableWindowsUpdateAccess registry key at the computer and user levels. It includes sample runs, task creation steps, and the PowerShell script necessary for implementation.'
tags: ['registry', 'patching', 'script', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

The script will overwrite the `DisableWindowsUpdateAccess` registry key if it's set at the computer or user level. This ensures that the Windows update access is not disabled for the machine, users, or the system account.

## Sample Run

![Sample Run Image 1](..\..\..\static\img\Enable-Windows-Update-Access\image_1.png)  
![Sample Run Image 2](..\..\..\static\img\Enable-Windows-Update-Access\image_2.png)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](..\..\..\static\img\Enable-Windows-Update-Access\image_3.png)  
![Task Creation Image 2](..\..\..\static\img\Enable-Windows-Update-Access\image_4.png)  

**Name:** Enable Windows Update Access  
**Description:** Set the DisableWindowsUpdateAccess registry key to 0 if it's set to 1. Setting it to 1 disables Windows access and can be set at both computer and user levels.  
**Category:** Patching  
![Task Creation Image 3](..\..\..\static\img\Enable-Windows-Update-Access\image_5.png)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](..\..\..\static\img\Enable-Windows-Update-Access\image_6.png)  

A blank function will appear.  
![Task Image 2](..\..\..\static\img\Enable-Windows-Update-Access\image_7.png)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](..\..\..\static\img\Enable-Windows-Update-Access\image_8.png)  
![Task Image 4](..\..\..\static\img\Enable-Windows-Update-Access\image_9.png)  

The following function will pop up on the screen:  
![Task Image 5](..\..\..\static\img\Enable-Windows-Update-Access\image_10.png)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```
#region Strapper
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Enum]::ToObject([Net.SecurityProtocolType], 3072)
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
try {
    Update-Module -Name Strapper -ErrorAction Stop
} catch {
    Install-Module -Name Strapper -Repository PSGallery -SkipPublisherCheck -Force
    Get-Module -Name Strapper -ListAvailable | Where-Object { $_.Version -ne (Get-InstalledModule -Name Strapper).Version } | ForEach-Object { Uninstall-Module -Name Strapper -MaximumVersion $_.Version }
}
(Import-Module -Name 'Strapper') 3>&1 2>&1 1>$null
Set-StrapperEnvironment
#endregion
```

```
#Overwriting Disabled windows access for System account
$pathArray = @(
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    if ( (Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).DisableWindowsUpdateAccess -ge 1 ) {
        Write-Output 'Enabling Windows Update Access to the System Account.'
        try {
            if ( !(Test-Path $path) ) {
                New-Item -Path $path -Force -Confirm:$false -ErrorAction Stop | Out-Null
            }
            Set-ItemProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction Stop
        } catch {
            throw "Failed to enable Windows Update Access for the system account. Reason: $($Error[0].Exception.Message)"
        }
    }
}
```

```
#Overwriting Disabled windows access for computer
$pathArray = @(
    'HKLM:\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'HKLM:\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    $Path = 'HKLM:\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate'
    if ( (Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).DisableWindowsUpdateAccess -ge 1 ) {
        Write-Output 'Enabling Windows Update Access to the Computer.'
        try {
            Set-RegistryKeyProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction Stop
        } catch {
            throw "Failed to enable Windows Update Access for the computer. Reason: $($Error[0].Exception.Message)"
        }
    }
}
```

```
#Overwriting Disabled windows access for users
$pathArray = @(
    'Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    if ( Get-UserRegistryKeyProperty -Path $Path -Name DisableWindowsUpdateAccess -ErrorAction SilentlyContinue | Where-Object { $_.Value -ge 1 } ) {
        Set-UserRegistryKeyProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        $failedUsers = Get-UserRegistryKeyProperty -Path $Path -Name DisableWindowsUpdateAccess -ErrorAction SilentlyContinue | Where-Object { $_.Value -ge 1 }
        if ( $failedUsers ) {
            throw "Failed to enable Windows Update Access for the Users. $($failedUsers -join ', ')"
        }
    }
}
```

![Task Image 6](..\..\..\static\img\Enable-Windows-Update-Access\image_11.png)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Image 7](..\..\..\static\img\Enable-Windows-Update-Access\image_12.png)  

A blank function will appear.  
![Task Image 8](..\..\..\static\img\Enable-Windows-Update-Access\image_13.png)  

Search and select the `Script Log` function.  
![Task Image 9](..\..\..\static\img\Enable-Windows-Update-Access\image_14.png)  

![Task Image 10](..\..\..\static\img\Enable-Windows-Update-Access\image_15.png)  

The following function will pop up on the screen:  
![Task Image 11](..\..\..\static\img\Enable-Windows-Update-Access\image_16.png)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Task Image 12](..\..\..\static\img\Enable-Windows-Update-Access\image_17.png)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 13](..\..\..\static\img\Enable-Windows-Update-Access\image_18.png)  

## Completed Task

![Completed Task Image](..\..\..\static\img\Enable-Windows-Update-Access\image_19.png)  

## Output

- Script log



