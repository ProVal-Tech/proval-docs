---
id: '5b888c11-49da-4fea-9bda-9bffdfbb286d'
slug: /5b888c11-49da-4fea-9bda-9bffdfbb286d
title: 'pvl_scripts_memberof'
title_meta: 'pvl_scripts_memberof'
keywords: ['dataview', 'scripts', 'automate', 'mysql', 'table']
description: 'This document serves as the base table for the CWM - Automate - Dataview - Scripts - MemberOf, detailing its dependencies, structure, and the specific columns that define its functionality within the ConnectWise Automate environment.'
tags: ['database', 'report']
draft: false
unlisted: false
---

## Purpose

Serves as the base table for the [CWM - Automate - Dataview - Scripts - MemberOf](/docs/83b99c1b-d471-41f1-9755-af3a2ab1abf0) dataview.

## Dependencies

[CWM - Automate - Script - MySQL - View - Create (pvl_scripts_memberof)](/docs/8c15555e-049e-4bf3-8a29-6446e2b2d05d)

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