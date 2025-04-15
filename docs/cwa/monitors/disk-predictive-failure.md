---
id: '81638d59-3335-4464-af10-25f37ed41402'
slug: /81638d59-3335-4464-af10-25f37ed41402
title: 'Disk - Predictive Failure'
title_meta: 'Disk - Predictive Failure'
keywords: ['disk', 'health', 'monitor', 'windows', 'status']
description: 'This document outlines the setup of a disk health monitor for Windows machines, utilizing a PowerShell command to check the status of disk drives. It details the expected outcomes and the alerting mechanism for potential disk failures, ensuring timely ticket creation for maintenance.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The monitor setup will compare the result of the following command:

```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $WarningPreference = 'SilentlyContinue'; $disks = (Get-WmiObject -Class Win32_DiskDrive) ; foreach($disk in $disks) {write-host -NoNewline "$($disk.Status)"}"
```

against the status "Fail". The expected outcomes are 'OK', 'Predicted Failure', or 'Failed'. A ticket will be created for machines with either "Failed" or "Predicted Failure" health status for a disk.

## Details

**Suggested "Limit to"**: Windows Machine.  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Create Automate Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **See Below** | Does Not Contain | 600 | Fail |

**Check Value**
```shell
C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; $WarningPreference = 'SilentlyContinue'; $disks = (Get-WmiObject -Class Win32_DiskDrive); foreach($disk in $disks) \{write-host -NoNewline "$($disk.Status)"}"
```

## Target

Windows Machines: This should be run on all the Windows machines covered under the Service Plans.