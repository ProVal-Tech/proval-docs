---
id: '1ce60c7e-e23d-4313-bb00-7e89ae031d7f'
title: 'Disable Windows Optional Automatic Updates'
title_meta: 'Disable Windows Optional Automatic Updates'
keywords: ['windows', 'updates', 'registry', 'automation', 'patching']
description: 'This document details the steps to disable Windows optional automatic updates using a script. It includes a sample run, dependencies, and a comprehensive implementation guide with visuals for each step.'
tags: ['patching', 'registry', 'windows']
draft: false
unlisted: false
---
## Summary

This task will disable the Windows optional automatic updates.

## Sample Run

![Sample Run 1](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_1.png)  
![Sample Run 2](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_2.png)  

## Dependencies

[CW RMM Custom Field - Windows Optional Update Disabled](<../custom-fields/Windows Optional Update Disabled.md>)

## Implementation

### Create Task

To implement this script, please create a new "PowerShell" style script in the system.  
![Create Task](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_3.png)  

**Name:** Disable Windows Optional/Automatic Updates  
**Description:** This task will disable the Windows optional automatic updates.  
**Category:** Patching  
![Task Details](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_4.png)  

## Script

Start by making three separate rows. You can do this by clicking the "Add Row" button at the bottom of the script page.  
![Add Row](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_5.png)  

### Row 1: Function: Script Log

![Script Log](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_6.png)  

In the script log message, type `Running the PowerShell to set NoAutoUpdates and Hide Automatic Updates Options.` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Log Message](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_7.png)  

### Row 2: Function: PowerShell Script

![PowerShell Script](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_8.png)  
![PowerShell Script 2](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_9.png)  

Paste in the following PowerShell script and set the expected time of script execution to `900` seconds.

```powershell
# Define the registry paths
$mainRegPath = "HKLM:/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU"
$auOptionsRegPath = "HKLM:/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU/AUOptions"

# Check if the main registry key exists
if (-not(Test-Path -Path $mainRegPath)) {
    # If not, create it
    New-Item -Path $mainRegPath -Force | Out-Null
}

# Check if the AUOptions registry key exists
if (Test-Path -Path $auOptionsRegPath) {
    # If it does, remove it
    Remove-Item -Path $auOptionsRegPath -Force
}

# Check if the AUOptions property exists under the main registry key
if ($null -ne (Get-ItemProperty -Path $mainRegPath -EA SilentlyContinue).AUOptions) {
    # If it does, remove it
    Remove-ItemProperty -Path $mainRegPath -Name "AUOptions" -Force
}

# Set the NoAutoUpdate DWORD value to 1
Set-ItemProperty -Path $mainRegPath -Name "NoAutoUpdate" -Value 1 -Type DWord -Force

# Check if the registry was set properly
if ((Get-ItemProperty -Path $mainRegPath).NoAutoUpdate -eq 1) {
    Write-Output "Registry set properly."
} else {
    Write-Output "Failed to set registry."
}
```

### Row 3: Function: Script Log

### Output

![Output](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_6.png)  

In the script log message, type `%output%` so that the script will send the results of the PowerShell script above to the output on the Automation tab for the target device.  
![Output Message](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_10.png)  

### Row 4: Logic: If/Then

![If/Then Logic 1](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_11.png)  
![If/Then Logic 2](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_12.png)  

### Row 4a: Condition: Output Contains

In the IF part, enter `Failed to set registry` in the right box of the "Output Contains" part.  
![Output Contains](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_13.png)  

### Row 4b: Condition: Script Exit

Add a new row by clicking on the Add row button.  
![Add Row Exit](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_14.png)  

In the script exit message, simply type `Failed to set the registry HKLM:/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU -Name NoAutoUpdate -Value 1. Exiting script with error.`  
![Exit Message](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_15.png)  

### Row 5: Function: Set Custom Field

Select Function 'Set Custom Field'. When you select `set custom field`, it will open up a new window.  

In this window, search for the `Windows Optional Update Disabled` field.  

**Custom Field:** Windows Optional Update Disabled  
**Value:** `Disabled`  
![Set Custom Field](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_16.png)  

### Row 6: Complete

![Complete](../../../static/img/Disable-Windows-OptionalAutomatic-Updates/image_17.png)  












