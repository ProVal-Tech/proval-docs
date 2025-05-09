---
id: '198f0265-3e5b-4828-9e86-dfe727bc2d1c'
slug: /198f0265-3e5b-4828-9e86-dfe727bc2d1c
title: 'Patching and Cumulative Update Compliance Report'
title_meta: 'Patching and Cumulative Update Compliance Report'
keywords: ['patching', 'compliance', 'windows', 'dataview', 'metrics']
description: 'This document outlines the implementation steps and associated content for the Patching and Cumulative Update Compliance Metrics dataviews in ConnectWise Automate, focusing on Windows computers with managed patch policies and their compliance scores over the past 30 days.'
tags: ['auditing', 'compliance', 'database', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of the dataviews included in this solution is to present the patching and cumulative update compliance score for the supported Windows computers with managed patch policies, which have been online in Automate within the past 30 days and are part of production patching groups for the whole environment and client filtered separately.

## Associated Content

### Auditing

| Content                                                                 | Type         | Function                                                                  |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------|
| [Script - MySQL - View - Create (pvl_patch_cu_compliance)](/docs/b1963e10-77b2-444a-80ac-9cfded3ab8a4) | Script       | Imports the associated views.                                             |
| [View - pvl_patch_cu_compliance](/docs/8a713392-a671-4af3-8cbe-ff04199e2f3b) | Custom View  | Stores and executes the SQL query utilized by the 'Patching and CU Compliance Metrics' dataview. |
| [View - pvl_patch_cu_compliance_clients](/docs/2edcd22b-ef08-4877-b5aa-9c9b30c2bcb6) | Custom View  | Stores and executes the SQL query utilized by the 'Patching and CU Compliance Metrics - Clients' dataview. |
| [Dataview - Patching and CU Compliance Metrics](/docs/478c4a27-9722-4175-819d-fd4ed1f481f2) | Dataview     | Displays the global data.                                                |
| [Dataview - Patching and CU Compliance Metrics - Clients](/docs/d7c2fb39-45e1-482f-b58d-5397cbbec1da) | Dataview     | Displays the client-filtered data.                                       |

### Dependencies

| Content                                                                 | Type         | Function                                                                  |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------|
| [Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) | Custom Table | Stores the support date of different versions of the Operating System     |
| [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) | Script       | Creates the 'Plugin_ProVal_Windows_OS_Support' table.                   |
| [Solution - Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2) | Solution     | Fetches and stores the information of the latest installed Cumulative Update on Windows 10 and 11 computers. |

## Implementation

1. Import the following scripts from the `ProSync` plugin:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)
   - [MySQL - View - Create (pvl_patch_cu_compliance)](/docs/b1963e10-77b2-444a-80ac-9cfded3ab8a4)

2. Import the following dataviews from the `ProSync` plugin:
   - [Patching and CU Compliance Metrics](/docs/478c4a27-9722-4175-819d-fd4ed1f481f2)
   - [Patching and CU Compliance Metrics - Clients](/docs/d7c2fb39-45e1-482f-b58d-5397cbbec1da)

3. Follow the implementation steps provided in the [Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2) solution's document and ensure that at least the `Auditing` portion of the solution is installed in the environment.

4. Reload the System Cache  
   ![Reload the System Cache](../../static/img/docs/198f0265-3e5b-4828-9e86-dfe727bc2d1c/image_1.webp)

5. Execute the [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) script against any computer to create/update the [plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) custom table if it is not available in the environment.

6. Execute the [MySQL - View - Create (pvl_patch_cu_compliance)](/docs/b1963e10-77b2-444a-80ac-9cfded3ab8a4) script against any computer to create/update the following views:
   - [View - pvl_patch_cu_compliance](/docs/8a713392-a671-4af3-8cbe-ff04199e2f3b)
   - [View - pvl_patch_cu_compliance_clients](/docs/2edcd22b-ef08-4877-b5aa-9c9b30c2bcb6)

7. Validate the presence of data in the following dataviews:
   - [Patching and CU Compliance Metrics](/docs/478c4a27-9722-4175-819d-fd4ed1f481f2)
   - [Patching and CU Compliance Metrics - Clients](/docs/d7c2fb39-45e1-482f-b58d-5397cbbec1da)

8. Remove/delete the following scripts:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)
   - [MySQL - View - Create (pvl_patch_cu_compliance)](/docs/b1963e10-77b2-444a-80ac-9cfded3ab8a4)

