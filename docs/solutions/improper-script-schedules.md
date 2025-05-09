---
id: 'fbd5de2a-f562-4f02-8eff-365942bc908c'
slug: /fbd5de2a-f562-4f02-8eff-365942bc908c
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
| [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](/docs/494c2d2c-2f37-45b7-9eb0-130ff3aac45c) | Script    | Imports the associated view.                   |
| [CWM - Automate - Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4) | Dataview  | Stores the improperly scheduled scripts        |

#### Dependencies

| Content                                                                                                   | Type          | Function                                                                                                    |
|-----------------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - View - pvl_Scheduled_Scripts](/docs/5c02ccad-5b51-46a5-8423-59286adc37ea)         | Custom Table  | Stores and executes the SQL query utilized by the [Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4). |

## Implementation

### 1.
Import the following script from the `ProSync` plugin:
- [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](/docs/494c2d2c-2f37-45b7-9eb0-130ff3aac45c)

### 2.
Import the following Dataview from the `ProSync` plugin:
- [CWM - Automate - Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4)

### 3.
Reload the system cache:
![Reload Cache](../../static/img/docs/fbd5de2a-f562-4f02-8eff-365942bc908c/image_1.webp)

### 4.
Execute the [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](/docs/494c2d2c-2f37-45b7-9eb0-130ff3aac45c) against any computer to create/update the [pvl_Scheduled_Scripts](/docs/5c02ccad-5b51-46a5-8423-59286adc37ea) Custom View. This script will automatically run the [CWM - Automate - Script - MySQL - Permission - Set Custom Table Permissions](/docs/7819fc75-aeae-457b-a451-59221396e900) to provide the necessary table permissions.

### 5.
Validate the presence of data in the [CWM - Automate - Dataview - Improper Script Schedules](/docs/1eb426fd-ee56-4e81-9d3e-116e8c4698b4) dataview.

### 6.
Remove the [CWM - Automate - Script - MySQL - View - Create (pvl_Scheduled_Scripts)](/docs/494c2d2c-2f37-45b7-9eb0-130ff3aac45c) script.

