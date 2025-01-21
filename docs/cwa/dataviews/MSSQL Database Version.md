---
id: 'eb2798dd-20c1-4c57-96c7-56349f2867f1'
title: 'MSSQL Database Version'
title_meta: 'MSSQL Database Version'
keywords: ['mssql', 'database', 'version', 'patch', 'monitoring']
description: 'This document provides an overview of the version and patch level details of MSSQL Servers, detailing the data collected through the associated script and its dependencies. It outlines the key columns and their descriptions for better understanding and utilization.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

The data view showcases the version and patch level details of MSSQL Servers, acquired through the [Script - Get MSSQL Database Version](<../scripts/Get MSSQL Database Version.md>).

## Dependencies

- [Script - Get MSSQL Database Version](<../scripts/Get MSSQL Database Version.md>)
- [Custom Table - pvl_mssql_db_version](<../tables/pvl_mssql_db_version.md>)
- [Internal Monitor - Execute Script - Get MSSQL Database Version](<../monitors/Execute Script - Get MSSQL Database Version.md>)

## Columns

| Column                | Description                                                        |
|----------------------|--------------------------------------------------------------------|
| Clientid             | Client ID (Hidden)                                                |
| Locationid           | Location ID (Hidden)                                              |
| Computerid           | Computer ID (Hidden)                                              |
| Client               | Client Name                                                       |
| Location             | Location Name                                                     |
| Computer             | Computer Name                                                     |
| Operating System      | Operating System                                                  |
| Form Factor          | Form Factor of the Machine (Virtual Server/Physical Server/Hyper-V Host) |
| Last Contact         | Last Contact with RMM                                            |
| MSSQL Instance       | Name of the MSSQL Instance                                       |
| MSSQL Version        | Version of the MSSQL Instance (Database Version)                 |
| MSSQL Patch Level    | Patch Level of the MSSQL Instance                                 |
| Data Collection Time  | Data Collection Time                                              |




