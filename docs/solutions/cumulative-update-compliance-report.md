---
id: 'c1bece1b-9d48-488b-bc4a-02d8c64fe914'
slug: /c1bece1b-9d48-488b-bc4a-02d8c64fe914
title: 'Cumulative Update Compliance - Report'
title_meta: 'Cumulative Update Compliance - Report'
keywords: ['windows', 'compliance', 'updates', 'patching', 'dataview']
description: 'This document outlines the implementation of dataviews to present the cumulative update compliance score for Windows computers with managed patch policies. It details the associated content, dependencies, and step-by-step instructions for setting up the solution in ConnectWise Automate, ensuring that your environment maintains compliance with the latest updates.'
tags: ['compliance', 'patching', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of the dataviews included in this solution is to present the cumulative update compliance score for Windows computers with managed patch policies that have been online in Automate within the past 30 days. These computers are part of production patching groups for the whole environment and are filtered separately by client.

## Associated Content

### Auditing

| Content                                                                 | Type        | Function                                           |
|-------------------------------------------------------------------------|-------------|----------------------------------------------------|
| [Script - MySQL - View - Create (pvl_cu_compliance)](/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33) | Script      | Imports the associated views.                       |
| [View - pvl_cu_compliance](/docs/fbd4b655-562a-4ff1-aea7-be27b9a77421) | Custom View | Stores and executes the SQL query utilized by the 'CU Compliance Metrics' dataview. |
| [View - pvl_cu_compliance_clients](/docs/965bd890-074b-4217-bba2-e9ddb4a3109d) | Custom View | Stores and executes the SQL query utilized by the 'CU Compliance Metrics - Clients' dataview. |
| [Dataview - CU Compliance Metrics](/docs/c1551907-b8c1-458d-949d-a627ca7d1e44) | Dataview    | Displays the global data.                           |
| [Dataview - CU Compliance Metrics - Clients](/docs/61414da1-00d5-43c8-96a6-e2bba972860a) | Dataview    | Displays the client-filtered data.                  |

### Dependencies

| Content                                                                 | Type        | Function                                           |
|-------------------------------------------------------------------------|-------------|----------------------------------------------------|
| [Custom Table - plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) | Custom Table | Stores the support date of different versions of the Operating System. |
| [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) | Script      | Creates the 'Plugin_ProVal_Windows_OS_Support' table. |
| [Solution - Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2) | Solution    | Fetches and stores the information of the latest installed Cumulative Update on Windows 10 and 11 computers. |

## Implementation

1. Import the following scripts from the `ProSync` plugin:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)
   - [MySQL - View - Create (pvl_cu_compliance)](/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33)

2. Import the following dataviews from the `ProSync` plugin:
   - [CU Compliance Metrics](/docs/c1551907-b8c1-458d-949d-a627ca7d1e44)
   - [CU Compliance Metrics - Clients](/docs/61414da1-00d5-43c8-96a6-e2bba972860a)

3. Follow the implementation steps provided in the [Latest Installed Cumulative Update](/docs/991e926f-dcd2-4be3-9f3a-ea7ee9842da2) solution document and ensure that at least the `Auditing` portion of the solution is installed in the environment.

4. Reload the System Cache  
   ![Reload the System Cache](../../static/img/docs/c1bece1b-9d48-488b-bc4a-02d8c64fe914/image_1.png)

5. Execute the [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1) script against any computer to create/update the [plugin_proval_windows_os_support](/docs/938cd822-f6a3-4ee3-add2-62b407e45622) custom table if it is not available in the environment.

6. Execute the [MySQL - View - Create (pvl_cu_compliance)](/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33) script against any computer to create/update the following views:
   - [pvl_cu_compliance](/docs/fbd4b655-562a-4ff1-aea7-be27b9a77421)
   - [pvl_cu_compliance_clients](/docs/965bd890-074b-4217-bba2-e9ddb4a3109d)

7. Validate the presence of data in the following dataviews:
   - [CU Compliance Metrics](/docs/c1551907-b8c1-458d-949d-a627ca7d1e44)
   - [Patching and CU Compliance Metrics - Clients](/docs/d7c2fb39-45e1-482f-b58d-5397cbbec1da)

8. Remove the following scripts:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](/docs/09d6c579-dbce-4876-81aa-0ab7cf5432b1)
   - [MySQL - View - Create (pvl_cu_compliance)](/docs/c2b0a6aa-75cd-4711-80b6-de9bcfe8ea33)


