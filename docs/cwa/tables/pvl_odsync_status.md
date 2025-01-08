---
id: 'cwa_onedrive_sync_status'
title: 'OneDrive Sync Status Information Storage'
title_meta: 'OneDrive Sync Status Information Storage'
keywords: ['onedrive', 'sync', 'status', 'storage', 'information']
description: 'This document outlines the purpose and structure for storing OneDrive sync status information returned by the Get OneDrive Sync Status script. It includes details on dependencies, the relevant data table, and explanations for each column in the table.'
tags: ['database', 'configuration', 'report', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores the information returned by the [Get OneDrive Sync Status [DV]](https://proval.itglue.com/DOC-5078775-16007800) script.

## Dependencies

[**EPM - Data Collection - Script - Get OneDrive Sync Status [DV]**](https://proval.itglue.com/DOC-5078775-16007800)

## Tables

#### pvl_odsync_status

| Column          | Type     | Explanation                                     |
|-----------------|----------|-------------------------------------------------|
| computerid      | int      | computerid                                      |
| FolderPath      | varchar  | Full Path to the OneDrive Directory             |
| IsQuotaAvailable | Int      | Is Quota Available?                             |
| QuotaLabel      | varchar  | Current usage status of quota.                  |
| ScriptRunTime   | DateTime | Data Collection Time                            |
| SyncStatus      | VarChar  | Current Sync status of OneDrive                 |
| TotalQuota      | float    | Total Size of the Available Quota (GB)         |
| UsedQuota       | float    | Amount of used Quota (GB)                       |
| Username        | varchar  | Username                                        |

