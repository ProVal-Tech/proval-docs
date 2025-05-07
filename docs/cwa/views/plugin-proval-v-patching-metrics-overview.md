---
id: '2a7060e4-0b45-4246-a9ea-f39818cc93e8'
slug: /2a7060e4-0b45-4246-a9ea-f39818cc93e8
title: 'plugin_proval_v_patching_metrics_overview'
title_meta: 'plugin_proval_v_patching_metrics_overview'
keywords: ['patching', 'metrics', 'mysql', 'dataview', 'overview']
description: 'This document provides a comprehensive overview of the Patching Metrics, including dependencies, required tables, and a sample screenshot for reference. It outlines the minimum requirements for MySQL and details the structure of the relevant database table used for patching metrics.'
tags: ['database', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

Baseline for the following dataviews:

- [Patching Metrics Overview](/docs/aecfbacc-1c55-4a98-8cc3-7a1b753621ed)
- [Patching Metrics Overview - Client Filter](/docs/e8b825c2-919d-4b92-a94a-8d9e01d48428)
- [Patching Metrics Overview - Computer Filter](/docs/7cf32e9b-c86b-4a97-ba5a-f97139cddf0e)

Minimum Requirement: MySQL 5.7.7

## Dependencies

- [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](/docs/9aa26b60-2171-43e5-bb14-8bf274a237a4)

## Tables

### plugin_proval_v_patching_metrics_overview

| Column          | Type          | Explanation                                                                                  |
|-----------------|---------------|----------------------------------------------------------------------------------------------|
| Clientid        | int (11)      | Client ID                                                                                    |
| Computerid      | int (11)      | Computer ID                                                                                  |
| Locationid      | int (11)      | Location ID                                                                                  |
| OS              | varchar (100) | Operating System                                                                              |
| ApproVal Age    | varchar (5)   | Approval Age in days of the patch ('\<= 7', '8-14', '15-22', '22-30', '> 30')               |
| Total Approved   | decimal (23,0)| Number of patches approved between the respective Approval Age                               |
| Total Missing    | decimal (23,0)| Number of approved patches that aren't installed                                             |
| Patching Policy  | varchar (9)   | Patching Policy (Managed | Unmanaged)                                                       |


