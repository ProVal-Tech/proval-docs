---
id: 'cwa-patching-metrics-overview'
title: 'Patching Metrics Overview for Windows Computers'
title_meta: 'Patching Metrics Overview for Windows Computers'
keywords: ['patching', 'windows', 'clients', 'approval', 'metrics']
description: 'This document provides an overview of patching-related statistics for patch-managed Windows computers across various clients, categorized by approval age of patches. It includes detailed metrics such as total approved and missing patches for both servers and workstations, helping to assess the patching status and compliance within the environment.'
tags: ['patching', 'windows', 'clients', 'approval', 'metrics', 'servers', 'workstations']
draft: false
unlisted: false
---
## Summary

Present the fundamental patching-related statistics for the patch-managed windows computer for each client in the environment. Data is displayed w.r.t the `Approval age` of the patches. It will show five rows per client, i.e., one row per Approval age category.

The approval age is divided into five categories:
- Less than 7 Days (<= 7)
- Between 8 to 14 Days (8-14)
- Between 15 to 21 Days (15-21)
- Between 22 to 30 Days (22-30)
- More than 30 Days (> 30)

The SQL query filters the results for the Patch Managed computers only, removing the `j.Patching Policy = 'Managed'` from the `SQLWhere` dataview will also show the data for the Unmanaged windows machines.

## Dependencies

[plugin_proval_v_patching_metrics_overview](https://proval.itglue.com/DOC-5078775-11915163)

## Columns

| Column                     | Description                                                                                                                                              |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                     | Client Name                                                                                                                                             |
| ApproVal Age               | Approval age of the patches in days ('<= 7', '8-14', '15-22', '22-30', '> 30')                                                                        |
| Total Approved             | Number of patches approved between the respective Approval Age for the client                                                                          |
| Total Missing              | Number of approved patches that aren't installed for the client                                                                                       |
| Total Approved Servers     | Number of patches approved between the respective Approval Age for the Servers of the client                                                            |
| Total Missing Servers      | Number of approved patches that aren't installed for the servers of the client                                                                         |
| Missing Per Server         | Average number of missing patches per server for the client                                                                                           |
| Total Approved Workstations | Number of patches approved between the respective Approval Age for the Workstations of the client                                                      |
| Total Missing Workstations  | Number of approved patches that aren't installed for the Workstations of the client                                                                    |
| Missing Per Workstation    | Average number of missing patches per workstation for the client                                                                                       |
| Patching Policy            | Patching Policy (Managed | UnManaged). (By Default the dataview will display the data for the Patch managed computers only)                                 |
| Clientid                  | Clientid (Hidden)                                                                                                                                     |
| sort                       | A custom column to sort the dataview in proper order (Hidden)                                                                                         |

## Sample Screenshot

[![Patching Metrics Overview - Client Filter Data Summary](thumbnail/2023-01-21_01_13_14-Patching_Metrics_Overview_-_Client_Filter_Data_Summary.png)](large/2023-01-21_01_13_14-Patching_Metrics_Overview_-_Client_Filter_Data_Summary.png)




