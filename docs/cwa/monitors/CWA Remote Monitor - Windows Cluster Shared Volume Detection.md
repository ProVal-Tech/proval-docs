---
id: 'cwa-windows-cluster-shared-volume-detection'
title: 'Windows Cluster Shared Volume Detection'
title_meta: 'Windows Cluster Shared Volume Detection'
keywords: ['monitor', 'cluster', 'disk', 'space', 'alert']
description: 'This document outlines the implementation of a monitor that detects cluster volumes with low disk space, triggering alerts based on predefined thresholds. It includes details on suggested alert styles, configurations, and dependencies for effective monitoring.'
tags: ['monitoring', 'disk', 'alert', 'windows', 'cluster', 'configuration']
draft: false
unlisted: false
---
## Summary

This monitor will detect the cluster volumes where the cluster disk space is below 10% as an error and between 10-20% as a warning.

## Details

**Suggested "Limit to"**: Workstations, Windows Machines, etc.  
**Suggested Alert Style**: Once, Twice, etc.  
**Suggested Alert Template**: `△ CUSTOM - Execute Script - Windows Cluster Shared Volume`

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Check Value | Comparator | Interval | Result |
|--------------|----------------|------------|-------------|------------|----------|--------|
| System       | 127.0.0.1     | Run File   | <REDACTED>  | State Based | 3600     | <Screenshot below> |

![Image](..\..\..\static\img\CWA-Remote-Monitor---Windows-Cluster-Shared-Volume-Detection\image_1.png)

## Dependencies

[CWA Script - Windows Cluster Shared Volume [Autofix, Ticket]](https://proval.itglue.com/DOC-5078775-15952795)

## Target

Should be targeted to a Cluster Detected group.

![Image](..\..\..\static\img\CWA-Remote-Monitor---Windows-Cluster-Shared-Volume-Detection\image_2.png)

## Implementation

Please follow the below implementation document to install this content:

- [Import - Remote Monitor - Windows Cluster Shared Volume Detection](https://proval.itglue.com/DOC-5078775-15952816)


