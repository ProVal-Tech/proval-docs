---
id: '38fc04ed-71ee-46f8-a1a6-d48c39a36402'
title: '_Automation Directory - Remove Obsolete .ps1 Change'
title_meta: '_Automation Directory - Remove Obsolete .ps1 Change'
keywords: ['monitor', 'cleanup', 'powershell', 'scripts', 'automation', 'files']
description: 'This document outlines the functionality of a remote monitor designed to delete any PowerShell scripts older than one day from the C://ProgramData//_Automation directory. It emphasizes the importance of removing these files to enhance security and system performance.'
tags: ['cleanup', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The remote monitor is designed to clean up any '*.ps1' files older than 1 day located in the `C:/ProgramData/_Automation` directory. Since these scripts are often whitelisted by security applications, it is recommended to remove them from the system after they are run.

---

This monitor will make a change to all systems it is deployed to.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif) ![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)

---

**What will change?**  
This monitor will check for a specific condition and make the necessary changes. All PowerShell files under the _Automation directory that are older than 1 day will be deleted.

---

*This action will happen regardless of what alert template is set against the monitor.*  
*Monitors that make a change to the environment can be difficult to audit actions taken. Use with caution.*

## Details

**Suggested "Limit to"**: Managed Windows Machines  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Do Nothing  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|-------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | Regex Match | 86400    | ((^((OK){0,}(//r//n){0,}[//r//n]{0,}//s{0,})$)|(^$)) |

## Target

Managed Windows Servers and Workstations  
![Image](../../../static/img/_Automation-Directory---Remove-Obsolete-.ps1-Change/image_1.png)

## Implementation

[Import - Remote Monitor - _Automation Directory - Remove Obsolete .ps1 [Change]](<./Import - Remote Monitor - _Automation Directory - Remove Obsolete .ps1 Change.md>)



