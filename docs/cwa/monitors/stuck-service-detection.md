---
id: 'be3ca430-f53d-4198-9360-52894e5e6a6a'
slug: /be3ca430-f53d-4198-9360-52894e5e6a6a
title: 'Stuck Service Detection'
title_meta: 'Stuck Service Detection'
keywords: ['remote', 'powershell', 'monitor', 'stuck', 'services', 'windows']
description: 'This document outlines a remote PowerShell monitor designed to detect services that are stuck in a state other than Running or Stopped on Windows machines. It includes suggested alert styles, templates, and a detailed check action table for implementation.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This document describes a remote PowerShell monitor that detects stuck services in a state other than Running or Stopped.

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: ~Autofix - Remove Stuck Services  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **See Below**   | Missing    | 900      | Blank  |

**Check Value:**
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "Get-Service | Where-Object {$_.Status -ne 'Running' -and $_.Status -match 'ing'} | Select-Object -ExpandProperty Name -ErrorAction SilentlyContinue"
```

## Dependencies

[Stuck Service Action](/docs/bb8f2562-4744-4349-a661-62f64f0d05b2)

## Target

Windows Machine


