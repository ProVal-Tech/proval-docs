---
id: 'cwa-enable-advanced-windows-security-auditing'
title: 'Enable Advanced Windows Security Auditing'
title_meta: 'Enable Advanced Windows Security Auditing'
keywords: ['windows', 'security', 'auditing', 'monitoring', 'event']
description: 'This document explains how to enable Advanced Windows Security Auditing in Microsoft Windows to monitor and record security-related events. It details the setup of alerts and the necessary scripts to ensure comprehensive security monitoring on managed Windows servers and workstations.'
tags: ['security', 'windows', 'monitoring', 'alert', 'configuration']
draft: false
unlisted: false
---
## Summary

Advanced Windows Security Auditing is a feature in Microsoft Windows that allows users to monitor and record events related to security. By enabling this feature, users can track and analyze security-related events in their systems. However, if this feature is not fully enabled, some security events may not be captured, leaving the system vulnerable to security threats.

The remote monitor will periodically check the system's security settings and trigger on an endpoint if Advanced Windows Security Auditing is not fully enabled.

![Fully enabled Advanced Windows Security Auditing](5078775/docs/12413446/images/17532793)

## Details

**Suggested "Limit to"**: Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Enable Advanced Windows Security Auditing  

```
INSERT INTO `alerttemplate` (`Name`, `Comment`, `Last_User`, `Last_Date`, `Permission`, `EditPermission`, `GUID`) VALUES ('Enable Advanced Windows Security Auditing', 'Enable Advanced Windows Security Auditing', 'PRONOC', '2023-03-20 07:03:53', '', '', '7505b667-bbf8-4907-930a-71a435af94ab');
INSERT INTO `alerttemplates` (`AlertActionID`, `DayOfWeek`, `TimeStart`, `TimeEnd`, `AlertAction`, `ContactID`, `UserID`, `ScriptID`, `Message`, `Trump`, `GUID`, `WarningAction`) VALUES ((select alertactionid from alerttemplate where `GUID` = '7505b667-bbf8-4907-930a-71a435af94ab'), 127, '00:00:00', '23:59:00', 512, -1, 0, (select scriptid from lt_scripts where scriptguid = '3805ab5d-c70e-11ed-8b06-000c295e5f21'), '', 0, '8954b973-79ad-4e8b-a63e-45a1a038c72d', 512);
```

**Script `Enable Advanced Windows Security Auditing [Globals, Autofix]` must be imported before creating the alert template.**

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| system       | 127.0.0.1      | Run File   | C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$ErroractionPreference= 'SilentlyContinue';$Auditing = (auditpol /get /category:'Logon/Logoff')[4..30];$psout = @(); foreach ($Audit in $Auditing) {if($Audit -NotMatch 'Success and Failure|^\s*$') { $psout += $Audit}}; return $psout" | Regex Match | 86400 | ^OK$|^$ |

## Dependencies

[CWM - Automate - Script - Enable Advanced Windows Security Auditing [Globals, Autofix]](https://proval.itglue.com/DOC-5078775-12413447)

## Target

Managed Windows Servers and Workstations


