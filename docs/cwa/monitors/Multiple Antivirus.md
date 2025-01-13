---
id: 'cwa-multiple-antivirus-alert-monitor'
title: 'Multiple Antivirus Alert Monitor'
title_meta: 'Multiple Antivirus Alert Monitor'
keywords: ['antivirus', 'monitor', 'windows', 'alert', 'security']
description: 'This document provides a detailed overview of a monitor designed to alert users when two or more antivirus products are present on a Windows machine. It outlines the requirements, setup instructions, and potential FAQs related to the functionality of the monitor.'
tags: ['alert', 'monitor', 'windows', 'security']
draft: false
unlisted: false
---
## Summary

Alerts if there are 2 or more antiviruses present in the AntivirusProduct class.

## Details

**Suggested "Limit to"**: Any  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: To be determined by partner  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|-------------|-------------|------------|----------|--------|
| System       | Default        | Run File `C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -Command "if ((Get-CimInstance -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct).count -gt 1) { return (Get-CimInstance -erroraction silentlycontinue -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct | Select-Object -Property DisplayName -Unique | Where-Object -Property DisplayName -ne 'Windows Defender' ).count } else { return }"` | Less Than | 2 |  |  |

## Requirements

- The Target machine needs to have had an antivirus installed in the past; if it has not, the monitor will not trigger, however the results will be bad. The AntivirusProduct Class does not exist until an antivirus is installed and activated.
- The Target machine's antivirus must be active to populate into the AntivirusProduct class.

## Notes

This Monitor will be effective in determining many cases where multiple antiviruses are installed; however, it is not foolproof, as many antivirus applications do not report themselves to the AntivirusProduct class until they are completely active. A good example of this is ESET antivirus.

Windows Defender will report itself to the AntivirusProduct class if it is installed (even if inactive); you may need to bump the remote monitor threshold to less than 3.

## Target

The intended target of this monitor are Windows-based machines that have had at least one antivirus installed in the past.

## FAQ

**Q.** This is reporting multiple Antivirus's but I don't see any in the software list.  
**A.** The nature of this script is to report on how many Antivirus products are currently registered in the 'root/SecurityCenter2' Namespace as an AntiVirusProduct. That being said, there are two reasons why this can occur:
1. The antivirus in question used to exist on the machine; however, the uninstallation of the product did not complete properly, and the product is still registered.
2. The antivirus software in question is in fact installed; however, the uninstallation registry key for WindowsComponent is set to 1, which is hiding the software from the add/remove programs list as well as the automated software list.

**Q.** Is there any way to see what this monitor specifically found?  
**A.** Running the following PowerShell command will display the name of every found item.

```
return (Get-CimInstance -erroraction silentlycontinue -Namespace 'root/SecurityCenter2' -Class AntiVirusProduct | Select-Object -Property DisplayName -Unique | Where-Object -Property DisplayName -ne 'Windows Defender')
```




