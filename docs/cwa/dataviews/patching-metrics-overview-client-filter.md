---
id: 'e8b825c2-919d-4b92-a94a-8d9e01d48428'
slug: /e8b825c2-919d-4b92-a94a-8d9e01d48428
title: 'Patching Metrics Overview - Client Filter'
title_meta: 'Patching Metrics Overview - Client Filter'
keywords: ['patching', 'windows', 'clients', 'approval', 'metrics']
description: 'This document provides an overview of patching-related statistics for patch-managed Windows computers across various clients, categorized by the approval age of patches. It includes detailed metrics such as total approved and missing patches for both servers and workstations, helping to assess the patching status and compliance within the environment.'
tags: ['patching', 'windows']
draft: false
unlisted: false
---

## Summary

This document presents fundamental patching-related statistics for patch-managed Windows computers for each client in the environment. Data is displayed with respect to the `Approval Age` of the patches. It will show five rows per client, with one row per approval age category.

The approval age is divided into five categories:
- Less than 7 Days (≤ 7)
- Between 8 to 14 Days (8-14)
- Between 15 to 21 Days (15-21)
- Between 22 to 30 Days (22-30)
- More than 30 Days (> 30)

The SQL query filters the results for the patch-managed computers only. Removing the `j.Patching Policy = 'Managed'` from the `SQLWhere` dataview will also show data for the unmanaged Windows machines.

## Dependencies

[plugin_proval_v_patching_metrics_overview](/docs/2a7060e4-0b45-4246-a9ea-f39818cc93e8)

## Columns

| Column                     | Description                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                     | Client Name                                                                                                                                             |
| Approval Age               | Approval age of the patches in days ('≤ 7', '8-14', '15-21', '22-30', '> 30')                                                                          |
| Total Approved             | Number of patches approved within the respective approval age for the client                                                                          |
| Total Missing              | Number of approved patches that aren't installed for the client                                                                                       |
| Total Approved Servers     | Number of patches approved within the respective approval age for the servers of the client                                                            |
| Total Missing Servers      | Number of approved patches that aren't installed for the servers of the client                                                                         |
| Missing Per Server         | Average number of missing patches per server for the client                                                                                           |
| Total Approved Workstations | Number of patches approved within the respective approval age for the workstations of the client                                                      |
| Total Missing Workstations  | Number of approved patches that aren't installed for the workstations of the client                                                                    |
| Missing Per Workstation    | Average number of missing patches per workstation for the client                                                                                       |
| Patching Policy            | Patching Policy (Managed | Unmanaged). By default, the dataview will display data for the patch-managed computers only.                                     |
| Client ID                  | Client ID (Hidden)                                                                                                                                     |
| Sort                       | A custom column to sort the dataview in proper order (Hidden)                                                                                         |

