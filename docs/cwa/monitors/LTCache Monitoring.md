---
id: '1f389c5d-df7a-49a9-9db4-9e0442afbe7b'
slug: /1f389c5d-df7a-49a9-9db4-9e0442afbe7b
title: 'LTCache Monitoring'
title_meta: 'LTCache Monitoring'
keywords: ['monitor', 'ltcache', 'windows', 'alert', 'agent']
description: 'This document outlines a remote monitor setup that detects when the LTCache directory at C://Windows//Temp exceeds 5 GB in size. It provides details on suggested settings for alerts and the specific check action to be implemented on Windows machines.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

This is a remote monitor that will detect when the 'C:\Windows\Temp\LTCache' space exceeds 5 GB.

## Details

**Suggested "Limit to"**: `Windows Machines`
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `Default Create Automate Ticket`  

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File   | **See below** | Less than   | 14400    | 5      |

**Check Value:** 
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$ErrorActionPreference = 'SilentlyContinue'; if(Test-Path 'C:\Windows\Temp\LtCache') {[Math]::Round(((Get-ChildItem 'C:\Windows\Temp\LtCache' -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB),2)}else{'0'}"
```

## Target

This monitor should be run on all Windows machines.