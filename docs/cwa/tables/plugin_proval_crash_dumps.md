---
id: 'e562d1d6-a18e-4941-be1b-95117d0b2fa6'
title: 'EPM Data Collection Crash Dump'
title_meta: 'EPM Data Collection Crash Dump'
keywords: ['data', 'crash', 'dump', 'collection', 'epm']
description: 'This document describes the purpose and structure of the optional container for holding data retrieved from the EPM Data Collection script for crash dumps. It includes details on dependencies and the structure of the associated database table, plugin_proval_crash_dumps, including column types and explanations.'
tags: ['database', 'configuration', 'windows', 'report', 'performance']
draft: false
unlisted: false
---
## Purpose

Optional container to hold data retrieved from [EPM - Data Collection - Script - Get-CrashDump](https://proval.itglue.com/DOC-5078775-11956458).

## Dependencies

Created by: [EPM - Data Collection - Script - Get-CrashDump](https://proval.itglue.com/DOC-5078775-11956458) if CreateTable is 1.  
Modified by: [EPM - Data Collection - Script - Get-CrashDump](https://proval.itglue.com/DOC-5078775-11956458) if CreateTable is 1.

## Tables

### plugin_proval_crash_dumps

| Column                 | Type    | Explanation                                    |
|-----------------------|---------|------------------------------------------------|
| ComputerID            | INT     | The associated computerID.                     |
| Crash_Time            | VARCHAR | The time of the crash                          |
| Processor             | VARCHAR | The Processor type                             |
| Full_Path             | VARCHAR | The full path to the dump file                |
| Stack_Address_2       | VARCHAR | A stack address.                               |
| Dump_File_Size        | VARCHAR | The dump file size                            |
| Caused_By_Address     | VARCHAR | The address of what caused the issue          |
| Stack_Address_3       | VARCHAR | A stack address.                               |
| Company               | VARCHAR | The company if known.                         |
| File_Description      | VARCHAR | The file description.                          |
| Bug_Check_Code        | VARCHAR | The bug check code.                           |
| Parameter_4           | VARCHAR | A parameter of some sorts.                     |
| Minor_Version         | INT     | The minor version.                            |
| Parameter_2           | VARCHAR | A parameter of sorts.                         |
| Dump_File             | VARCHAR | The name of the dump file.                    |
| Product_Name          | VARCHAR | The product name.                             |
| Caused_By_Driver      | VARCHAR | The driver that caused the issue.             |
| Crash_Address         | VARCHAR | The address of the crash.                     |
| Parameter_3           | VARCHAR | A parameter it seems.                         |
| Parameter_1           | VARCHAR | Another parameter.                            |
| Bug_Check_String      | VARCHAR | The bug check string.                         |
| File_Version          | VARCHAR | The file version.                             |
| Dump_File_Time        | VARCHAR | The dump file time.                           |
| Computer_Name         | VARCHAR | The computer name, - sometimes not shown.     |
| Processors_count      | INT     | The number of processors.                      |







