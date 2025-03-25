---
id: 'cbd9495c-f2a7-44f1-9f84-55cfa1ac1490'
slug: /cbd9495c-f2a7-44f1-9f84-55cfa1ac1490
title: 'Windows Cluster Volume Space Audit DV'
title_meta: 'Windows Cluster Volume Space Audit DV'
keywords: ['audit', 'cluster', 'report', 'disk', 'space', 'volume']
description: 'This document provides a detailed overview of a script designed to audit cluster group devices, focusing on maintaining a report of free space on cluster disks. It includes sample runs, dependencies, global parameters, user parameters, and expected outputs.'
tags: ['cluster', 'disk', 'report']
draft: false
unlisted: false
---

## Summary

This script is designed to perform an audit of the cluster group devices to maintain a report of the free space on the cluster disks.

## Sample Run

![Sample Run Image](../../../static/img/Windows-Cluster-Volume-Space-Audit-DV/image_1.png)

Set the value of `Set_Environment` to 1 to create the table and schedule the script every Monday at 4:30 AM agent time on the "_System Automation/Cluster Detected" group.

![Sample Run Image](../../../static/img/Windows-Cluster-Volume-Space-Audit-DV/image_2.png)

## Dependencies

[CWA Script - Windows Cluster Shared Volume](<./Windows Cluster Shared Volume Autofix,Ticket.md>)

#### Global Parameters

| Name      | Example              | Required | Description                                                                 |
|-----------|----------------------|----------|-----------------------------------------------------------------------------|
| TableName | pvl_cluster_volumes   | True     | This table stores the audit report of the cluster disks of the cluster servers. |

## User Parameters

| Name            | Example | Required | Description                                                                                                         |
|-----------------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| Set_Environment  | 1       | False    | Set to 1 to create the table and schedule the script every Monday at 4:30 AM agent time on the "_System Automation/Cluster Detected" group. |

## Output

- Script log
- Dataview


