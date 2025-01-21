---
id: '52fca59d-2cc0-46b2-ae1e-13d46bd36615'
title: 'Monitor for Account Lockout Detection'
title_meta: 'Monitor for Account Lockout Detection'
keywords: ['monitor', 'lockout', 'account', 'detection', 'windows']
description: 'This document outlines a monitoring solution for detecting account lockouts on Windows machines. It includes details on the check action, server address, check type, and dependencies for effective account management.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor detects account lockouts.

## Details

### Windows Machines

| Check Action | Server Address | Check Type | Check Value                                                                                                                                | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------------------------------------------------------------------------------------------------------------------------------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "Get-WinEvent -ErrorAction SilentlyContinue -FilterHashtable @{LogName='Security'; Id=4740} | Where-Object {$_.TimeCreated -gt (Get-Date).AddMinutes(-15)} | Select-Object -ExpandProperty TimeCreated" | Missing     | 15       |        |

## Dependencies

- [User Management - Account Lockout Audit](<../../unsorted/User Management - Account Lockout Audit.md>)  
- [User Management - Account Lock Detail](<../../unsorted/User Management - Account Lock Detail.md>)  

## Target

Windows OS
