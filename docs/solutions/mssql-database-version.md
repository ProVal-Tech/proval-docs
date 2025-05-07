---
id: 'a13ca3c7-a75d-4549-9056-dd0b79e4caeb'
slug: /a13ca3c7-a75d-4549-9056-dd0b79e4caeb
title: 'MSSQL Database Version'
title_meta: 'MSSQL Database Version'
keywords: ['mssql', 'database', 'version', 'audit', 'monitor', 'script', 'dataview']
description: 'This document outlines a solution for centralizing the retrieval of MSSQL server versions across an environment. It provides detailed steps for implementation, including associated content for auditing purposes and configurations for monitoring MSSQL database versions effectively.'
tags: ['database', 'windows']
draft: false
unlisted: false
---

## Purpose

The objective of this solution is to centralize the retrieval of MSSQL server versions across the environment into a single location for auditing purposes.

## Associated Content

#### Auditing Content

| Content                                                                                                      | Type            | Function                                                                                                                                                                                                                             |
|--------------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Internal Monitor - Execute Script - Get MSSQL Database Version](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213) | Internal Monitor | The internal monitor detects the MSSQL servers where the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee) has not been executed within the last week.                                         |
| [Dataview - MSSQL Database Version](/docs/eb2798dd-20c1-4c57-96c7-56349f2867f1)                        | Dataview        | The data view showcases the version and patch level details of MSSQL Servers, acquired through the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee).                                       |
| [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee)                      | Script          | The script collects the `Version` and `Patch Level` information of the MSSQL Server.                                                                                                                                              |
| △ Custom - Execute Script - Get MSSQL Database Version                                                      | Alert Template   | The Alert Template executes the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee) against the machines detected by the [Internal Monitor - Execute Script - Get MSSQL Database Version](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213). |

#### Other Content

| Content                                                                                                      | Type          | Function                                                                                                           |
|--------------------------------------------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------|
| [Custom Table - pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37)                     | Custom Table  | The custom table stores the data gathered by the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee). |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee)
   - [Dataview - MSSQL Database Version](/docs/eb2798dd-20c1-4c57-96c7-56349f2867f1)
   - [Internal Monitor - Execute Script - Get MSSQL Database](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213)
   - Alert Template - `△ Custom - Execute Script - Get MSSQL Database Version`

2. Reload the System Cache  
   ![Reload Cache](../../static/img/docs/a13ca3c7-a75d-4549-9056-dd0b79e4caeb/image_1.png)

3. Execute the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee) against an online `Windows Machine` with the `Set_Environment` parameter set to `1`, to create the [Custom Table - pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37)  
   ![Execute Script](../../static/img/docs/a13ca3c7-a75d-4549-9056-dd0b79e4caeb/image_2.png)

4. Configure the solution as follows:  
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Execute Script - Get MSSQL Database](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213)  
       - Configure with the alert template: `△ Custom - Execute Script - Get MSSQL Database Version`
       - Right-click and Run Now to start the monitor.


