---
id: '1325f458-9c0e-4021-b107-26df4360bbed'
title: 'Remote Monitor to Disable Windows Fast Boot'
title_meta: 'Remote Monitor to Disable Windows Fast Boot'
keywords: ['monitor', 'fastboot', 'windows', 'registry', 'disable']
description: 'This document describes a remote monitor designed to detect if Windows Fast Boot is enabled via a registry check, disable it, and validate the change. If the operation fails, a ticket is generated noting the failure; otherwise, it confirms successful disabling of Fast Boot.'
tags: ['registry', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This remote monitor is designed to detect if Fast Boot is enabled via a registry check, disable it, and revalidate whether the operation succeeded. Based on the validation, it provides output as 'Success' or 'Failed'. If it fails, a ticket can be generated noting the failure; otherwise, Fast Boot will be disabled.

---

This monitor will make a change to all systems it is deployed to.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

**What will change?**

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

This monitor checks if Windows Fast Boot is enabled and then disables it.

**Registry Path:**
```
HKLM:/SYSTEM/CurrentControlSet/Control/Session Manager/Power/HiberbootEnabled (Set to 0)
```

> This action will happen regardless of what alert template is set against the monitor.

> Monitors that make changes to the environment can be difficult to audit. Use with caution.

## Details

**Suggested "Limit to"**: Windows Machines

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|--------------|------------|----------|--------|
| System       | 127.0.0.1      | Run File    | C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "$registryPath = 'HKLM:/SYSTEM/CurrentControlSet/Control/Session Manager/Power';if (Test-Path $registryPath) \{$hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue;if($hiberbootEnabled.HiberbootEnabled -eq 1) \{Set-ItemProperty -Path $registryPath -Name HiberbootEnabled -Value 0;$hiberbootEnabled = Get-ItemProperty -Path $registryPath -Name HiberbootEnabled -ErrorAction SilentlyContinue;if ($hiberbootEnabled.HiberbootEnabled -ne 0) \{return 'Failed'} else \{return 'Success'}} else \{return 'Success'}} else \{return 'Success'}" | Does Not Contain | 86400 | Failed |

## Target

Windows Workstation

## Ticketing

**Subject**  
FastBoot Failed to Disable at %computername%

**Body**  
**Success:**  
FastBoot is successfully disabled.  

**Failure:**  
%NAME% %STATUS% on %CLIENTNAME%/%COMPUTERNAME% at %LOCATIONNAME% for result %RESULT%.

## Implementation

Please follow the document below for the implementation steps:  
[Import - Remote Monitor - Windows Fast Boot Disable](<./Windows Fast Boot Disable Change.md>)


