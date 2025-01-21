---
id: 'c1bece1b-9d48-488b-bc4a-02d8c64fe914'
title: 'Cumulative Update Compliance for Windows Computers'
title_meta: 'Cumulative Update Compliance for Windows Computers'
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
| [Script - MySQL - View - Create (pvl_cu_compliance)](<../cwa/scripts/MySQL - View - Create (pvl_cu_compliance).md>) | Script      | Imports the associated views.                       |
| [View - pvl_cu_compliance](<../cwa/views/pvl_cu_compliance.md>) | Custom View | Stores and executes the SQL query utilized by the 'CU Compliance Metrics' dataview. |
| [View - pvl_cu_compliance_clients](<../cwa/views/pvl_cu_compliance_clients.md>) | Custom View | Stores and executes the SQL query utilized by the 'CU Compliance Metrics - Clients' dataview. |
| [Dataview - CU Compliance Metrics](<../cwa/dataviews/CU Compliance Metrics.md>) | Dataview    | Displays the global data.                           |
| [Dataview - CU Compliance Metrics - Clients](<../cwa/dataviews/CU Compliance Metrics - Clients.md>) | Dataview    | Displays the client-filtered data.                  |

### Dependencies

| Content                                                                 | Type        | Function                                           |
|-------------------------------------------------------------------------|-------------|----------------------------------------------------|
| [Custom Table - plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) | Custom Table | Stores the support date of different versions of the Operating System. |
| [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>) | Script      | Creates the 'Plugin_ProVal_Windows_OS_Support' table. |
| [Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104) | Solution    | Fetches and stores the information of the latest installed Cumulative Update on Windows 10 and 11 computers. |

## Implementation

1. Import the following scripts from the `ProSync` plugin:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)
   - [MySQL - View - Create (pvl_cu_compliance)](<../cwa/scripts/MySQL - View - Create (pvl_cu_compliance).md>)

2. Import the following dataviews from the `ProSync` plugin:
   - [CU Compliance Metrics](<../cwa/dataviews/CU Compliance Metrics.md>)
   - [CU Compliance Metrics - Clients](<../cwa/dataviews/CU Compliance Metrics - Clients.md>)

3. Follow the implementation steps provided in the [Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104) solution document and ensure that at least the `Auditing` portion of the solution is installed in the environment.

4. Reload the System Cache  
   ![Reload the System Cache](../../static/img/Cumulative-Update-Compliance---Report/image_1.png)

5. Execute the [MySQL - Table - Create (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>) script against any computer to create/update the [plugin_proval_windows_os_support](<../cwa/tables/plugin_proval_windows_os_support.md>) custom table if it is not available in the environment.

6. Execute the [MySQL - View - Create (pvl_cu_compliance)](<../cwa/scripts/MySQL - View - Create (pvl_cu_compliance).md>) script against any computer to create/update the following views:
   - [pvl_cu_compliance](<../cwa/views/pvl_cu_compliance.md>)
   - [pvl_cu_compliance_clients](<../cwa/views/pvl_cu_compliance_clients.md>)

7. Validate the presence of data in the following dataviews:
   - [CU Compliance Metrics](<../cwa/dataviews/CU Compliance Metrics.md>)
   - [Patching and CU Compliance Metrics - Clients](<../cwa/dataviews/Patching and CU compliance Metrics - Clients.md>)

8. Remove the following scripts:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](<../cwa/scripts/MySQL - Table - Create (plugin_proval_windows_os_support).md>)
   - [MySQL - View - Create (pvl_cu_compliance)](<../cwa/scripts/MySQL - View - Create (pvl_cu_compliance).md>)

