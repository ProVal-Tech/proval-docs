---
id: 'cwa-patching-metrics-overview'
title: 'Patching Metrics Overview for Windows Computers'
title_meta: 'Patching Metrics Overview for Windows Computers'
keywords: ['patching', 'windows', 'statistics', 'approval', 'metrics']
description: 'This document provides an overview of patching-related statistics for Windows computers in the environment, categorized by approval age of patches. It details the number of approved and missing patches for each approval age category, along with relevant computer and client information.'
tags: ['windows', 'patching', 'report', 'performance', 'configuration']
draft: false
unlisted: false
---
## Summary

Displays patching-related statistics for each Windows computer in the environment. Data is displayed w.r.t the `Approval age` of the patches. It will show five rows per computer, i.e., one row per Approval age category.

The approval age is divided into five categories:
- Less than 7 Days (<= 7)
- Between 8 to 14 Days (8-14)
- Between 15 to 21 Days (15-21)
- Between 22 to 30 Days (22-30)
- More than 30 Days (> 30)

## Dependencies

[plugin_proval_v_patching_metrics_overview](https://proval.itglue.com/DOC-5078775-11915163)

## Columns

| Column                | Description                                                                                       |
|----------------------|---------------------------------------------------------------------------------------------------|
| Client Name          | Client Name                                                                                       |
| Location Name        | Location Name                                                                                     |
| Computer Name        | Computer Name                                                                                     |
| Last Contact         | Last Contact with RMM                                                                             |
| Approval Age         | Approval age of the patch in days ('<= 7', '8-14', '15-22', '22-30', '> 30')                   |
| Total Approved       | Number of patches approved between the respective Approval Age                                     |
| Total Missing        | Number of patches that aren't installed                                                            |
| Patching Policy      | Patching Policy (Managed | Unmanaged)                                                             |
| Clientid             | Clientid (Hidden)                                                                                 |
| Locationid           | Locationid (Hidden)                                                                               |
| Computerid           | Computerid (Hidden)                                                                               |
| Friendly Name        | Computer's Friendly Name Stored under the Friendly Name EDF (Hidden)                             |
| Last User            | Last Logged in user (Hidden)                                                                      |
| Sort                 | A custom column to sort the dataview in proper order (Hidden)                                    |
| Microsoft Patch Policy| Effective Patch Policy applied on Machine                                                          |
| Reboot Policy        | Effective Reboot Policy applied on Machine                                                         |

## Reference Tables

- computers c    
- clients cl   
- locations l   
- v_extradatacomputers ve   
- Plugin_ProVal_v_Patching_Metrics_Overview p   
- computerpatchpolicies cpp   
- InstallSoftwarePolicies isp   
- rebootpolicies rp

## Sample Screenshot

[![Sample Screenshot](thumbnail/2023-01-21_00_44_23-Patching_Metrics_Overview_-_Computer_Filter_Data_Summary.png)](large/2023-01-21_00_44_23-Patching_Metrics_Overview_-_Computer_Filter_Data_Summary.png)




