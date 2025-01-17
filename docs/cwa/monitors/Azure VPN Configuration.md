---
id: '3411cd85-0769-4241-93b3-8df35af3d9f6'
title: 'Check Azure VPN Configuration'
title_meta: 'Check Azure VPN Configuration for Compassus Workstations'
keywords: ['azure', 'vpn', 'configuration', 'monitor', 'compassus']
description: 'This document outlines a monitor that checks for the presence of the .pbk file for Azure VPN configuration on target machines. It verifies the existence of the Compassus Azure VPN header within the file and returns error messages if the file or header is missing. Ideal for Compassus workstations group.'
tags: ['software', 'windows']
draft: false
unlisted: false
---
## Summary

This monitor checks for the presence of the .pbk file for the azure VPN configuration on the target machine. If that file exists, it checks for the presence of the [Compassus Azure VPN] header in that file. If the file is missing or the header is missing, the monitor returns ERROR: [description].

## Details

**Should be applied to the Compassus workstations group that should have the VPN configuration file.**

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | Default        | Run File    | C:/Windows/system32/cmd.exe /c powershell.exe -ExecutionPolicy Bypass -Command "$Users = ((Get-ChildItem 'HKLM:/Software/Microsoft/Windows NT/CurrentVersion/ProfileList' | Where-Object \{$_.GetValue('ProfileImagePath') -notlike 'C:/Windows*'}| ForEach-Object \{ $_.GetValue('ProfileImagePath') })).replace('C:/Users/','');$users | foreach \{ ; Try \{; $path =  Get-item -Path """C:/Users/$_/AppData/Local/Packages/Microsoft.AzureVpn_8wekyb3d8bbwe/LocalState/rasphone.pbk""" -ErrorAction stop ; if ((Get-Content $path) -Contains '[Compassus Azure VPN]') \{; Return; } else \{; Return 'ERROR: Missing VPN Configuration'; }; } catch \{; Return 'ERROR: Missing file'; }; }" | Does Not Contain | 300 | ERROR: |

## Dependencies

If using this Remote monitor, we should have an autofix action set up to run the [EPM - Windows Configuration - Script - Add-AzureVPNConnection [Paranet(Compassus)]](https://proval.itglue.com/DOC-5078775-11698749) script.

## Target

The targeted group will be explicitly chosen by the client but should be limited to Compassus.












