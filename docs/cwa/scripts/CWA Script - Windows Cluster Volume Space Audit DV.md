---
id: 'cwa-cluster-audit-report'
title: 'Cluster Group Devices Audit Report'
title_meta: 'Cluster Group Devices Audit Report'
keywords: ['audit', 'cluster', 'report', 'disk', 'space', 'volume']
description: 'This document provides a detailed overview of a script designed to audit cluster group devices, focusing on maintaining a report of free space on cluster disks. It includes sample runs, dependencies, global parameters, user parameters, and expected outputs.'
tags: ['cluster', 'report', 'disk', 'volume', 'schedule', 'log']
draft: false
unlisted: false
---
## Summary

This script is created to perform the audit of the Cluster group devices to maintain a report of the space free at the cluster disks.

## Sample Run

![Sample Run Image](5078775/docs/15952791/images/23480956)

Set the value of `Set_Environment` to 1, to create the table and schedule the script every Monday at 4:30 AM agent time on the "_System Automation\Cluster Detected" group.

![Sample Run Image](5078775/docs/15952791/images/23480960)

## Dependencies

[CWA Script - Windows Cluster Shared Volume](https://proval.itglue.com/DOC-5078775-15952795)

#### Global Parameters

| Name       | Example              | Required | Description                                                                 |
|------------|----------------------|----------|-----------------------------------------------------------------------------|
| TableName  | pvl_cluster_volumes   | True     | This table stores the audit report of the cluster disks of the cluster servers. |

## User Parameters

| Name             | Example | Required | Description                                                                                                         |
|------------------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| Set_Environment   | 1       | False    | Set to 1, to create the table and schedule the script every Monday at 4:30 AM agent time on the "_System Automation\Cluster Detected" group. |

## Output

- Script log
- Dataview

