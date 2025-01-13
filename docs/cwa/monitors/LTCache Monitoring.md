---
id: 'cwa-remote-monitor-ltcache-check'
title: 'Remote Monitor for LTCache Size'
title_meta: 'Remote Monitor for LTCache Size'
keywords: ['monitor', 'ltcache', 'windows', 'alert', 'agent']
description: 'This document outlines a remote monitor setup that detects when the LTCache directory at C:\\Windows\\Temp exceeds 5 GB in size. It provides details on suggested settings for alerts and the specific check action to be implemented on Windows machines.'
tags: ['monitoring', 'windows', 'alert', 'configuration', 'setup']
draft: false
unlisted: false
---
## Summary

This is a remote monitor which will catch the agent where 'C:\Windows\Temp\LTCache' space is above 5 GB

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default Create automate Ticket.  

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File   | C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; if(Test-Path 'C:\Windows\Temp\LtCache'){[Math]::Round(((Get-ChildItem 'C:\Windows\Temp\LtCache' -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB),2)}else{'0'}" | Less than   | 14400    | 5      |

## Target

Windows Machines - Should be run on all Windows machines


