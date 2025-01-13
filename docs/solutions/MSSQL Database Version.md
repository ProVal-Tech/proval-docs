---
id: 'cwa-mssql-database-version-retrieval'
title: 'MSSQL Database Version Retrieval Solution'
title_meta: 'MSSQL Database Version Retrieval Solution'
keywords: ['mssql', 'database', 'version', 'audit', 'monitor', 'script', 'dataview']
description: 'This document outlines a solution for centralizing the retrieval of MSSQL server versions across an environment. It provides detailed steps for implementation, including associated content for auditing purposes and configurations for monitoring MSSQL database versions effectively.'
tags: ['database', 'audit', 'monitor', 'script', 'dataview', 'custom', 'alert', 'windows']
draft: false
unlisted: false
---
## Purpose

The objective of the solution is to centralize the retrieval of MSSQL server versions across the environment into a single location for auditing purposes.

## Associated Content

#### Auditing Content

| Content                                                                                                      | Type            | Function                                                                                                                                                                                                                             |
|--------------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Execute Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161763) | Internal Monitor | The internal monitor detects the MSSQL servers where the [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760) has not been executed within the last week.                                         |
| [Dataview - MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161865)                        | Dataview        | The data view showcases the version and patch level details of MSSQL Servers, acquired through the [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760).                                       |
| [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760)                      | Script          | The script collects the `Version` and `Patch Level` information of the MSSQL Server.                                                                                                                                              |
| △ Custom - Execute Script - Get MSSQL Database Version                                                      | Alert Template   | The Alert Template executes the [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760) against the machines detected by the [Internal Monitor - Execute Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161763). |

#### Other Content

| Content                                                                                                      | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------|
| [Custom Table - pvl_mssql_db_version](https://proval.itglue.com/DOC-5078775-15161868)                     | Custom Table  | The custom table stores the data gathered by the [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760). |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760)
   - [Dataview - MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161865)
   - [Internal Monitor - Execute Script - Get MSSQL Database](https://proval.itglue.com/DOC-5078775-15161763)
   - Alert Template - `△ Custom - Execute Script - Get MSSQL Database Version`

2. Reload the System Cache  
   ![Reload Cache](..\..\static\img\MSSQL-Database-Version\image_1.png)

3. Execute the [Script - Get MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161760) against an online `Windows Machine` with the `Set_Environment` parameter set to `1`, to create the [Custom Table - pvl_mssql_db_version](https://proval.itglue.com/DOC-5078775-15161868)  
   ![Execute Script](..\..\static\img\MSSQL-Database-Version\image_2.png)

4. Configure the solution as follows:  
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - Execute Script - Get MSSQL Database](https://proval.itglue.com/DOC-5078775-15161763)  
       - Configure with the alert template: `△ Custom - Execute Script - Get MSSQL Database Version`
       - Right-click and Run Now to start the monitor.


