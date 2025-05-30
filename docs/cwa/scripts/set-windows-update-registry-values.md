---
id: '5e361c08-9ccf-4495-ad7f-fc4caeafcd2d'
slug: /5e361c08-9ccf-4495-ad7f-fc4caeafcd2d
title: 'Set Windows Update Registry Values'
title_meta: 'Set Windows Update Registry Values'
keywords: ['registry', 'windowsupdate', 'patching', 'reboot', 'system']
description: 'This document details a script designed to remove unnecessary registry values from the Windows Update settings and ensure specific keys are set correctly for optimal patching and rebooting behavior in ConnectWise RMM.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The script is designed to remove any additional registry values from the registry path `Computer/HKEY_LOCAL_MACHINE/SOFTWARE/Policies/Microsoft/Windows/WindowsUpdate/AU`. Additionally, it ensures that the values for the keys `NoAutoRebootWithLoggedOnUsers` and `NoAutoUpdate` are set to `1`.  
![Image](../../../static/img/docs/5e361c08-9ccf-4495-ad7f-fc4caeafcd2d/image_1.webp)

CW Support recommends setting these registry keys on the local device to ensure that patching and rebooting occur properly from CW RMM.

Furthermore, the script will ensure that patching access is not disabled for the `System` account by making the necessary registry changes.

**File Hash:** `CD403F3ADF92ED255BBD935164481AA89686F44CF5498AAA2C9F1AE922CE0ADF`

## Sample Run

![Image](../../../static/img/docs/5e361c08-9ccf-4495-ad7f-fc4caeafcd2d/image_2.webp)

## Variables

| Name               | Description                                   |
|--------------------|-----------------------------------------------|
| ProjectName        | Set-WURegCWRMM                               |
| WorkingDirectory    | C:/ProgramData/_Automation/Script/Set-WURegCWRMM |
| ScriptPath         | C:/ProgramData/_Automation/Script/Set-WURegCWRMM/Set-WURegCWRMM.ps1 |

## Output

- Script log