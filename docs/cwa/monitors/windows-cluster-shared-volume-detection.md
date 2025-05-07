---
id: 'a0ee778f-854b-4c86-aa0f-192a09019fe3'
slug: /a0ee778f-854b-4c86-aa0f-192a09019fe3
title: 'Windows Cluster Shared Volume Detection'
title_meta: 'Windows Cluster Shared Volume Detection'
keywords: ['monitor', 'cluster', 'disk', 'space', 'alert']
description: 'This document outlines the implementation of a monitor that detects cluster volumes with low disk space, triggering alerts based on predefined thresholds. It includes details on suggested alert styles, configurations, and dependencies for effective monitoring.'
tags: ['cluster', 'disk', 'windows']
draft: false
unlisted: false
---

## Summary

This monitor will detect the cluster volumes where the cluster disk space is below 10% as an error and between 10-20% as a warning.

## Details

**Suggested "Limit to"**: Workstations, Windows Machines, etc.  
**Suggested Alert Style**: Once, Twice, etc.  
**Suggested Alert Template**: `△ CUSTOM - Execute Script - Windows Cluster Shared Volume`

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Check Value   | Comparator   | Interval | Result                |
|--------------|----------------|------------|---------------|--------------|----------|-----------------------|
| System       | 127.0.0.1     | Run File   | \<REDACTED\>  | State Based  | 3600     | \<Screenshot below\>  |

![Image](../../../static/img/docs/a0ee778f-854b-4c86-aa0f-192a09019fe3/image_1.png)

## Dependencies

[CWA Script - Windows Cluster Shared Volume [Autofix, Ticket]](/docs/0a795741-52b7-4de6-abc2-01b5add80f99)

## Target

Should be targeted to a Cluster Detected group.

![Image](../../../static/img/docs/a0ee778f-854b-4c86-aa0f-192a09019fe3/image_2.png)

## Implementation

Please follow the implementation document below to install this content:

- [Import - Remote Monitor - Windows Cluster Shared Volume Detection](/docs/2fee5750-3a75-4256-b1b6-fcf2b81dccd6)