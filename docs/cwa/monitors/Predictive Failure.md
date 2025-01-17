---
id: '81638d59-3335-4464-af10-25f37ed41402'
title: 'Disk Health Monitor for Windows Machines'
title_meta: 'Disk Health Monitor for Windows Machines'
keywords: ['disk', 'health', 'monitor', 'windows', 'status']
description: 'This document outlines the setup of a disk health monitor for Windows machines, utilizing a PowerShell command to check the status of disk drives. It details the expected outcomes and the alerting mechanism for potential disk failures, ensuring timely ticket creation for maintenance.'
tags: ['windows']
draft: false
unlisted: false
---
## Summary

The monitor set will compare the result of `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $WarningPreference = 'SilentlyContinue'; $disks = (Get-WmiObject -Class Win32_DiskDrive) ; foreach($disk in $disks) \{write-host -NoNewline "$($disk.Status)"}` Command against the "Fail". The expected outcomes are 'OK', 'Predic Failure', or 'Failed'. A ticket will be created for the machines with either of "Failed" or "Predic Failure" health status for a disk.

## Details

**Suggested "Limit to"**: Windows Machine.  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Create Automate Ticket  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $WarningPreference = 'SilentlyContinue'; $disks = (Get-WmiObject -Class Win32_DiskDrive) ; foreach($disk in $disks) \{write-host -NoNewline "$($disk.Status)"}` | Does Not Contain | 600 | Fail |

## Target

Windows Machines: This should be run on all the windows machines covered under the Service Plans.












