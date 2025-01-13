---
id: 'cwa-reset-system-restore-disk-space-usage'
title: 'Reset System Restore Disk Space Usage'
title_meta: 'Reset System Restore Disk Space Usage'
keywords: ['vss', 'disk', 'space', 'monitor', 'alert']
description: 'This document outlines a remote monitor designed to detect and limit the maximum space allocated to Volume Shadow Copy Service (VSS) on Windows OS. It provides details on suggested settings for alerts and a table for implementation specifics.'
tags: ['windows', 'monitoring', 'alert', 'configuration', 'performance']
draft: false
unlisted: false
---
## Summary

The purpose of this remote monitor is to detect the maximum space allocated to VSS. If it is more than 25% of the drive space, it will limit the maximum space to 5%.

## Details

**Suggested "Limit to"**: windows OS  
**Suggested Alert Style**: Continuous  
**Suggested Alert Template**: △ Custom - Ticket Creation Computer  

Insert the details of the monitor in the below table.

| Check Action | Server Address | Check Type | Execute Info | Comparator   | Interval | Result                                             |
|--------------|----------------|------------|---------------|--------------|----------|---------------------------------------------------|
| System       | 127.0.0.1     | Run File   | **REDACTED**  | State Based  | 21600    | ![Result](..\..\..\static\img\Reset-System-Restore-Disk-Space-Usage\image_1.png) |

## Target

Windows OS

## How To Import

[Implement - Remote Monitor - Reset System Restore Disk Space Usage](https://proval.itglue.com/DOC-5078775-13977211)



