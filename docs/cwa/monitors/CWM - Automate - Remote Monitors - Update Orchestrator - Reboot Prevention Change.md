---
id: 'b0d63a21-0540-43a1-9269-079d3bfaa48d'
title: 'Windows Update Orchestrator Monitor'
title_meta: 'Windows Update Orchestrator Monitor'
keywords: ['monitor', 'windows', 'update', 'orchestrator', 'service']
description: 'This document describes a monitor that renames the reboot file used by the Windows Update Orchestrator to prevent unwanted reboots. It also ensures that the UsoSvc service is enabled and running, providing a safeguard against interruptions caused by automatic updates.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor set renames the reboot file at `C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot` in order to prevent the Windows Update Orchestrator service from rebooting the computer. It will also enable the `UsoSvc` service if it's disabled.

### What will change?

This monitor will rename the reboot file at  
`C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot`  
and keep the Windows Update Orchestrator Service enabled and running.

*This action will happen regardless of what alert template is set against the monitor.*  
*Monitors that make a change to the environment can be difficult to audit actions taken. Use with caution.*

## Details

**Suggested "Limit to"**: Update Orchestrator - UsoSvc  
**Suggested Alert Style**: Once  
**Suggested Alert Template**: Default - Create Automate Ticket  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator       | Interval | Result                        |
|--------------|----------------|------------|---------------|------------------|----------|-------------------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | Does Not Contain  | 600      | Failed to rename the reboot file |

## Target

Managed Windows Servers and Workstations

## Ticketing

**Subject:**  
Windows Update Orchestrator Monitor - Failed - %ComputerName%

**Body:**  
The reboot file at `C:/Windows/System32/Tasks/Microsoft/Windows/UpdateOrchestrator/reboot` failed to be renamed. The update orchestrator uses this file; it should either be deleted or renamed to prevent the update orchestrator from restarting the computer at any moment.

## Implementation

[Implement - Remote Monitor - Windows Update Orchestrator](<./Windows Update Orchestrator.md>)
