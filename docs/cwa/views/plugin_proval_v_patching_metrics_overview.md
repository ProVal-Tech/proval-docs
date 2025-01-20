---
id: '2a7060e4-0b45-4246-a9ea-f39818cc93e8'
title: 'Patching Metrics Overview'
title_meta: 'Patching Metrics Overview'
keywords: ['patching', 'metrics', 'mysql', 'dataview', 'overview']
description: 'This document provides a comprehensive overview of the Patching Metrics, including dependencies, required tables, and a sample screenshot for reference. It outlines the minimum requirements for MySQL and details the structure of the relevant database table used for patching metrics.'
tags: ['database', 'performance', 'report', 'setup']
draft: false
unlisted: false
---
## Purpose

Baseline for the following dataviews:

- [Patching Metrics Overview](<../dataviews/Admin - Patching Metrics Overview.md>)
- [Patching Metrics Overview - Client Filter](<../dataviews/Patching Metrics Overview - Client Filter.md>)
- [Patching Metrics Overview - Computer Filter](<../dataviews/Patching Metrics Overview - Computer Filter.md>)

Minimum Requirement: MySQL 5.7.7

## Dependencies

- [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](<../scripts/MySQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview.md>)

## Tables

### plugin_proval_v_patching_metrics_overview

| Column         | Type         | Explanation                                                                                  |
|----------------|--------------|----------------------------------------------------------------------------------------------|
| Clientid       | int (11)     | Clientid                                                                                     |
| Computerid     | int (11)     | Computerid                                                                                   |
| locationid     | int (11)     | Computerid                                                                                   |
| os             | varchar (100)| Operating System                                                                             |
| ApproVal Age   | varchar (5)  | Approval Age in days of the patch ('\<= 7', '8-14', '15-22', '22-30', '> 30')               |
| Total Approved  | decimal (23,0)| Number of patches approved between the respective Approval Age                               |
| Total Missing   | decimal (23,0)| Number of approved patches that aren't installed                                             |
| Patching Policy | varchar (9)  | Patching Policy (Managed | Unmanaged)                                                       |

