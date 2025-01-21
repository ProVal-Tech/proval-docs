---
id: 'c8745cde-e56d-4ea5-b4ae-2e213c4e21d2'
title: 'plugin_proval_diskpart_style'
title_meta: 'plugin_proval_diskpart_style'
keywords: ['disk', 'information', 'storage', 'diskpart', 'audit']
description: 'This document outlines the purpose and structure of storing information about disks gathered from Diskpart, including dependencies and a detailed table of the plugin_proval_diskpart_style with explanations for each column.'
tags: ['database', 'disk-encryption', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores information about disks gathered from Diskpart.

## Dependencies

- @Audit Diskpart to Custom (Script)

## Table

### plugin_proval_diskpart_style

| Column             | Type    | Explanation                                             |
|--------------------|---------|--------------------------------------------------------|
| ComputerID         | INT     | The ComputerID of the audited disk's agent.           |
| DiskID             | INT     | The ID of the audited disk.                            |
| UniqueID           | VARCHAR | The UID of the audited disk.                           |
| Number             | VARCHAR | The index number of the audited disk.                 |
| Model              | VARCHAR | The model number of the audited disk.                 |
| SerialNumber       | VARCHAR | The serial number of the audited disk.                |
| PartitionStyle     | VARCHAR | The partition style of the audited disk (RAW, GPT, MBR, etc.) |
| OperationalStatus   | VARCHAR | Indicates if the disk is offline, online, or disconnected. |
| HealthStatus       | VARCHAR | Shows the reported health of the audited disk.        |



