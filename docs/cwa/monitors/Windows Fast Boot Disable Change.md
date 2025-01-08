---
id: 'cwa-disable-fastboot-monitor'
title: 'Remote Monitor to Disable Windows Fast Boot'
title_meta: 'Remote Monitor to Disable Windows Fast Boot'
keywords: ['monitor', 'fastboot', 'windows', 'registry', 'disable']
description: 'This document describes a remote monitor designed to detect if Windows Fast Boot is enabled via a registry check, disable it, and validate the change. If the operation fails, a ticket is generated noting the failure; otherwise, it confirms successful disabling of Fast Boot.'
tags: ['windows', 'registry', 'monitor', 'ticketing', 'implementation']
draft: false
unlisted: false
---
## Summary

This remote monitor is designed to detect the fast boot enabled via registry check and set it to disable and revalidate if it succeeded or not. Based on the validation it gives output as 'Success' and 'Failed'. If it fails then a ticket can get generated noting the failure, otherwise fastboot will be disabled.

---

<u>This monitor will make a change to all systems it is deployed to</u>

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

<u><strong>What will change?</strong></u>

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

This monitor looks to see if Windows Fast Boot is enabled, then will disable it.

HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power\HiberbootEnabled (Set to 0)

> This action will happen regardless of what alert template is set against the monitor.

> Monitors that make a change to the environment can be difficult to audit actions taken. Use with caution.

## Details

**Suggested "Limit to"**: Windows Machines

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|--------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File    | C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "$registryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power';if (Test-Path $registryPath) {$hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue;if($hiberbootEnabled.HiberbootEnabled -eq 1) {Set-ItemProperty -Path $registryPath -Name HiberbootEnabled -Value 0;$hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue;if ($hiberbootEnabled.HiberbootEnabled -ne 0) {return 'Failed'} else {return 'Success'}} else {return 'Success'}} else {return 'Success'}" | Does Not Contain | 86400 | Failed |

## Target

Windows Workstation

## Ticketing

<u><strong>Subject</strong></u>  
FastBoot Failed to Disable at %computername%

<u><strong>Body</strong></u>  
<u><strong></strong></u>  
<u><strong>Success:</strong></u>  
FastBoot is successfully disabled.  

<u><strong>Failure:</strong></u>  
%NAME% %STATUS% on %CLIENTNAME%\%COMPUTERNAME% at %LOCATIONNAME% for result %RESULT%.

## Implementation

Please follow the below document for the implementation step:  
[Import - Remote Monitor - Windows Fast Boot disable](https://proval.itglue.com/DOC-5078775-15429553)  


