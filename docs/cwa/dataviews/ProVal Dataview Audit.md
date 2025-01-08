---
id: 'cwa_proval-dataviews-audit'
title: 'ProVal Dataviews Audit'
title_meta: 'ProVal Dataviews Audit - Sync Status Overview'
keywords: ['dataviews', 'proval', 'sync', 'plugin', 'audit']
description: 'This document provides an overview of all the dataviews located in the ProVal folder, detailing their synchronization status with the ProSync plugin. It includes a reference table, dependencies, and a sample screenshot for better understanding.'
tags: ['plugin', 'database', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

Lists all the dataviews which are in 'proval' folder. It depicts their sync status with ProSync plugin.

## Dependencies

plugin_prosync_dataviews

## Columns

| Column                       | Description                                    |
|------------------------------|------------------------------------------------|
| DataviewID                   | Dataview ID                                   |
| Dataview                     | Name of the dataview                          |
| GUID                         | Dataview GUID from dataviews table           |
| Synced In ProVal Plugin      | Is dataview synced with Prosync plugin or not |

## Reference Table

- plugin_prosync_dataviews
- dataviews
- dataviewfolders

## Sample Screenshot

[![Sample Screenshot](thumbnail/2023-02-10_09_00_37-ProVal_Dataview_Audit_Data_Summary.png)](large/2023-02-10_09_00_37-ProVal_Dataview_Audit_Data_Summary.png)

