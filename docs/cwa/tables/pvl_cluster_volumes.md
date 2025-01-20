---
id: '746629d0-d1de-4a90-840d-135cf1063776'
title: 'Hyper-V Cluster Disk Space Audit Report'
title_meta: 'Hyper-V Cluster Disk Space Audit Report'
keywords: ['hyperv', 'cluster', 'disk', 'audit', 'report']
description: 'This document provides an overview of the audit report for disk space on Hyper-V cluster servers, including details on cluster volumes and their respective sizes, free space, and usage statistics.'
tags: ['disk', 'hyper-v', 'performance', 'report']
draft: false
unlisted: false
---
## Purpose

The purpose of this table is to store the audit report of the cluster disk space on the hyperV cluster servers.

## Dependencies

[CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>)

## Tables

#### pvl_cluster_volumes

| Column        | Type     | Explanation                                                                                     |
|---------------|----------|-------------------------------------------------------------------------------------------------|
| Computerid    | INT      | The Computerid of the agent                                                                     |
| Cluster_Name  | VARCHAR  | The cluster name of cluster disks on the hyperV cluster server                                  |
| Cluster_Path  | VARCHAR  | The cluster path of the cluster disks on the hyperV cluster server                              |
| Size          | INT      | The cluster disk total size on the hyperV cluster server                                        |
| FreeSpace     | INT      | The cluster disk free space available on the hyperV cluster server                              |
| UsedSpace     | INT      | The cluster disk used space on the hyperV cluster server                                        |
| PercentFree   | INT      | The cluster disk available space in percent on the hyperV cluster server                        |
| ScriptRunTime | DATETIME | The script's last run date to show when the latest audit was done via the script [CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>) |













