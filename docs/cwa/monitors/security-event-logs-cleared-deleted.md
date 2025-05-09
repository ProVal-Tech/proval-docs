---
id: '0f6e6262-6a9f-4edf-ab23-1522543de7e2'
slug: /0f6e6262-6a9f-4edf-ab23-1522543de7e2
title: 'Security event logs cleared/deleted'
title_meta: 'Security event logs cleared/deleted'
keywords: ['security', 'event', 'monitor', 'alert', 'windows']
description: 'This document outlines the setup and configuration of a Remote Monitor that alerts users when security events, specifically event 1102, are deleted or cleared within the last 15 minutes. It includes implementation details, dependencies, and ticketing information for effective monitoring.'
tags: ['security', 'ticketing', 'windows']
draft: false
unlisted: false
---

## Summary

This Remote Monitor will alert if security events were deleted or cleared in the last 15 minutes, specifically looking for security event 1102. The remote monitor should be set to run at an interval of less than or equal to 15 minutes.

Event 1102 is logged whenever the **Security log is cleared**, regardless of the status of the Audit System Events audit policy. The Account Name and Domain Name fields identify the user who cleared the log.

**Note:** If the computer's PowerShell version is older than 5, the monitor set may not function properly.

## Details

**Suggested "Limit to":** All  
**Suggested Alert Style:** Continuous  
**Suggested Alert Template:** △ Custom - Ticket Creation Computer - Failures Only  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval | Result                |
|--------------|----------------|------------|---------------|------------|----------|-----------------------|
| System       | Default        | Run File   | **REDACTED**      | State Based | 900      | \<Screenshot Below\>  |

![Screenshot](../../../static/img/docs/0f6e6262-6a9f-4edf-ab23-1522543de7e2/image_1.webp)

## Dependencies

[CWM - Automate - Script - Ticket Creation - Computer (Failures Only)](/docs/e14bf501-f10d-44d7-a19a-2284fd5c5cc9)

## Target

Windows Computers

## Ticketing

**Subject:** `Security Event Log Cleared on %CLIENTNAME%\%COMPUTERNAME%`
**Ticket Summary:** `Security Event logs cleared/deleted for %CLIENTNAME%\%COMPUTERNAME%: %Result%`

## Implementation

[Import - Remote Monitor - Security event logs cleared/deleted](/docs/5e1d98fb-913a-4384-9674-653c57bf610b)