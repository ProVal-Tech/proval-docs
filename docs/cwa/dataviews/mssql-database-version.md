---
id: 'eb2798dd-20c1-4c57-96c7-56349f2867f1'
slug: /eb2798dd-20c1-4c57-96c7-56349f2867f1
title: 'MSSQL Database Version'
title_meta: 'MSSQL Database Version'
keywords: ['mssql', 'database', 'version', 'patch', 'monitoring']
description: 'This document provides an overview of the version and patch level details of MSSQL Servers, detailing the data collected through the associated script and its dependencies. It outlines the key columns and their descriptions for better understanding and utilization.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

The data view showcases the version and patch level details of MSSQL Servers, acquired through the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee).

## Dependencies

- [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee)
- [Custom Table - pvl_mssql_db_version](/docs/e0ec87f6-0624-40db-ac6b-1b7d823e6b37)
- [Internal Monitor - Execute Script - Get MSSQL Database Version](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213)

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



