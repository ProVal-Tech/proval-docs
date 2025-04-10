---
id: '28ddee2c-510a-4557-941a-168d155eacdc'
slug: /28ddee2c-510a-4557-941a-168d155eacdc
title: 'LTTray Detection'
title_meta: 'LTTray Detection'
keywords: ['lttray', 'port', 'registry', 'monitor', 'windows']
description: 'This document outlines a remote monitor designed to detect discrepancies between the LTTray port value in the registry and the actual port being utilized by Windows. It includes suggested alert styles, templates, and check actions for effective monitoring on Windows machines.'
tags: ['performance', 'registry', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor detects if the port value for the LTTray in the registry matches the actual port that is being used by Windows for the process.

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: Autofix - LTTray Fix  

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result          |
|--------------|----------------|-------------|-------------|------------|----------|------------------|
| System       | 127.0.0.1     | Run File    | **See below**   | Contains    | 900      | Ports are same    |

**Check Value:**
```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$process = Get-Process -Name "ltsvc" -ErrorAction SilentlyContinue | Select-Object -First 1;if($process){$netstatOut = netstat -ano | Where-Object {$_ -match \" $($process.Id)$\"} | Select-Object -First 1;$netstatFormatted = $netstatOut -split ' ' | Where-Object {$_};$port = ($netstatFormatted[1] -split ':')[1];$TrayPort = Get-ItemProperty -Path 'HKLM:\SOFTWARE\LabTech\Service' | select-object -expandproperty TrayPort -ErrorAction SilentlyContinue;if($port -eq $TrayPort){write-host "Ports are Same"}else{write-host "Ports are not same. Netstat Port is: $Port and Registry Port is: $TrayPort"}}else{write-host "Ltsvc.exe process not detected"}"
```

## Dependencies

[LTTray Port Mapping with System Registry](/docs/cc09c16e-c62b-4001-9226-1b92097a6507)

## Target

Windows machine
