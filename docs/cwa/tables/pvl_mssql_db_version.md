---
id: 'e0ec87f6-0624-40db-ac6b-1b7d823e6b37'
title: 'pvl_mssql_db_version'
title_meta: 'pvl_mssql_db_version'
keywords: ['mssql', 'database', 'custom', 'version', 'table']
description: 'This document outlines the purpose and structure of a custom table that stores data gathered from the MSSQL database version script, including its dependencies and the data it collects.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

The custom table stores the data gathered by the [Script - Get MSSQL Database Version](<../scripts/Get MSSQL Database Version.md>) and is displayed in the [Dataview - MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161865).

## Dependencies

- [Dataview - MSSQL Database Version](https://proval.itglue.com/DOC-5078775-15161865)
- [Internal Monitor - Execute Script - Get MSSQL Database Version](<../monitors/Execute Script - Get MSSQL Database Version.md>)
- [Script - Get MSSQL Database Version](<../scripts/Get MSSQL Database Version.md>)

## Table

| Column        | Type     | Explanation                          |
|---------------|----------|--------------------------------------|
| computerid    | int      | Computer ID                          |
| Instance      | Varchar  | Name of the Database Instance        |
| Version       | Varchar  | Version of the Database Instance     |
| PatchLevel    | Varchar  | Patch Level of the Database Instance |
| ScriptRunTime | DateTime | Data Collection Time                 |



