---
id: 'a6c25db7-fd79-4ed6-9f84-765cd2d10362'
title: 'RSM - Active Directory- New Domain Admin'
title_meta: 'RSM - Active Directory- New Domain Admin'
keywords: ['monitor', 'domain', 'admin', 'ticket', 'automation']
description: 'This document outlines the setup and implementation of a remote monitor designed to detect newly created or promoted domain admins. It details the configuration of alerts, dependencies, and ticketing processes to ensure effective monitoring and incident response.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

The purpose of the remote monitor is to detect newly created or promoted domain admins and create a ticket. It uses the [EPM - User Management - Agnostic - Get-NewDomainAdmin](<../../powershell/Get-NewDomainAdmin.md>) agnostic script to perform the monitoring.

## Details

**Suggested "Limit to"**: Primary Domain Controllers of Each Domain `\\<Distinct Domain Controller Per Client>`  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: △ Custom - Ticket Creation Computer - Failures Only  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based | 3600     | ![Result](../../../static/img/RSM---Active-Directory--New-Domain-Admin/image_1.png) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer [Failures Only]](<../scripts/Ticket Creation - Computer Failures Only.md>)

## Target

Domain Controllers  
![Target](../../../static/img/RSM---Active-Directory--New-Domain-Admin/image_2.png)

The monitor set should be limited to the `Distinct Domain Controller Per Client` search.  
![Search](../../../static/img/RSM---Active-Directory--New-Domain-Admin/image_3.png)

This search will create the remote monitor on a single domain controller for each domain.

## Implementation

Please follow the instructions provided in the implementation article to implement the solution:  
[Implement - Remote Monitor - New Domain Admin](<./New Domain Admin.md>)

## Ticketing

**Subject:** `New Domain Admin Detected at \\<DomainName>`

**Body:**  
```
New Domain Admin(s) Detected at %domain% for %clientname%.
<Newly Created Domain Admin(s)>
```

**Example:**  
![Example](../../../static/img/RSM---Active-Directory--New-Domain-Admin/image_4.png)

**Automate will never close the ticket; instead, it will keep adding new detections to the same ticket as a comment/note unless the ticket is closed/resolved manually.**


