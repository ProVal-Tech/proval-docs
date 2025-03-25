---
id: '746629d0-d1de-4a90-840d-135cf1063776'
slug: /746629d0-d1de-4a90-840d-135cf1063776
title: 'pvl_cluster_volumes'
title_meta: 'pvl_cluster_volumes'
keywords: ['hyperv', 'cluster', 'disk', 'audit', 'report']
description: 'This document provides an overview of the audit report for disk space on Hyper-V cluster servers, including details on cluster volumes and their respective sizes, free space, and usage statistics.'
tags: ['disk', 'hyper-v', 'performance', 'report']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to store the audit report of the cluster disk space on the Hyper-V cluster servers.

## Dependencies

[CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>)

## Tables

#### pvl_cluster_volumes

| Column        | Type     | Explanation                                                                                     |
|---------------|----------|-------------------------------------------------------------------------------------------------|
| Computerid    | INT      | The Computer ID of the agent                                                                     |
| Cluster_Name  | VARCHAR  | The cluster name of the cluster disks on the Hyper-V cluster server                              |
| Cluster_Path  | VARCHAR  | The cluster path of the cluster disks on the Hyper-V cluster server                              |
| Size          | INT      | The total size of the cluster disk on the Hyper-V cluster server                                  |
| FreeSpace     | INT      | The available free space on the cluster disk in the Hyper-V cluster server                       |
| UsedSpace     | INT      | The used space on the cluster disk in the Hyper-V cluster server                                  |
| PercentFree   | INT      | The available space on the cluster disk expressed as a percentage in the Hyper-V cluster server  |
| ScriptRunTime | DATETIME | The script's last run date, indicating when the latest audit was performed via the script [CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>) |


