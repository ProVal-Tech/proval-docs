---
id: '6d2587d3-3839-4f53-92a7-89890936958d'
title: 'Drive Space Monitoring for Endpoints'
title_meta: 'Drive Space Monitoring for Endpoints'
keywords: ['monitoring', 'drive', 'space', 'endpoints', 'alert', 'thresholds']
description: 'This document provides an overview of a drive space monitoring solution for endpoints, detailing its configuration, dependencies, and default values for alert thresholds. It emphasizes the importance of scheduling for optimal performance and outlines the drive file systems excluded from monitoring.'
tags: ['disk']
draft: false
unlisted: false
---

## Summary

This monitor reviews drive space on endpoints and will alert based on the configured thresholds for the monitor.

**Note:** ProVal suggests reviewing the "Schedule" related to servers and how often they gather the Disk Inventory and Fragmentation scan. We recommend setting the "repeat every" value to \< 4 hours for the Disk Inventory and Fragmentation Scan.

## Dependencies

**System Properties:** "proval_DiskThreshold16-100", "proval_DiskThreshold100-1024", "proval_DiskThreshold1024+"

**NOTE:** The monitor will insert these properties if they are missing.

### Default Values:

| Name                               | Value                                                                                           |
|------------------------------------|-------------------------------------------------------------------------------------------------|
| proval_DiskThreshold16-100         | 10 (This value indicates 10% remaining disk space for drives between 16GB and 100GB)          |
| proval_DiskThreshold100-1024       | 30720 (This value indicates 30GB remaining disk space for drives between 100GB and 1TB)       |
| proval_DiskThreshold1024+          | 51200 (This value indicates 50GB remaining disk space for drives larger than 1TB)            |

## Target

This monitor is primarily designed for server drive space monitoring. It will function properly for drives on most systems.

The monitor filters out the following drive file systems: 'CDFS', 'UNKFS', 'DVDFS', 'FAT', 'FAT32', and 'NetFS'.

It also filters out drives where the SmartStatus is like USB, in an attempt to exclude USB drives.
