---
id: '388b4b61-34b7-4d40-b4de-507032df83d7'
slug: /388b4b61-34b7-4d40-b4de-507032df83d7
title: 'PowerShell Version Audit'
title_meta: 'PowerShell Version Audit'
keywords: ['agent', 'powershell', 'version', 'audit', 'rmm']
description: 'This document provides a dataview that shows the current PowerShell versions installed on agents, along with details such as client name, location, operating system, and last contact information. It also includes SQL representation for querying this data.'
tags: ['database']
draft: false
unlisted: false
---

## Summary

This dataview shows the current agent PowerShell versions.

## Dependencies

[PowerShell Version Audit](/docs/da7e6b68-3ac3-4d15-9969-ca843a187d2d)

## Columns

| Column              | Description                                      |
|---------------------|--------------------------------------------------|
| Client              | Client name of the agent                         |
| Location            | Location name of the agent                       |
| Computer            | Computer name of the agent                       |
| Operating System    | Operating system of the agent                    |
| Last Contact        | Last contact of the agent with the RMM          |
| PowerShell Version   | PowerShell version on the agent                  |
| Script Run Time     | The last date when the PowerShell version was checked |

## SQL Representation

```sql
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.name AS `Client`, 
  l.name AS `Location`, 
  c.name AS `Computer`, 
  c.os AS `Operating System`, 
  c.LastContact, 
  TRIM(
    SUBSTRING_INDEX(ss.value, '--', 1)
  ) AS `Script Run Time`, 
  CASE WHEN TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 2), 
      '--', 
      -1
    )
  ) = ' ' THEN 'Not Detected' ELSE TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 2), 
      '--', 
      -1
    )
  ) END AS `PowerShell Version`
FROM 
  computers c 
  LEFT JOIN clients cl ON cl.clientid = c.clientid 
  LEFT JOIN locations l ON l.locationid = c.locationid 
  LEFT JOIN scriptstate ss ON ss.computerid = c.computerid 
WHERE 
  ss.variable = 'PowershellVersion'
```