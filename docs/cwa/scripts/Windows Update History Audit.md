---
id: 'cwa-gather-windows-update-data'
title: 'Gather Windows Update Data'
title_meta: 'Gather Windows Update Data for EPM Custom Table'
keywords: ['windows', 'update', 'data', 'epm', 'report']
description: 'This document provides a comprehensive overview of a script that gathers Windows update data and enters it into the EPM - Custom Table - pvl_windows_updates. It includes details on dependencies, variables, global parameters, and the expected output.'
tags: ['windows', 'update', 'database', 'report', 'configuration']
draft: false
unlisted: false
---
## Summary

Gathers Windows update data and enters it into the [EPM - Custom Table - pvl_windows_updates](https://proval.itglue.com/DOC-5078775-12275091) table.

## Sample Run

![Sample Run](..\..\..\static\img\Windows-Update-History-Audit\image_1.png)

## Dependencies

- [EPM - Data Collection - Get-WindowsUpdateReport](https://proval.itglue.com/DOC-5078775-10372095)

## Variables

| Name      | Description                                         |
|-----------|-----------------------------------------------------|
| JSONPath  | The file path that the serialized object will be saved to. |

#### Global Parameters

| Name        | Value                 | Description                                   |
|-------------|-----------------------|-----------------------------------------------|
| TableName   | pvl_windows_updates    | The table to save the data to.               |
| ProjectName | Get-WindowsUpdateReport | The name of the target agnostic script.      |

## Output

- Script Log
- [pvl_windows_updates](https://proval.itglue.com/DOC-5078775-12275091)



