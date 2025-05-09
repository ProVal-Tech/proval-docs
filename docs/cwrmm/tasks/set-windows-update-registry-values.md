---
id: 'bd00b8d9-5f7f-449a-bf03-90a0ee610d3a'
slug: /bd00b8d9-5f7f-449a-bf03-90a0ee610d3a
title: 'Set Windows Update Registry Values'
title_meta: 'Set Windows Update Registry Values'
keywords: ['registry', 'windows', 'update', 'patching', 'system', 'access']
description: 'This document provides a detailed guide on setting registry values for Windows Update to ensure proper patching and rebooting functionality through ConnectWise RMM. It includes steps for removing unnecessary registry entries and ensuring required values are set correctly.'
tags: ['patching', 'registry', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The script is designed to remove any additional registry values from the registry path `Computer/HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU`. Additionally, it ensures that the values for the keys `NoAutoRebootWithLoggedOnUsers` and `NoAutoUpdate` are set to `1`.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_1.webp)

CW Support recommends setting these registry keys on the local device to ensure that patching and rebooting occur properly from CW RMM.

Furthermore, the script will ensure that patching access is not disabled for the `System` account by making the necessary registry changes.

## Sample Run

![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_2.webp) ![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_3.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_4.webp)  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_5.webp)  

**Name:** Set Windows Update Registry Values  
**Description:** Set required registry values to enable Windows updates from CW RMM.  
**Category:** Patching  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_6.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_7.webp)  

A blank function will appear.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_8.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_9.webp) ![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_10.webp)  

The following function will pop up on the screen:  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_11.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

```PowerShell
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
$regKey = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU'
# Remove existing registry keys
if ( Test-Path -Path $regKey ) {
    foreach ( $property in ((Get-Item -Path $regKey).Property) ) {
        if ( !(('NoAutoUpdate', 'NoAutoRebootWithLoggedOnUsers') -contains $property) ) {
            try {
                $value = (Get-ItemProperty -Path $regKey)."$Property"
                Write-Output "Removing the registry key $($property) with the value $value"
                Remove-ItemProperty -Path $regKey -Name $property -Force -Confirm:$false -ErrorAction Stop
            } catch {
                throw "Failed to remove registry key: $($property). Reason: $($Error[0].Exception.Message)"
            }
        }
    }
}
# Set the desired registry values
foreach ( $prop in ('NoAutoUpdate', 'NoAutoRebootWithLoggedOnUsers') ) {
    $value = (Get-ItemProperty -Path $regKey -ErrorAction SilentlyContinue)."$prop"
    if ( !($value -eq 1) ) {
        try {
            if ( !$value ) {
                Write-Output "$prop does not exist. Creating the registry key."
            } else {
                Write-Output "Current Value for $($prop): $($Value)"
            }
            Set-RegistryKeyProperty -Path $regKey -Name $prop -Value 1 -Type DWord -Force -ErrorAction Stop
        } catch {
            throw "Failed to set registry key: $($prop). Reason: $($Error[0].Exception.Message)"
        }
    }
}
# Ensure that the Windows Update Access is enabled for the system account.
$path = 'Registry::HKEY_USERS\S-1-5-18\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate'
if ( (Get-ItemProperty -Path $path -ErrorAction SilentlyContinue).DisableWindowsUpdateAccess -ne 0 ) {
    Write-Output 'Enabling Windows Update Access to the System Account.'
    try {
        if ( !(Test-Path $path) ) {
            New-Item -Path $path -Force -Confirm:$false -ErrorAction Stop
        }
        Set-ItemProperty -Path $path -Name DisableWindowsUpdateAccess -Value 0 -Force -ErrorAction Stop
    } catch {
        throw "Failed to enable Windows Update Access for the system account. Reason: $($Error[0].Exception.Message)"
    }
}
```

![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_12.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_13.webp)  

A blank function will appear.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_14.webp)  

Search and select the `Script Log` function.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_15.webp)  

![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_16.webp)  

The following function will pop up on the screen:  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_17.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_18.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_19.webp)  

## Completed Task

![Image](../../../static/img/docs/bd00b8d9-5f7f-449a-bf03-90a0ee610d3a/image_20.webp)

## Output

- Script log
