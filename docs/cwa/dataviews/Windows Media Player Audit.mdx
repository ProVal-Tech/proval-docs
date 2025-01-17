---
id: 'f5668e2a-a631-4d79-aa44-54ad3c9ed4c6'
title: 'Media Player State Audit Report'
title_meta: 'Media Player State Audit Report'
keywords: ['media', 'player', 'audit', 'report', 'state', 'feature']
description: 'This document provides a comprehensive overview of the Media Player state audit report, detailing whether the feature is enabled or not. It includes SQL representation and a breakdown of relevant columns and their descriptions.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---
## Summary

This dataview gives the Media Player state audit report whether enabled or not.

## Dependencies

- @Media Feature Pack Audit - Script

## Columns

| Column               | Description                                      |
|---------------------|--------------------------------------------------|
| Client              | Client Name of the agent                         |
| Location            | Location Name of the agent                       |
| Computer            | Computer name of the agent                       |
| Operating System    | Operating system of the agent                    |
| Agent State         | Agent status whether online or offline           |
| Feature Name        | Windows optional feature name                    |
| Display Name        | Display name of the optional feature             |
| Description         | Description of the windows optional feature      |
| Reboot Required     | Reboot required for the feature                  |
| MediaPlayer State   | MediaPlayer state whether enabled or disabled    |

## SQL Representation

```
SELECT 
  cl.name as `Client`, 
  l.name as `Location`, 
  c.name as `Computer`, 
  c.os as `Operating System`, 
  CasE WHEN c.LastContact > NOW() - INTERVAL 15 MINUTE THEN 'Online' ELSE 'Offline' END as `Agent State`, 
  c.computerid, 
  c.clientid, 
  c.locationid, 
  TRIM(
    SUBSTRING_INDEX(ss.value, '--', 1)
  ) as `Feature Name`, 
  CasE WHEN TRIM(
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
  ) END as `Display Name`, 
  CasE WHEN TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 3), 
      '--', 
      -1
    )
  ) = ' ' THEN 'Not Detected' ELSE TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 3), 
      '--', 
      -1
    )
  ) END as `Description`, 
  CasE WHEN TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 4), 
      '--', 
      -1
    )
  ) = ' ' THEN 'Not Detected' ELSE TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 4), 
      '--', 
      -1
    )
  ) END as `Reboot Required`, 
  CasE WHEN TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 5), 
      '--', 
      -1
    )
  ) = ' ' THEN 'Not Detected' ELSE TRIM(
    SUBSTRING_INDEX(
      SUBSTRING_INDEX(ss.value, '--', 5), 
      '--', 
      -1
    )
  ) END as `MediaPlayer State` 
FROM 
  computers c 
  LEFT JOIN clients cl ON cl.clientid = c.clientid 
  LEFT JOIN locations l ON l.locationid = c.locationid 
  LEFT JOIN scriptstate ss ON ss.computerid = c.computerid 
WHERE 
  ss.variable = 'MediaPlayerCheck'
```












