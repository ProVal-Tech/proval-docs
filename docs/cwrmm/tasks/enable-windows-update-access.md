---
id: '9907b8d6-17a4-41cd-b687-dea1e5744485'
slug: /9907b8d6-17a4-41cd-b687-dea1e5744485
title: 'Enable Windows Update Access'
title_meta: 'Enable Windows Update Access'
keywords: ['windows', 'update', 'registry', 'access', 'disable']
description: 'This document provides a detailed guide on how to enable Windows Update access by overwriting the DisableWindowsUpdateAccess registry key at the computer and user levels. It includes sample runs, task creation steps, and the PowerShell script necessary for implementation.'
tags: ['patching', 'registry', 'security']
draft: false
unlisted: false
---

## Summary

The script will overwrite the `DisableWindowsUpdateAccess` registry key if it's set at the computer or user level. This ensures that Windows update access is not disabled for the machine, users, or the system account.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_1.webp)  
![Sample Run Image 2](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_2.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Task Creation Image 1](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_4.webp)  

**Name:** Enable Windows Update Access  
**Description:** Set the DisableWindowsUpdateAccess registry key to 0 if it's set to 1. Setting it to 1 disables Windows access and can be set at both computer and user levels.  
**Category:** Patching  
![Task Creation Image 3](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_5.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_6.webp)  

A blank function will appear.  
![Task Image 2](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_8.webp)  
![Task Image 4](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_9.webp)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_10.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```powershell
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

```powershell
# Overwriting Disabled Windows Access for System Account
$pathArray = @(
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'Registry::HKEY_USERS\\S-1-5-18\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    if ((Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).DisableWindowsUpdateAccess -ge 1) {
        Write-Output 'Enabling Windows Update Access to the System Account.'
        try {
            if (!(Test-Path $path)) {
                New-Item -Path $path -Force -Confirm:$false -ErrorAction Stop | Out-Null
            }
            Set-ItemProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction Stop
        } catch {
            throw "Failed to enable Windows Update Access for the system account. Reason: $($Error[0].Exception.Message)"
        }
    }
}
```

```powershell
# Overwriting Disabled Windows Access for Computer
$pathArray = @(
    'HKLM:\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'HKLM:\\Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    if ((Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).DisableWindowsUpdateAccess -ge 1) {
        Write-Output 'Enabling Windows Update Access to the Computer.'
        try {
            Set-RegistryKeyProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction Stop
        } catch {
            throw "Failed to enable Windows Update Access for the computer. Reason: $($Error[0].Exception.Message)"
        }
    }
}
```

```powershell
# Overwriting Disabled Windows Access for Users
$pathArray = @(
    'Software\\Policies\\Microsoft\\Windows\\WindowsUpdate',
    'Software\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU',
    'Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate',
    'Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\WindowsUpdate\\AU'
)
foreach ($path in $pathArray) {
    if (Get-UserRegistryKeyProperty -Path $Path -Name DisableWindowsUpdateAccess -ErrorAction SilentlyContinue | Where-Object { $_.Value -ge 1 }) {
        Set-UserRegistryKeyProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
        $failedUsers = Get-UserRegistryKeyProperty -Path $Path -Name DisableWindowsUpdateAccess -ErrorAction SilentlyContinue | Where-Object { $_.Value -ge 1 }
        if ($failedUsers) {
            throw "Failed to enable Windows Update Access for the Users. $($failedUsers -join ', ')"
        }
    }
}
```

![Task Image 6](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_11.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Image 7](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_12.webp)  

A blank function will appear.  
![Task Image 8](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_13.webp)  

Search and select the `Script Log` function.  
![Task Image 9](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_14.webp)  
![Task Image 10](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_15.webp)  

The following function will pop up on the screen:  
![Task Image 11](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_16.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Task Image 12](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_17.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 13](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_18.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/9907b8d6-17a4-41cd-b687-dea1e5744485/image_19.webp)  

## Output

- Script log