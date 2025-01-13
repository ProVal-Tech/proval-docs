---
id: 'cwa-windows-updates-monitor'
title: 'Windows Updates Monitor for ConnectWise Automate'
title_meta: 'Windows Updates Monitor for ConnectWise Automate'
keywords: ['windows', 'updates', 'monitor', 'patch', 'security']
description: 'This document outlines a monitor set designed for ConnectWise Automate to detect machines that have not installed Windows updates within the last 45 days. It ensures that all systems are up-to-date and protected against known security threats, focusing on supported operating systems and patch-managed devices.'
tags: ['monitor', 'updates', 'security', 'patch', 'ticketing']
draft: false
unlisted: false
---
## Summary

The objective of this monitor set is to provide a comprehensive solution for detecting machines that have not installed Windows updates within the last 45 days. This will help ensure that all systems are up-to-date and protected against known security threats.

Only devices running Microsoft's supported operating systems will be detected by the monitor set excluding those that are at the end of their lives. It will also only monitor machines that have come online within the last 7 days to ensure that the data collected is current and relevant.

Moreover, it only applies to PCs that are patch-managed and using Automate's default `patchhistory` table.

## Implementation

Replace the word `<MonitorID>` in the additional condition with the actual monitorid.

![Image 1](../../../static/img/Agent-Not-Patched--45-Days---Patch-History/image_1.png)

![Image 2](../../../static/img/Agent-Not-Patched--45-Days---Patch-History/image_2.png)

## Dependencies

- [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) 
- [CWM - Automate - Script - Ticket Creation - Computer](https://proval.itglue.com/DOC-5078775-9098338)

## Target

SQL is limiting the results to the patch-managed supported windows machines.

## Ticketing

**Subject:** `UPDATES - 45+ Days Since Last Patch Installed on %CLIENTNAME%/%COMPUTERNAME%`

**Failure Body:** 

```
We are currently reporting that it has been 45+ Days since the machine %CLIENTNAME%/%COMPUTERNAME% has installed a patch. Sometimes Automate fails to update the patch history table correctly so please verify if patching is actually having an issue or not.

The last update(s) seen to have been installed are shown below:
%FIELDNAME%
```

**Success Body:** 

```
Since this machine has fallen below the patching threshold, we are closing this ticket.
```

**%RESULT%:** `Number of days since the last windows update was installed.`

**%FIELDNAME%:** `Title(s) of the last patch(es) installed on the computer.`

## AlertTemplate

```
△ Custom - Ticket Creation - Computer
```



