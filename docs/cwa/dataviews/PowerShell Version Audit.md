---
id: 'ps-current-agent-powershell-versions'
title: 'Current Agent PowerShell Versions'
title_meta: 'Current Agent PowerShell Versions'
keywords: ['agent', 'powershell', 'version', 'audit', 'rmm']
description: 'This document provides a dataview that shows the current PowerShell versions installed on agents, along with details such as client name, location, operating system, and last contact information. It also includes SQL representation for querying this data.'
tags: ['client', 'location', 'computer', 'operating-system', 'lastcontact', 'script', 'database']
draft: false
unlisted: false
---
## Summary

This dataview shows current agent PowerShell versions.

## Dependencies

[PowerShell Version Audit](https://proval.itglue.com/DOC-5078775-10218295)

## Columns

| Column              | Description                                      |
|---------------------|--------------------------------------------------|
| Client              | Client Name of the agent                         |
| Location            | Location Name of the agent                       |
| Computer            | Computer Name of the agent                       |
| Operating System    | Operating System of the agent                    |
| LastContact         | Last Contact of the agent with the RMM          |
| PowerShell Version   | PowerShell version on the agent                  |
| Script Run Time     | The last date when the PowerShell version was checked |

## SQL Representation

```
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


