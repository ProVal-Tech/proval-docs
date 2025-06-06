---
id: '0a012cf5-0ead-442a-bc82-f5c5fe0b13f8'
slug: /0a012cf5-0ead-442a-bc82-f5c5fe0b13f8
title: 'Enable Advanced Windows Security Auditing'
title_meta: 'Enable Advanced Windows Security Auditing'
keywords: ['windows', 'security', 'auditing', 'monitoring', 'event']
description: 'This document explains how to enable Advanced Windows Security Auditing in Microsoft Windows to monitor and record security-related events. It details the setup of alerts and the necessary scripts to ensure comprehensive security monitoring on managed Windows servers and workstations.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

Advanced Windows Security Auditing is a feature in Microsoft Windows that allows users to monitor and record events related to security. By enabling this feature, users can track and analyze security-related events in their systems. However, if this feature is not fully enabled, some security events may not be captured, leaving the system vulnerable to security threats.

The remote monitor will periodically check the system's security settings and trigger an alert on an endpoint if Advanced Windows Security Auditing is not fully enabled.

![Fully enabled Advanced Windows Security Auditing](../../../static/img/docs/0a012cf5-0ead-442a-bc82-f5c5fe0b13f8/image_1.webp)

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Enable Advanced Windows Security Auditing 

**Script [Enable Advanced Windows Security Auditing [Globals, Autofix]](/docs/3c74153d-7575-485c-bd6d-c5e002384cbd) must be imported before creating the alert template.**

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result     |
|--------------|----------------|------------|---------------|------------|----------|------------|
| system       | 127.0.0.1      | Run File   | **See Below** | Regex Match | 86400 | ^OK$|^$ |

**Execute Info:** 
```cmd
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= 'SilentlyContinue';$Auditing = (auditpol /get /category:'Logon/Logoff')[4..30];$psout = @(); foreach ($Audit in $Auditing) {if($Audit -NotMatch 'Success and Failure|^\s*$') { $psout += $Audit}}; return $psout"
```

## Dependencies

[Enable Advanced Windows Security Auditing [Globals, Autofix]](/docs/3c74153d-7575-485c-bd6d-c5e002384cbd)

## Target

Managed Windows Servers and Workstations