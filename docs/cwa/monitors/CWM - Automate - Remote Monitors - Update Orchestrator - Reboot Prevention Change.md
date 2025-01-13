---
id: 'cwa-windows-update-orchestrator-monitor'
title: 'Windows Update Orchestrator Monitor'
title_meta: 'Windows Update Orchestrator Monitor'
keywords: ['monitor', 'windows', 'update', 'orchestrator', 'service']
description: 'This document describes a monitor that renames the reboot file used by the Windows Update Orchestrator to prevent unwanted reboots. It also ensures that the UsoSvc service is enabled and running, providing a safeguard against interruptions caused by automatic updates.'
tags: ['monitoring', 'windows', 'update', 'service', 'security']
draft: false
unlisted: false
---
## Summary

The monitor set renames the reboot file at "C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot" in order to prevent rebooting the computer by the Windows update orchestrator service. It will also enable the `UsoSvc` service if it's disabled.

<div style="text-align: center;">
<img src="https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif" style="width: 110.99px; height: 125.99px; display: inline-block; float: left; margin-right: 1.2rem;"> 
<u style="color: var(--primary-text-color);">This monitor will make a change to all systems it is deployed to</u>
<img src="https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif" style="width: 110.99px; height: 125.99px; display: inline-block; float: right; margin-left: 1.2rem;">
</div>

### What will change?
This monitor will rename the reboot file at  
"C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot"  
& Keep the Windows Update Orchestrator Service Enabled + Running

*This action will happen regardless of what alert template is set against the monitor.*  
*Monitors that make a change to the environment can be difficult to audit actions taken. Use with caution.*

## Details

**Suggested "Limit to"**: Update Orchestrator - UsoSvc  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Automate Ticket  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does Not Contain | 600      | Failed to rename the reboot file |

## Target

Managed Windows Servers and Workstations

## Ticketing

**Subject:**  
Windows update Orchestrator Monitor - Failed - %ComputerName%

**Body:**  
The reboot file at "C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot" failed to be renamed. The update orchestrator uses this file; it should either be deleted or renamed to prevent the update orchestrator from restarting the computer at any moment.

## Implementation

[Implement - Remote Monitor - Windows Update Orchestrator](https://proval.itglue.com/DOC-5078775-16291367)




