---
id: '83b99c1b-d471-41f1-9755-af3a2ab1abf0'
title: 'Scripts - MemberOf'
title_meta: 'Scripts - MemberOf'
keywords: ['script', 'connectwise', 'dataview', 'mysql', 'implementation']
description: 'This document details a script that displays the results of selecting "Find Script" for all scripts in ConnectWise Automate. It includes dependencies, implementation steps, and a breakdown of the columns in the output.'
tags: ['connectwise', 'database', 'report', 'software']
draft: false
unlisted: false
---

## Summary

This script displays the results of selecting 'Find Script' for all scripts.

![Image 1](../../../static/img/Scripts---MemberOf/image_1.png)

![Image 2](../../../static/img/Scripts---MemberOf/image_2.png)

## Dependencies

- [CWM - Automate - Custom View - pvl_scripts_memberof](<../views/pvl_scripts_memberof.md>)
- [CWM - Automate - Script - MySQL - View - Create (pvl_scripts_memberof)](<../scripts/MySQL - View - Create (pvl_scripts_memberof).md>)

## Implementation

- Import the [CWM - Automate - Script - MySQL - View - Create (pvl_scripts_memberof)](<../scripts/MySQL - View - Create (pvl_scripts_memberof).md>) script.
- Import the dataview.
- Execute/Debug the script against any computer and ensure the presence of data in the dataview.
- Remove the script.

## Columns

| Column             | Description                                                                                             |
|--------------------|---------------------------------------------------------------------------------------------------------|
| Script ID          | ID of the script.                                                                                       |
| Script Name        | Name of the script.                                                                                     |
| Object Name        | Name of the object.                                                                                     |
| Object Type        | Type of the object (Group/Monitor/Alert Template/Individual Computer/Maintenance).                     |
| Object Description  | Full path of the group or whether the alert template is applied at the computer level, remote monitor group, or an internal monitor. |
| Limited To         | Indicates whether the scheduled group script/remote monitor is limited to a search or if the internal monitor is limited to any group. |
| Affected Agents    | Number of computers in the group or number of agents detected in the search if limited to search.     |



