---
id: '0aa84005-5627-496f-9f09-496ef916cff5'
slug: /0aa84005-5627-496f-9f09-496ef916cff5
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
| [View - (pvl_v_windows_version_metrics)](/docs/baeb3063-b28b-4eae-975d-e55af60c0466) | Script      | To import [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](/docs/d7413e1d-56f3-4790-9ae0-45d8a91fc16a) view.                                                                                       |
| [Table - (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) | Script      | To insert the latest version of [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) table.                                                              |
| [View - pvl_v_windows_version_metrics](/docs/d7413e1d-56f3-4790-9ae0-45d8a91fc16a) | View        | The purpose of this view is to serve the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics](/docs/998bc4c8-47ea-410d-8ef0-36491abbd96a) (Clientid = 0) and [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics - Client Filter](/docs/978846f2-c493-4e6b-8084-b8caf1e2a60e) (Clientid > 0) dataviews. |
| [Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) | Custom Table | This table is a manually updated table that displays Windows operating systems support end dates, build numbers, and their respective releases, if any.                                                                         |
| [Dataview - Windows 10 - 11 Version Metrics](/docs/998bc4c8-47ea-410d-8ef0-36491abbd96a) | Dataview    | Displays the number of Windows 10 and Windows 11 machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the total number of Windows 10 and Windows 11 devices. Several filters are available for this data. |
| [Dataview - Windows 10 - 11 Version Metrics - Client Filter](/docs/978846f2-c493-4e6b-8084-b8caf1e2a60e) | Dataview    | Displays the number of Windows 10 and Windows 11 machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the total number of Windows 10 and Windows 11 devices for each client. Several filters are available for this data. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)](/docs/baeb3063-b28b-4eae-975d-e55af60c0466) script.
- Execute the script against any machine in the environment. This will create the [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](/docs/d7413e1d-56f3-4790-9ae0-45d8a91fc16a) and update the [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) table.
- Import the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics](/docs/998bc4c8-47ea-410d-8ef0-36491abbd96a) dataview.
- Import the [SEC - Windows Patching - Dataview - Windows 10 - 11 Version Metrics - Client Filter](/docs/978846f2-c493-4e6b-8084-b8caf1e2a60e) dataview.
- Verify the presence of data in the dataview.
- Remove [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)](/docs/baeb3063-b28b-4eae-975d-e55af60c0466) and [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) as they are no longer needed.

## FAQ

**Q: What should I do if the dataviews are not displaying any data?**  
**A:** Open a RAWSQL monitor set and execute the following queries one after another to find your answer:  
- `SELECT * FROM [pvl_v_windows_version_metrics](/docs/baeb3063-b28b-4eae-975d-e55af60c0466);`  
- `SELECT * FROM [plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622);`
