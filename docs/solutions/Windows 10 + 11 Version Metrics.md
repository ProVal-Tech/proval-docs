---
id: '0aa84005-5627-496f-9f09-496ef916cff5'
title: 'Windows Version Metrics Solution'
title_meta: 'Windows Version Metrics Solution'
keywords: ['windows', 'metrics', 'dataview', 'support', 'patching']
description: 'This document outlines a solution for displaying well-calculated Windows version metrics with multiple filters. It includes implementation steps, associated content, and troubleshooting FAQs to ensure successful deployment and usage of the metrics solution.'
tags: ['windows', 'metrics', 'dataview', 'support', 'patching', 'database', 'report']
draft: false
unlisted: false
---
## Purpose

This solution displays a well-calculated version metrics with multiple filters.

## Associated Content

| Content                                                                 | Type        | Function                                                                                                                                                                                                                         |
|-------------------------------------------------------------------------|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [View - (pvl_v_windows_version_metrics)*](https://proval.itglue.com/DOC-5078775-11564063) | Script      | To import [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](https://proval.itglue.com/DOC-5078775-11560437) view                                                                                       |
| [Table - (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131) | Script      | To insert the latest version of [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) table.                                                              |
| [View - pvl_v_windows_version_metrics](https://proval.itglue.com/DOC-5078775-11560437) | View        | The purpose of this view is to serve the [SEC - Windows Patching - Dataview - Windows 10 -11 Version Metrics](https://proval.itglue.com/DOC-5078775-11560727) (Clientid = 0) and [SEC - Windows Patching - Dataview - Windows 10 -11 Version Metrics - Client Filter](https://proval.itglue.com/DOC-5078775-11560609) (Clientid > 0) dataviews. |
| [Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) | Custom Table | This table is a manually updated table that will display windows operating systems support end date, build number, and their respective Released if any.                                                                         |
| [Dataview - Windows 10 -11 Version Metrics](https://proval.itglue.com/DOC-5078775-11560727) | Dataview    | Displays the number of Windows 10 and Windows 11 Machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the number of total Windows 10 and Windows 11 devices. There are several filters available for this data. |
| [Dataview - Windows 10 -11 Version Metrics - Client Filter](https://proval.itglue.com/DOC-5078775-11560609) | Dataview    | Displays the number of Windows 10 and Windows 11 Machines by the build number (ReleaseID) as well as a calculated percentage of machines on that version against the number of total Windows 10 and Windows 11 devices for each client. There are several filters available for this data. |

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)*](https://proval.itglue.com/DOC-5078775-11564063) script.
- Execute the script against any machine in the environment. This will create the [SEC - Windows Patching - MySQL View - pvl_v_windows_version_metrics](https://proval.itglue.com/DOC-5078775-11560437), and update the [SEC - Windows Patching - Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) table.
- Import the [SEC - Windows Patching - Dataview - Windows 10 -11 Version Metrics](https://proval.itglue.com/DOC-5078775-11560727) dataview.
- Import the [SEC - Windows Patching - Dataview - Windows 10 -11 Version Metrics - Client Filter](https://proval.itglue.com/DOC-5078775-11560609) dataview.
- Verify the presence of data in the dataview.
- Remove [CWM - Automate - Script - MySQL - View - Create (pvl_v_windows_version_metrics)*](https://proval.itglue.com/DOC-5078775-11564063) and [CWM - Automate - Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131) as they are not needed anymore.

## FAQ

**Q: What to do if the dataviews are not displaying any data?**  
**A:** Open a RAWSQL monitor set and execute the following queries one after another and you will find your answer:  
- `SELECT * From [pvl_v_windows_version_metrics](https://proval.itglue.com/DOC-5078775-11564063);`  
- `SELECT * From [plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690);`






