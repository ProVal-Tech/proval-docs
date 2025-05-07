---
id: '403cec59-3602-4630-afc8-674d1887046d'
slug: /403cec59-3602-4630-afc8-674d1887046d
title: 'Remote Monitor - HP Hardware Monitoring'
title_meta: 'Remote Monitor - HP Hardware Monitoring'
keywords: ['hp', 'monitor', 'event', 'server', 'management']
description: 'This document outlines the configuration and implementation details for a remote monitor that tracks specific event types and IDs from HP Server management software, ensuring effective monitoring of HP Servers.'
tags: ['ticketing']
draft: false
unlisted: false
---

## Summary

This remote monitor looks for several event types and IDs coming from the HP Server management software installed on the HP Servers.

**Notes:**

- **`HP(E) Insight Management Agents`** software should be installed on the server.
  - Pulls event logs generated only when this software is installed and running.

## Details

**Suggested "Limit to"**: HP Servers  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: `△ Custom - Ticket Creation - Computer [Failures Only]`

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator  | Interval | Result                                                                                                     |
| ------------ | -------------- | ---------- | ------------ | ----------- | -------- | ---------------------------------------------------------------------------------------------------------- |
| System       | 127.0.0.1      | Run File   | **REDACTED** | State Based | 3600     | ![Result](../../../static/img/docs/403cec59-3602-4630-afc8-674d1887046d/image_1.webp) |

## Target

Managed Servers (HP Servers only)  
![Target](../../../static/img/docs/403cec59-3602-4630-afc8-674d1887046d/image_2.webp)  
The monitor set should be limited to the `HP Servers` search.

## Implementation

[Implement - Remote Monitor - HP Hardware Monitoring](/docs/4e3fc053-3ccd-4262-b8e8-662222500e06)

## Ticketing

**Subject:** `HP Event Log Errors Detected on %CLIENTNAME%/%COMPUTERNAME%`  

**Body:** `HP Hardware Monitoring has detected an issue with %Computername% at %clientname%. The message details are outlined below:  
%RESULT%`