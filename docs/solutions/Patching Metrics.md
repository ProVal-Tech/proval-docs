---
id: 'e2d2f876-2e03-4d97-b0a1-eb17b666aad2'
slug: /e2d2f876-2e03-4d97-b0a1-eb17b666aad2
title: 'Patching Metrics'
title_meta: 'Patching Metrics'
keywords: ['patching', 'metrics', 'mysql', 'dataview', 'overview', 'client', 'computer']
description: 'This document provides a comprehensive overview of patching-related statistics across the entire environment, including details for clients and computers based on various patch approval ages. It outlines the minimum requirements, associated content, implementation steps, and frequently asked questions to ensure effective patch management.'
tags: ['database', 'performance', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

To granularly present the fundamental patching-related statistics for the whole environment, clients, and computers scattered throughout various patch approval ages.

**Minimum Requirement:** MySQL 5.7.7

## Associated Content

| Content                                                                                     | Type     | Function                                                              |
|---------------------------------------------------------------------------------------------|----------|-----------------------------------------------------------------------|
| [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview.md>) | Script   | Imports the [plugin_proval_v_patching_metrics_overview](<../cwa/views/plugin_proval_v_patching_metrics_overview.md>) view. |
| [plugin_proval_v_patching_metrics_overview](<../cwa/views/plugin_proval_v_patching_metrics_overview.md>) | View     | Baseline for the dataviews.                                         |
| [Patching Metrics Overview](<../cwa/dataviews/Admin - Patching Metrics Overview.md>)                | Dataview | Displays the consolidated statistics for the whole environment.      |
| [Patching Metrics Overview - Client Filter](<../cwa/dataviews/Patching Metrics Overview - Client Filter.md>) | Dataview | Displays the statistics for each client.                             |
| [Patching Metrics Overview - Computer Filter](<../cwa/dataviews/Patching Metrics Overview - Computer Filter.md>) | Dataview | Displays the statistics for each computer.                           |

## Implementation

- Import the [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview.md>) script.
- Import the [Patching Metrics Overview](<../cwa/dataviews/Admin - Patching Metrics Overview.md>) dataview.
- Import the [Patching Metrics Overview - Client Filter](<../cwa/dataviews/Patching Metrics Overview - Client Filter.md>) dataview.
- Import the [Patching Metrics Overview - Computer Filter](<../cwa/dataviews/Patching Metrics Overview - Computer Filter.md>) dataview.
- Debug the [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview.md>) script against any computer and ensure that the dataviews are populated with the data.

## FAQ

**Q:** The [MYSQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview*](<../cwa/scripts/MySQL - View - Create - Plugin_ProVal_v_Patching_Metrics_Overview.md>) script is failing.  
**A:** Please ensure that the minimum requirement is met and that the MySQL version is at least **5.7.7.**  

You can check the database version from the `Server Status` in Control Center.  

![Image1](../../static/img/Patching-Metrics/image_1.png)  
![Image2](../../static/img/Patching-Metrics/image_2.png)


