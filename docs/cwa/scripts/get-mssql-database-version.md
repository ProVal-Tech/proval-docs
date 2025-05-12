---
id: '03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee'
slug: /03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee
title: 'Get MSSQL Database Version'
title_meta: 'Get MSSQL Database Version'
keywords: ['mssql', 'database', 'version', 'patch', 'custom', 'table']
description: 'This document outlines a script that collects the version and patch level information of the MSSQL Server, saving this data into a designated custom table called pvl_mssql_db_version. It includes instructions for execution, dependencies, variables, user parameters, and expected output.'
tags: ['database', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

The script collects the `Version` and `Patch Level` information of the MSSQL Server and then saves this data into a designated [Custom Table - pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37).

## Sample Run

**First Execution:**  
Execute the script against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table.  
![First Execution](../../../static/img/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee/image_1.webp)

**Regular Executions:**  
Execute the script against the online `MSSQL` servers to gather the version.  
![Regular Executions](../../../static/img/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee/image_2.webp)

## Dependencies

[Internal Monitor - Execute Script - Get MSSQL Database Version](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213)

## Variables

| Name              | Description                                           |
|-------------------|-------------------------------------------------------|
| ProjectName       | Get-MSSQLDBVersion                                   |
| WorkingDirectory   | C:/ProgramData/_automation/script/Get-MSSQLDBVersion |
| TableName         | [pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37) |

## User Parameter

| Name              | Example | Mandatory | Description                                                                                                         |
|-------------------|---------|-----------|---------------------------------------------------------------------------------------------------------------------|
| Set_Environment    | 1       | False     | Execute the script against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table. |

## Output

- Script Log
- Custom Table
- Dataview