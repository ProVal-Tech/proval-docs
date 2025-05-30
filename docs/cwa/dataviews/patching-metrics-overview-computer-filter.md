---
id: '7cf32e9b-c86b-4a97-ba5a-f97139cddf0e'
slug: /7cf32e9b-c86b-4a97-ba5a-f97139cddf0e
title: 'Patching Metrics Overview - Computer Filter'
title_meta: 'Patching Metrics Overview - Computer Filter'
keywords: ['patching', 'windows', 'statistics', 'approval', 'metrics']
description: 'This document provides an overview of patching-related statistics for Windows computers in the environment, categorized by the approval age of patches. It details the number of approved and missing patches for each approval age category, along with relevant computer and client information.'
tags: ['patching', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document displays patching-related statistics for each Windows computer in the environment. Data is presented with respect to the `Approval Age` of the patches. It will show five rows per computer, one row for each approval age category.

The approval age is divided into five categories:
- Less than 7 Days (≤ 7)
- Between 8 to 14 Days (8-14)
- Between 15 to 21 Days (15-21)
- Between 22 to 30 Days (22-30)
- More than 30 Days (> 30)

## Dependencies

[plugin_proval_v_patching_metrics_overview](/docs/2a7060e4-0b45-4246-a9ea-f39818cc93e8)

## Columns

| Column                | Description                                                                                       |
|----------------------|---------------------------------------------------------------------------------------------------|
| Client Name          | Client Name                                                                                       |
| Location Name        | Location Name                                                                                     |
| Computer Name        | Computer Name                                                                                     |
| Last Contact         | Last Contact with RMM                                                                             |
| Approval Age         | Approval age of the patch in days ('≤ 7', '8-14', '15-21', '22-30', '> 30')                     |
| Total Approved       | Number of patches approved within the respective approval age                                     |
| Total Missing        | Number of patches that are not installed                                                          |
| Patching Policy      | Patching Policy (Managed | Unmanaged)                                                             |
| Client ID            | Client ID (Hidden)                                                                                |
| Location ID          | Location ID (Hidden)                                                                              |
| Computer ID          | Computer ID (Hidden)                                                                              |
| Friendly Name        | Computer's Friendly Name stored under the Friendly Name EDF (Hidden)                             |
| Last User            | Last logged-in user (Hidden)                                                                      |
| Sort                 | A custom column to sort the data view in proper order (Hidden)                                   |
| Microsoft Patch Policy| Effective Patch Policy applied on the machine                                                     |
| Reboot Policy        | Effective Reboot Policy applied on the machine                                                    |

## Reference Tables

- computers c    
- clients cl   
- locations l   
- v_extradatacomputers ve   
- Plugin_ProVal_v_Patching_Metrics_Overview p   
- computerpatchpolicies cpp   
- InstallSoftwarePolicies isp   
- rebootpolicies rp