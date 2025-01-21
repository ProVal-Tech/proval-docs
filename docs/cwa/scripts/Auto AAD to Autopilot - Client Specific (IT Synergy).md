---
id: '8b128210-5b70-4155-ade6-83ab5365911c'
title: 'Auto AD to Autopilot Script'
title_meta: 'Auto AD to Autopilot Script'
keywords: ['script', 'autopilot', 'aad', 'registry', 'windows']
description: 'This document outlines a PowerShell script designed to automate the addition of Active Directory to Windows Autopilot by checking specific registry values and executing necessary commands if conditions are met. It includes setup instructions, sample run outputs, dependencies, and detailed process steps.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script satisfies the request of ticket T20221207.0097 - auto AD to Autopilot.

### Action Items:
- Create a script that checks for the specified registry value `Computer/HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Provisioning/Diagnostics/AutoPilot/EstablishedCorrelations` 
  - Name: AADEnrollInfo 
  - If the value does not exist, run the following command: 
    ```powershell
    $TenantId = '1e334b75-3a05-4930-ab3d-2f2ef9d57937' 
    $AppId = '67f6c690-2cd4-492d-b958-02e07e35bda5' 
    $AppSecret = 'nwV8Q~XvrGYTra434667JkMNikpyF7YsbGi' 
    Get-WindowsAutoPilotInfo -Online -TenantId $TenantId -AppId $AppId -AppSecret $AppSecret
    ```
  - The `$TenantId`, `$AppId`, and `$AppSecret` should be pulled from an encrypted EDF at the client level.
  - You'll need to install `Get-WindowsAutoPilotInfo` from PSGallery as well.

## Sample Run

Set up the assigned Encrypted Client Level EDF Values  
![Sample Run](../../../static/img/Auto-AAD-to-Autopilot---Client-Specific-(IT-Synergy)/image_1.png)

Run the script on the target machine  
![Run Script](../../../static/img/Auto-AAD-to-Autopilot---Client-Specific-(IT-Synergy)/image_2.png)

## Dependencies

AppID, AppSecret, and Tenant ID EDFs must be set at the client level.

## Variables

| Name   | Description                             |
|--------|-----------------------------------------|
| Tenant | Holds the decrypted AAD Tenant value    |
| Secret | Holds the decrypted AAD Secret value    |
| AppID  | Holds the decrypted AAD AppID           |

## Process

- Populate all variables with EDF values.
- Execute the script to run `Get-WindowsAutoPilotInfo.ps1` if the requested registry value is not present.
- There are two possible outcomes: either the registry value is returned with `AADEnrollInfo` in the text, or the results of the `Get-WindowsAutoPilotInfo.ps1` will be returned.
- If the output of PowerShell contains `AADEnrollInfo`, it's a success because the value is present.
- If the output does not contain "All Devices synced," then `Get-WindowsAutoPilotInfo.ps1` failed, and the script will fail.
- If the `FinishStatus` of the script PowerShell response - All Errors - Check is false, then the check for common environmental errors found a known issue, and the script will fail.
- The script log will hold any error type information.
