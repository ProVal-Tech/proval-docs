---
id: 'e0ec87f6-0624-40db-ac6b-1b7d823e6b37'
slug: /e0ec87f6-0624-40db-ac6b-1b7d823e6b37
title: 'pvl_mssql_db_version'
title_meta: 'pvl_mssql_db_version'
keywords: ['mssql', 'database', 'custom', 'version', 'table']
description: 'This document outlines the purpose and structure of a custom table that stores data gathered from the MSSQL database version script, including its dependencies and the data it collects.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

The custom table stores the data gathered by the [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee) and is displayed in the [Dataview - MSSQL Database Version](/docs/eb2798dd-20c1-4c57-96c7-56349f2867f1).

## Dependencies

- [Dataview - MSSQL Database Version](/docs/eb2798dd-20c1-4c57-96c7-56349f2867f1)
- [Internal Monitor - Execute Script - Get MSSQL Database Version](/docs/d7ad7eb3-8f39-4798-a80c-f0a6cdae7213)
- [Script - Get MSSQL Database Version](/docs/03f2c6fe-2b6d-43bd-b5c8-de3cb55c0dee)

## Table

| Column        | Type     | Explanation                          |
|---------------|----------|--------------------------------------|
| computerid    | int      | Computer ID                          |
| Instance      | Varchar  | Name of the Database Instance        |
| Version       | Varchar  | Version of the Database Instance     |
| PatchLevel    | Varchar  | Patch Level of the Database Instance |
| ScriptRunTime | DateTime | Data Collection Time                 |



