---
id: '5b888c11-49da-4fea-9bda-9bffdfbb286d'
title: 'Base Table for CWM - Automate - Dataview - Scripts - MemberOf'
title_meta: 'Base Table for CWM - Automate - Dataview - Scripts - MemberOf'
keywords: ['dataview', 'scripts', 'automate', 'mysql', 'table']
description: 'This document serves as the base table for the CWM - Automate - Dataview - Scripts - MemberOf, detailing its dependencies, structure, and the specific columns that define its functionality within the ConnectWise Automate environment.'
tags: ['database', 'report']
draft: false
unlisted: false
---

## Purpose

Serves as the base table for the [CWM - Automate - Dataview - Scripts - MemberOf](<../dataviews/Scripts - MemberOf.md>) dataview.

## Dependencies

[CWM - Automate - Script - MySQL - View - Create (pvl_scripts_memberof)](<../scripts/MySQL - View - Create (pvl_scripts_memberof).md>)

## Tables

#### pvl_scripts_memberof

| Column               | Description                                                                                                       |
|----------------------|-------------------------------------------------------------------------------------------------------------------|
| Scriptid             | ID of the script.                                                                                                 |
| Script Name          | Name of the script.                                                                                               |
| Object Name          | Name of the object.                                                                                               |
| Object Type          | Type of the object (group/monitor/alert template/individual computer/maintenance).                               |
| Object Description    | Full path of the group, indicating whether the alert template is applied on a computer-level remote monitor group or an internal monitor. |
| Limited To          | Indicates whether the scheduled group script/remote monitor is limited to a search/internal monitor or any group. |
| Affected Agents      | Number of computers in the group/number of agents detected in the search if limited to search.                   |

