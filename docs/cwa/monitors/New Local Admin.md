---
id: 'cwa-remote-monitor-new-local-admin'
title: 'Remote Monitor for New Local Admin Detection'
title_meta: 'Remote Monitor for New Local Admin Detection'
keywords: ['monitor', 'local', 'admin', 'ticket', 'detection', 'windows', 'computers']
description: 'This document outlines the setup and implementation of a remote monitor designed to detect newly created or promoted local administrators on Windows computers. It details the necessary configurations, dependencies, and ticketing processes involved in managing alerts for local admin changes.'
tags: ['windows', 'monitoring', 'ticketing', 'configuration', 'security']
draft: false
unlisted: false
---
## Summary

The purpose of the remote monitor is to detect the newly created/promoted local admins and create a ticket. It uses the [EPM - User Management - Agnostic - Get-NewLocalAdmin](https://proval.itglue.com/DOC-5078775-14068833) agnostic script to perform the monitoring.

## Details

**Suggested "Limit to"**: Windows Computers excluding domain controllers `<All Computers Excluding Domain Controllers>`

**Suggested Alert Style**: Continuous

**Suggested Alert Template**: △ Custom - Ticket Creation Computer - Failures Only

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result |
|--------------|----------------|-------------|---------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | State Based | 3600     | ![Result](..\..\..\static\img\New-Local-Admin\image_1.png) |

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer [Failures Only]*](https://proval.itglue.com/DOC-5078775-13459854)

## Target

Managed Windows Workstations and Servers.

The monitor set should be limited to the `<All Computers Excluding Domain Controllers>` search.

![Target Image](..\..\..\static\img\New-Local-Admin\image_2.png)

## Implementation

Please follow the instructions provided in the implementation article to implement the solution: [Implement - Remote Monitor - New Local Admin](https://proval.itglue.com/DOC-5078775-14069154)

## Ticketing

**Subject:** `<code>New Local Admin Detected at <DomainName></code>`

**Body:**  

`New Local Admin(s) Detected at %COMPUTERNAME% for %CLIENTNAME%.`  
`<Newly Created Local Admin(s)>`

**Example:**  
![Example Image](..\..\..\static\img\New-Local-Admin\image_3.png)

**Automate will never close the ticket, instead, it will keep adding the new detections to the same ticket as a comment/note, unless the ticket is closed/resolved manually.**


