---
id: 'f5668e2a-a631-4d79-aa44-54ad3c9ed4c6'
slug: /f5668e2a-a631-4d79-aa44-54ad3c9ed4c6
title: 'Windows Media Player Audit'
title_meta: 'Windows Media Player Audit'
keywords: ['media', 'player', 'audit', 'report', 'state', 'feature']
description: 'This document provides a comprehensive overview of the Media Player state audit report, detailing whether the feature is enabled or not. It includes SQL representation and a breakdown of relevant columns and their descriptions.'
tags: ['database', 'performance', 'report', 'windows']
draft: false
unlisted: false
---

## Summary

This document presents the Media Player state audit report, indicating whether the feature is enabled or not.

## Dependencies

- @Media Feature Pack Audit - Script

## Columns

| Column               | Description                                      |
|---------------------|--------------------------------------------------|
| Client              | Client name of the agent                         |
| Location            | Location name of the agent                       |
| Computer            | Computer name of the agent                       |
| Operating System    | Operating system of the agent                    |
| Agent State         | Agent status, whether online or offline          |
| Feature Name        | Windows optional feature name                    |
| Display Name        | Display name of the optional feature             |
| Description         | Description of the Windows optional feature      |
| Reboot Required     | Indicates if a reboot is required for the feature|
| MediaPlayer State   | MediaPlayer state, whether enabled or disabled   |

## SQL Representation

```sql
SELECT 
  cl.name AS `Client`, 
  l.name AS `Location`, 
  c.name AS `Computer`, 
  c.os AS `Operating System`, 
  CASE WHEN c.LastContact > NOW() - INTERVAL 15 MINUTE THEN 'Online' ELSE 'Offline' END AS `Agent State`, 
  c.computerid, 
  c.clientid, 
  c.locationid, 
  TRIM(
    SUBSTRING_INDEX(ss.value, '--', 1)
  ) AS `Feature Name`, 
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
  ) END AS `Display Name`, 
  CASE WHEN TRIM(
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
  ) END AS `Description`, 
  CASE WHEN TRIM(
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
  ) END AS `Reboot Required`, 
  CASE WHEN TRIM(
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
  ) END AS `MediaPlayer State` 
FROM 
  computers c 
  LEFT JOIN clients cl ON cl.clientid = c.clientid 
  LEFT JOIN locations l ON l.locationid = c.locationid 
  LEFT JOIN scriptstate ss ON ss.computerid = c.computerid 
WHERE 
  ss.variable = 'MediaPlayerCheck'
```