---
id: 'fd0bef13-23d6-40e3-8883-367e0fa6d166'
slug: /fd0bef13-23d6-40e3-8883-367e0fa6d166
title: 'Veeam Service Monitor'
title_meta: 'Veeam Service Monitor'
keywords: ['veeam', 'monitor', 'service', 'restart', 'alert']
description: 'This document outlines the implementation of a Veeam Service Monitor that checks the status of the VeeamBackupSvc service, restarts it if it is not running, and manages dependencies on other Veeam services. It includes details on alerting, ticketing, and implementation steps.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This monitor will check the status of the `VeeamBackupSvc` service and restart it if it is not running. If it fails to start, it will identify all other services with names starting with `Veeam` that are not running, start those services, and then attempt to start `VeeamBackupSvc` again.

## Details

**Suggested "Limit to"**: `VeeamBackupSvc`  
**Suggested Alert Style**: `Once`  
**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer`  

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|-------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 300      | ![Result Image](../../../static/img/docs/fd0bef13-23d6-40e3-8883-367e0fa6d166/image_1.webp) |

## Dependencies

[EPM - Windows Configuration - Agnostic - Invoke-RestartService](/docs/df5d8267-5836-48d8-8971-a5cc8b33722d)

## Target

Managed Computers with the `VeeamBackupSvc` service.  
![Target Image](../../../static/img/docs/fd0bef13-23d6-40e3-8883-367e0fa6d166/image_2.webp)  

## Ticketing

**Subject**: `Veeam Service Monitor - Failed - %ComputerName%`  

**Body:**  
`Veeam Service Monitor failed on %CLIENTNAME%//%COMPUTERNAME% at %LOCATIONNAME%`  

`%RESULT%`  

**%RESULT%:**  
`Failed to start VeeamBackupSvc.`  
`Output of restarting Veeam* Services: \<Output of Restarting Veeam* Services>`  
`Output of restarting VeeamBackupSvc: \<Output of Restarting VeeamBackupSvc>`  

## Implementation

[Import - Remote Monitor - Veeam Service Monitor](/docs/dce82a22-77ba-4133-90d9-78a0a1b88412)