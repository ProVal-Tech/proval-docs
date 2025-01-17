---
id: '198f0265-3e5b-4828-9e86-dfe727bc2d1c'
title: 'Patching and CU Compliance Metrics'
title_meta: 'Patching and CU Compliance Metrics'
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
| [Script - MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208) | Script       | Imports the associated views.                                             |
| [View - pvl_patch_cu_compliance](https://proval.itglue.com/DOC-5078775-15390697) | Custom View  | Stores and execute the SQL query utilized by the 'Patching and CU Compliance Metrics' dataview. |
| [View - pvl_patch_cu_compliance_clients](https://proval.itglue.com/DOC-5078775-15390696) | Custom View  | Stores and execute the SQL query utilized by the 'Patching and CU Compliance Metrics - Clients' dataview. |
| [Dataview - Patching and CU compliance Metrics](https://proval.itglue.com/DOC-5078775-15390686) | Dataview     | Display the global data.                                                 |
| [Dataview - Patching and CU compliance Metrics - Clients](https://proval.itglue.com/DOC-5078775-15390684) | Dataview     | Display the client filtered data.                                        |

### Dependencies

| Content                                                                 | Type         | Function                                                                  |
|-------------------------------------------------------------------------|--------------|---------------------------------------------------------------------------|
| [Custom Table - plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) | Custom Table | Stored the support date of different version of Operating System          |
| [Script - MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131) | Script       | Creates the 'Plugin_ProVal_Windows_OS_Support' table.                   |
| [Solution - Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104) | Solution     | Fetch and store the information of latest installed Cumulative Update on Windows 10 and 11 computers. |

## Implementation

1. Import the following scripts from the `ProSync` plugin:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)
   - [MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208)

2. Import the following dataviews from the `ProSync` plugin:
   - [Patching and CU compliance Metrics](https://proval.itglue.com/DOC-5078775-15390686)
   - [Patching and CU compliance Metrics - Clients](https://proval.itglue.com/DOC-5078775-15390684)

3. Follow the implementation step provided in the [Latest Installed Cumulative Update](https://proval.itglue.com/DOC-5078775-12850104) solution's document and ensure that at least the `Auditing` portion of the solution is installed in the environment.

4. Reload the System Cache  
   ![Reload the System Cache](../../static/img/Patching-and-Cumulative-Update-Compliance-Report/image_1.png)

5. Execute the [MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131) script against any computer to create/update the [plugin_proval_windows_os_support](https://proval.itglue.com/DOC-5078775-7780690) custom table if it is not available in the environment.

6. Execute the [MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208) script against any computer to create/update the following views:
   - [View - pvl_patch_cu_compliance](https://proval.itglue.com/DOC-5078775-15390697)
   - [View - pvl_patch_cu_compliance_clients](https://proval.itglue.com/DOC-5078775-15390696)

7. Validate the presence of data in the following dataviews:
   - [Patching and CU compliance Metrics](https://proval.itglue.com/DOC-5078775-15390686)
   - [Patching and CU compliance Metrics - Clients](https://proval.itglue.com/DOC-5078775-15390684)

8. Remove/delete the following scripts:
   - [MySQL - Table - Create (plugin_proval_windows_os_support)](https://proval.itglue.com/DOC-5078775-11564131)
   - [MySQL - View - Create (pvl_patch_cu_compliance)](https://proval.itglue.com/DOC-5078775-15392208)











