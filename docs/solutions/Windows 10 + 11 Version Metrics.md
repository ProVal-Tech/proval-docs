---
id: '0aa84005-5627-496f-9f09-496ef916cff5'
title: 'Windows 10 + 11 Version Metrics'
title_meta: 'Windows 10 + 11 Version Metrics'
keywords: ['windows', 'metrics', 'dataview', 'support', 'patching']
description: 'This document outlines a solution for displaying well-calculated Windows version metrics with multiple filters. It includes implementation steps, associated content, and troubleshooting FAQs to ensure successful deployment and usage of the metrics solution.'
tags: ['database', 'patching', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution displays well-calculated version metrics with multiple filters.

## Associated Content

| Content                                                                 | Type        | Function                                                                                                                                                                                                                         |
|-------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [View - (pvl_v_windows_version_metrics)](<../cwa/scripts/MySQL - View - Create (pvl_v_windows_version_metrics).md>) | Script      | To import [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](<../cwa/dataviews/SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics.md>) view.                                                                                       |
| [Table - (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>) | Script      | To insert the latest version of [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) table.                                                              |
| [View - pvl_v_windows_version_metrics](<../cwa/dataviews/SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics.md>) | View        | The purpose of this view is to serve the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics](<../cwa/dataviews/Windows 10 - 11 Version Metrics.md>) (Clientid = 0) and [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics - Client Filter](<../cwa/dataviews/Windows 10 - 11 Version Metrics - Client Filter.md>) (Clientid > 0) dataviews. |
| [Table - plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) | Custom Table | This table is a manually updated table that displays Windows operating systems support end dates, build numbers, and their respective releases, if any.                                                                         |
| [Dataview - Windows 10 - 11 Version Metrics](<../cwa/dataviews/Windows 10 - 11 Version Metrics.md>) | Dataview    | Displays the number of Windows 10 and Windows 11 machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the total number of Windows 10 and Windows 11 devices. Several filters are available for this data. |
| [Dataview - Windows 10 - 11 Version Metrics - Client Filter](<../cwa/dataviews/Windows 10 - 11 Version Metrics - Client Filter.md>) | Dataview    | Displays the number of Windows 10 and Windows 11 machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the total number of Windows 10 and Windows 11 devices for each client. Several filters are available for this data. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)](<../cwa/scripts/MySQL - View - Create (pvl_v_windows_version_metrics).md>) script.
- Execute the script against any machine in the environment. This will create the [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](<../cwa/dataviews/SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics.md>) and update the [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) table.
- Import the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics](<../cwa/dataviews/Windows 10 - 11 Version Metrics.md>) dataview.
- Import the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics - Client Filter](<../cwa/dataviews/Windows 10 - 11 Version Metrics - Client Filter.md>) dataview.
- Verify the presence of data in the dataview.
- Remove [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)](<../cwa/scripts/MySQL - View - Create (pvl_v_windows_version_metrics).md>) and [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>) as they are no longer needed.

## FAQ

**Q: What should I do if the dataviews are not displaying any data?**  
**A:** Open a RAWSQL monitor set and execute the following queries one after another to find your answer:  
- `SELECT * FROM [pvl_v_windows_version_metrics](<../cwa/scripts/MySQL - View - Create (pvl_v_windows_version_metrics).md>);`  
- `SELECT * FROM [plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>);`



