---
id: '7d803c02-dd33-4a82-810e-02b4820ae88b'
slug: /7d803c02-dd33-4a82-810e-02b4820ae88b
title: 'Windows Sessions DV, Globals'
title_meta: 'Windows Sessions DV, Globals'
keywords: ['query', 'session', 'execution', 'database', 'custom', 'table']
description: 'This document outlines the execution of the query session command and how to store the results in a custom table. It includes sample runs, dependencies, variable descriptions, global parameters, and output details.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

Executes the `query session` command and stores the result in a custom table.

## Sample Run

![Sample Run](../../../static/img/Windows-Sessions-DV,-Globals/image_1.png)

## Dependencies

[CWM - Automate - Script - OverFlowedVariable - SQL Insert - Execute](/docs/34cee8fe-1b6b-4558-a890-2face427ceb8)

## Variables

| Name  | Description                                                                                     |
|-------|-------------------------------------------------------------------------------------------------|
| psout | Output of the PowerShell script executing and parsing the `Query Session` command              |

#### Global Parameters

| Name          | Default | Required | Description                                                                                                           |
|---------------|---------|----------|-----------------------------------------------------------------------------------------------------------------------|
| retentiondays | 1       | True     | Number of days to keep the historical data. Any data older than the specified days will be removed from the database on the next execution of the script. |

## Output

- Dataview
- Custom Table


