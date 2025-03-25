---
id: 'e7a826db-104c-4ebb-877f-b44e138067f9'
slug: /e7a826db-104c-4ebb-877f-b44e138067f9
title: 'pvl_odsync_status'
title_meta: 'pvl_odsync_status'
keywords: ['onedrive', 'sync', 'status', 'storage', 'information']
description: 'This document outlines the purpose and structure for storing OneDrive sync status information returned by the Get OneDrive Sync Status script. It includes details on dependencies, the relevant data table, and explanations for each column in the table.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

Stores the information returned by the [Get OneDrive Sync Status [DV]](<../scripts/Get OneDrive Sync Status DV.md>) script.

## Dependencies

[**EPM - Data Collection - Script - Get OneDrive Sync Status [DV]**](<../scripts/Get OneDrive Sync Status DV.md>)

## Tables

#### pvl_odsync_status

| Column          | Type     | Explanation                                     |
|-----------------|----------|-------------------------------------------------|
| computerid      | int      | Computer ID                                     |
| FolderPath      | varchar  | Full path to the OneDrive directory             |
| IsQuotaAvailable | int      | Is quota available?                             |
| QuotaLabel      | varchar  | Current usage status of quota                   |
| ScriptRunTime   | DateTime | Data collection time                            |
| SyncStatus      | varchar  | Current sync status of OneDrive                 |
| TotalQuota      | float    | Total size of the available quota (GB)         |
| UsedQuota       | float    | Amount of used quota (GB)                       |
| Username        | varchar  | Username                                        |


