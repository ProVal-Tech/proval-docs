---
id: 'fbd5de2a-f562-4f02-8eff-365942bc908c'
title: 'Improper Script Schedules'
title_meta: 'Improper Script Schedules'
keywords: ['scheduling', 'scripts', 'dataview', 'mysql', 'permissions']
description: 'This document provides an overview of scripts that are improperly scheduled within ConnectWise Automate, including associated content, dependencies, and implementation steps for resolving the issue.'
tags: ['mysql', 'permissions', 'setup']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to present the scripts that are improperly scheduled.

## Associated Content

#### Auditing

| Content                                                                                                   | Type      | Function                                       |
|-----------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------|
| [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](<../cwa/scripts/MySQL - View - Create (pvl_Scheduled_Scripts).md>) | Script    | Imports the associated view.                   |
| [CWM - Automate - Dataview - Improper Script Schedules](<../cwa/dataviews/Improper Script Schedules.md>) | Dataview  | Stores the improperly scheduled scripts        |

#### Dependencies

| Content                                                                                                   | Type          | Function                                                                                                    |
|-----------------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - View - pvl_Scheduled_Scripts](<../cwa/views/pvl_Scheduled_Scripts.md>)         | Custom Table  | Stores and executes the SQL query utilized by the [Dataview - Improper Script Schedules](<../cwa/dataviews/Improper Script Schedules.md>). |

## Implementation

### 1.
Import the following script from the `ProSync` plugin:
- [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](<../cwa/scripts/MySQL - View - Create (pvl_Scheduled_Scripts).md>)

### 2.
Import the following Dataview from the `ProSync` plugin:
- [CWM - Automate - Dataview - Improper Script Schedules](<../cwa/dataviews/Improper Script Schedules.md>)

### 3.
Reload the system cache:
![Reload Cache](../../static/img/Improper-Script-Schedules/image_1.png)

### 4.
Execute the [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](<../cwa/scripts/MySQL - View - Create (pvl_Scheduled_Scripts).md>) against any computer to create/update the [pvl_Scheduled_Scripts](<../cwa/views/pvl_Scheduled_Scripts.md>) Custom View. This script will automatically run the [CWM - Automate - Script - MySQL - Permission - Set Custom Table Permissions](<../cwa/scripts/MySQL - Permission - Set Custom Table Permissions.md>) to provide the necessary table permissions.

### 5.
Validate the presence of data in the [CWM - Automate - Dataview - Improper Script Schedules](<../cwa/dataviews/Improper Script Schedules.md>) dataview.

### 6.
Remove the [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](<../cwa/scripts/MySQL - View - Create (pvl_Scheduled_Scripts).md>) script.




