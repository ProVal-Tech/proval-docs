---
id: 'cwa-diskpart-information-storage'
title: 'Disk Information Storage from Diskpart'
title_meta: 'Disk Information Storage from Diskpart'
keywords: ['disk', 'information', 'storage', 'diskpart', 'audit']
description: 'This document outlines the purpose and structure of storing information about disks gathered from diskpart, including dependencies and a detailed table of the plugin_proval_diskpart_style with explanations for each column.'
tags: ['database', 'disk-encryption', 'report', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores information about disks gathered from diskpart.

## Dependencies

@Audit Diskpart to Custom (Script)

## Table

#### plugin_proval_diskpart_style

| Column            | Type    | Explanation                                             |
|-------------------|---------|---------------------------------------------------------|
| ComputerID        | INT     | The ComputerID of the audited disk's agent.            |
| DiskID            | INT     | The ID of the audited disk.                             |
| UniqueID          | VARCHAR | The UID of the audited disk.                            |
| Number            | VARCHAR | The index number of the audited disk.                  |
| Model             | VARCHAR | The model number of the audited disk.                  |
| SerialNumber      | VARCHAR | The serial number of the audited disk.                 |
| PartitionStyle    | VARCHAR | The partition style of the audited disk (RAW, GPT, MBR, etc.) |
| OperationalStatus  | VARCHAR | Shows if the disk is offline/online/disconnected.      |
| HealthStatus      | VARCHAR | Shows the reported health of the audited disk.         |


