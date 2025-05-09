---
id: '41c0732d-0740-40d4-bd2f-98edd91cc559'
slug: /41c0732d-0740-40d4-bd2f-98edd91cc559
title: 'Set Windows Updates to Default'
title_meta: 'Set Windows Updates to Default'
keywords: ['windows', 'updates', 'registry', 'default', 'settings']
description: 'This document provides a detailed guide on removing registry entries that may prevent Windows updates and restoring the default Windows Update settings to fully re-enable updates for users. It includes step-by-step instructions for task creation and implementation using a PowerShell script.'
tags: ['registry', 'software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This task removes any registry entries that may be preventing Windows updates and restores the default Windows Update settings, fully re-enabling updates for the user.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_2.webp)  
![Sample Run Image 2](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_3.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_4.webp)  
![Task Creation Image 2](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_5.webp)  

**Name:** Set Windows Updates to Default  
**Description:** This task removes all the possible registry entries that disable Windows Update on a machine.  
**Category:** Custom  

![Task Creation Image 3](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_6.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  

![Add Row Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_7.webp)  

A blank function will appear.  

![Blank Function Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_8.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![PowerShell Script Selection](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_9.webp)  

The following function will pop up on the screen:  

![PowerShell Function Popup](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_10.webp)  

Paste in the following PowerShell script and set the expected time of script execution to 600 seconds. Click the `Save` button.

```powershell
#region Strapper
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
$failures = @()
$properties = @(
    'NoAutoUpdate',
    'NoWindowsUpdate',
    'DisableWindowsUpdateAccess',
    'SetDisableUXWUAccess' 
)
#For Computer and System account
$pathArray = @(
    'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate',
    'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate',
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate\AU',
    'HKLM:\SYSTEM\Internet Communication Management\Internet Communication',
    'Registry::HKEY_USERS\S-1-5-18\Software\Policies\Microsoft\Windows\WindowsUpdate',
    'Registry::HKEY_USERS\S-1-5-18\Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    'Registry::HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate',
    'Registry::HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate\AU'
)
foreach ( $regPath in $pathArray ) {
    foreach ( $property in $properties ) {
        if ( Get-ItemProperty -Path $regPath -Name $property -ErrorAction SilentlyContinue ) {
            try {
                Set-ItemProperty -Path $regPath -Name $property -value 0 -Force -ErrorAction Stop
            } catch {
                $failure = [pscustomobject]@{
                    RegistryPath = $regPath
                    PropertyName = $property
                    FailureMessage = "Failed to Set property: $($Error[0].Exception.Message)"
                }
                $failures += $failure
            }
        }
    }
}
#For User Account
$pathArray = @(
    'Software\Policies\Microsoft\Windows\WindowsUpdate',
    'Software\Policies\Microsoft\Windows\WindowsUpdate\AU',
    'Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate',
    'Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate\AU',
    'Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'
)
foreach ( $regPath in $pathArray ) {
    foreach ( $property in $properties ) {
        if ( Get-UserRegistryKeyProperty -Path $regPath -Name $property -ErrorAction SilentlyContinue ) {
            try {
                Set-UserRegistryKeyProperty -Path $regPath -Name $property -Value 0 -Force -ErrorAction Stop
            } catch {
                $failure = [pscustomobject]@{
                    RegistryPath = $regPath
                    PropertyName = $property
                    FailureMessage = "Failed to set property: $($Error[0].Exception.Message)"
                }
                $failures += $failure
            }
        }
    }
}
if ( $failures ) {
    throw ( $failures | Out-String )
} else {
    return 'Success'
}

```

![alt text](../../../static/img/docs/set-windows-updates-to-default/image.png)

### Row 2: Function: Script Log

In the script log message, simply type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.

![Script Log Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_11.webp)  
![Script Log Output](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_12.webp)  

## Completed Task

![Completed Task Image](../../../static/img/docs/1be24785-d0c7-401c-8e47-833ab82d6c85/image_13.webp)  

## Output

- Script Log
