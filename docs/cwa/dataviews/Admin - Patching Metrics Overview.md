---
id: 'aecfbacc-1c55-4a98-8cc3-7a1b753621ed'
title: 'Patching Metrics Overview for Windows Computers'
title_meta: 'Patching Metrics Overview for Windows Computers'
keywords: ['patching', 'windows', 'approval', 'metrics', 'statistics']
description: 'This document provides a comprehensive overview of the patching-related statistics for patch-managed Windows computers, categorized by approval age. It includes details on approved and missing patches across different age groups, as well as breakdowns for servers and workstations.'
tags: ['database', 'patching', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document presents the fundamental patching-related statistics for the patch-managed Windows computers in the environment. Data is displayed with respect to the `Approval Age` of the patches. It will show five rows, with one row per approval age category.

The approval age is divided into five categories:

- Less than 7 Days (≤ 7)
- Between 8 to 14 Days (8-14)
- Between 15 to 21 Days (15-21)
- Between 22 to 30 Days (22-30)
- More than 30 Days (> 30)

The SQL query filters the results for the patch-managed computers only. Removing `j.Patching Policy = 'Managed'` from the `SQLWhere` dataview will also show data for the unmanaged Windows machines.

## Dependencies

[plugin_proval_v_patching_metrics_overview](<../views/plugin_proval_v_patching_metrics_overview.md>)

## Columns

| Column                     | Description                                                                                                          |
|---------------------------|----------------------------------------------------------------------------------------------------------------------|
| Approval Age              | Approval age of the patches in days ('≤ 7', '8-14', '15-21', '22-30', '> 30')                                    |
| Total Approved            | Number of patches approved within the respective approval age for the whole environment                             |
| Total Missing             | Number of approved patches that aren't installed                                                                     |
| Total Approved Servers     | Number of patches approved within the respective approval age for all the servers                                   |
| Total Missing Servers      | Number of approved patches that aren't installed for the servers                                                    |
| Missing Per Server        | Average number of missing patches per server                                                                         |
| Total Approved Workstations | Number of patches approved within the respective approval age for the workstations                                  |
| Total Missing Workstations  | Number of approved patches that aren't installed for the workstations                                               |
| Missing Per Workstation    | Average number of missing patches per workstation                                                                   |
| Patching Policy           | Patching Policy (Managed | Unmanaged). By default, the dataview will display the data for the patch-managed computers only |
| Sort                      | A custom column to sort the dataview in proper order (Hidden)                                                      |

