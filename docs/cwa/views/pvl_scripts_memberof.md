---
id: 'cwa-base-table-for-dataview-scripts-memberof'
title: 'Base Table for CWM - Automate - Dataview - Scripts - MemberOf'
title_meta: 'Base Table for CWM - Automate - Dataview - Scripts - MemberOf'
keywords: ['dataview', 'scripts', 'automate', 'mysql', 'table']
description: 'This document serves as the base table for the CWM - Automate - Dataview - Scripts - MemberOf, detailing its dependencies, structure, and the specific columns that define its functionality within the ConnectWise Automate environment.'
tags: ['database', 'configuration', 'report']
draft: false
unlisted: false
---
## Purpose

Serves as base table for the [CWM - Automate - Dataview - Scripts - MemberOf](https://proval.itglue.com/DOC-5078775-10390968) dataview.

## Dependencies

[CWM - Automate - Script - MySQL - View - Create (pvl_scripts_memberof)*](https://proval.itglue.com/DOC-5078775-13700067)

## Tables

#### pvl_scripts_memberof

| Column               | Description                                                                                                       |
|----------------------|-------------------------------------------------------------------------------------------------------------------|
| Scriptid             | Id of the script.                                                                                                 |
| Script Name          | Name of the Script.                                                                                               |
| Object Name          | Name of the Object.                                                                                               |
| Object Type          | Type of the Object (group/Monitor/Alert Template/Individual Computer/Maintenance).                               |
| Object description    | Full Path of the Group/Whether the alert template is applied on a computer-level remote monitor group remote monitor or an internal monitor. |
| Limited to          | Whether the scheduled group script/remote monitor is limited to a search/internal monitor is limited to any group. |
| Affected Agents      | Number of computers in the group/Number of agents detected in the search if limited to search.                   |


