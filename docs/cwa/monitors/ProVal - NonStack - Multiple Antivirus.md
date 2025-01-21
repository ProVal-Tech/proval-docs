---
id: 'c9183b6d-95a8-409a-9d04-e85611bf04d2'
title: 'ProVal - NonStack - Multiple Antivirus'
title_meta: 'ProVal - NonStack - Multiple Antivirus'
keywords: ['alert', 'antivirus', 'monitor', 'detection', 'windows']
description: 'This document outlines the setup for an alert that triggers when two or more antivirus products are detected on a Windows machine. It provides details on the necessary checks, requirements, and potential issues that may arise when multiple antivirus applications are installed.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Summary

Alerts if there are 2 or more antiviruses present in the AntivirusProduct class.

## Details

**Suggested "Limit to"**: Any  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: To be determined by partner  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | Default        | Run File `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "if ((Get-CimInstance -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct).count -gt 1) \{ return (Get-CimInstance -erroraction silentlycontinue -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct | Select-Object -Property DisplayName -Unique | Where-Object -Property DisplayName -ne 'Windows Defender' ).count } else \{ return }"` | Less Than | 2 |  |

## Requirements

- The target machine needs to have had an antivirus installed in the past; if it has not, the monitor will not trigger; however, the results will be inaccurate. The AntivirusProduct class does not exist until an antivirus is installed and activated.
- The target machine's antivirus must be active to populate into the AntivirusProduct class.

## Notes

This monitor will be effective in determining many cases where multiple antiviruses are installed; however, it is not foolproof, as many antivirus applications do not report themselves to the AntivirusProduct class until they are completely active. A good example of this is ESET antivirus.

Windows Defender will report itself to the AntivirusProduct class if it is installed (even if inactive); you may need to lower the remote monitor threshold to less than 3.

## Target

The intended target of this monitor is Windows-based machines that have had at least one antivirus installed in the past.

## FAQ

**Q.** This is reporting multiple antivirus products, but I don't see any in the software list.  
**A.** The nature of this script is to report on how many antivirus products are currently registered in the 'root/SecurityCenter2' namespace as an AntiVirusProduct. There are two reasons why this can occur:
1. The antivirus in question used to exist on the machine; however, the uninstallation of the product did not complete properly, and the product is still registered.
2. The antivirus software in question is indeed installed; however, the uninstallation registry key for WindowsComponent is set to 1, which is hiding the software from the add/remove programs list as well as the automated software list.

**Q.** Is there any way to see what this monitor specifically found?  
**A.** Running the following PowerShell command will display the name of every found item.

```
return (Get-CimInstance -erroraction silentlycontinue -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct | Select-Object -Property DisplayName -Unique | Where-Object -Property DisplayName -ne 'Windows Defender')
```




