---
id: 'cwa-query-session-command'
title: 'Query Session Command Execution'
title_meta: 'Query Session Command Execution'
keywords: ['query', 'session', 'execution', 'database', 'custom', 'table']
description: 'This document outlines the execution of the query session command and how to store the results in a custom table. It includes sample runs, dependencies, variable descriptions, global parameters, and output details.'
tags: ['database', 'configuration', 'report', 'windows', 'performance']
draft: false
unlisted: false
---
## Summary

Executes the `query session` command and stores the result in a custom table.

## Sample Run

![Sample Run](../../../static/img/Windows-Sessions-DV,-Globals/image_1.png)

## Dependencies

[CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](https://proval.itglue.com/DOC-5078775-10546355)

## Variables

| Name  | Description                                                                                     |
|-------|-------------------------------------------------------------------------------------------------|
| psout | Output of the PowerShell script executing and parsing the `Query Session` command              |

#### Global Parameters

| Name          | Default | Required | Description                                                                                                           |
|---------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------|
| retentiondays | 1       | True     | Number of days to keep the historical data. Any data older than the mentioned days will be removed from the database on the next execution of the script. |

## Output

- Dataview
- Custom Table




