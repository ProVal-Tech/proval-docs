---
id: '2ad8091c-4bbb-4524-abc0-b0f0016ef4a5'
title: 'Windows RDS License Check'
title_meta: 'Windows RDS License Check'
keywords: ['rds', 'licensing', 'monitor', 'server', 'windows']
description: 'This document outlines a remote monitor that checks the status of the RDS licensing server, verifying if licenses are available for either per user or per device. It includes details on the suggested settings for monitoring, dependencies, target systems, and ticketing information for alert notifications.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This remote monitor checks if the RDS licensing server has issues with licenses. It verifies if the license is available either for per user or per device.

## Details

**Suggested "Limit to"**: Machines where the Windows RDS Licensing Server Role is detected.  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Automate Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|-------------|----------|------|
| System       | 127.0.0.1     | Run File   | **See Below**  | Regex Match | Daily     | [2,4] |

**Execute Info:**
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "Get-CimInstance -Namespace 'Root/CIMV2/TerminalServices' -Class Win32_TerminalServiceSetting | Select-Object -ExpandProperty LicensingType"
```

## Dependencies

[RSM - Remote Desktop Services - Role - Windows RDS Licensing Server](<../roles/Windows RDS Licensing Server.md>)

## Target

Windows machines with the [RSM - Remote Desktop Services - Role - Windows RDS Licensing Server](<../roles/Windows RDS Licensing Server.md>) role installed.

## Ticketing

**Subject:** Windows RDS Server License Issue Detected on %clientname%/%computername%

**Body:**  

**Failure:** We have detected a licensing issue with your RDS Licensing Server. The possibilities are that either the license is misconfigured or has expired. Please check.  

**Success:** The license issue has been resolved.