---
id: '3f87f890-c2b4-4f01-b9e2-c1828cc164c9'
slug: /3f87f890-c2b4-4f01-b9e2-c1828cc164c9
title: 'EPM - Windows Configuration - Dataview - Department Detail of Computer'
title_meta: 'EPM - Windows Configuration - Dataview - Department Detail of Computer'
keywords: ['department', 'user', 'computer', 'client', 'location', 'os', 'memory', 'cpu', 'drive', 'sql']
description: 'This document provides a detailed view of the department information for the last logged in user on each machine within the client environment. It includes dependencies, column descriptions, and an SQL representation to help retrieve the relevant data efficiently.'
tags: ['database', 'performance', 'report', 'security', 'windows']
draft: false
unlisted: true
---

## Summary

This dataview will store the department detail of the last logged in user on each machine in the client environment.

## Dependencies

- [plugin_proval_computer_department](/docs/f00a8cb1-b9db-44f6-9037-1fbe29c372b4)
- [Computer Department Auditing [DV]](/docs/f3c63891-aac1-49f9-a05d-552886c5b6da)

## Columns

| Column                | Description                                             |
|----------------------|---------------------------------------------------------|
| Client Name          | Client Name                                            |
| Location Name        | Location Name                                          |
| Computer Name        | Computer Name                                          |
| Operating System     | Operating System of the agent                          |
| Last Contact         | Last Contact of the agent                              |
| Department           | Department information of the last logged in user     |
| Last Logged in User  | Last logged in user on the agent                       |
| CPU Utilization      | CPU utilization detail                                  |
| Total Memory         | Total Memory of the agent                              |
| Available Memory     | Available memory of the agent                          |
| Drive Letter         | Drive letter of the agent                              |
| Drive Size           | Drive total size                                       |
| Drive Free Space     | Drive free space on the agent                          |
| Drive Model          | Drive file model information                            |
| Drive Missing        | Information on whether the drive is missing in CW Automate |
| Drive Free Percent    | Drive free info in percentage format                   |

## SQL Representation

```sql
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.name AS `Client Name`, 
  l.name AS `Location Name`, 
  c.name AS `Computer Name`, 
  c.OS AS `Operating System`, 
  c.LastContact AS `Last Contact`, 
  c.LastUserName AS `Last Logged In User`, 
  CONCAT(c.cpuusage, '%') AS `CPU Utilization`, 
  CONCAT(
    ROUND(c.totalmemory / 1024), 
    ' GB'
  ) AS `Total Memory`, 
  CONCAT(
    ROUND(c.memoryavail / 1024), 
    ' GB'
  ) AS `Available Memory`, 
  d.DriveID AS `DriveID`, 
  d.Letter AS `Drive Letter`, 
  CONCAT(
    ROUND(d.Size / 1024), 
    ' GB'
  ) AS `Drive Size`, 
  CONCAT(
    ROUND(d.Free / 1024), 
    ' GB'
  ) AS `Drive Free Space`, 
  d.FileSystem AS `Drive FileSystem`, 
  d.Model AS `Drive Model`, 
  d.Missing AS `Drive Missing`, 
  CONCAT(
    ROUND(
      (
        (d.Free / d.Size) * 100
      ), 
      0
    ), 
    '%'
  ) AS `Drive Free Percent`, 
  CASE 
    WHEN ve.`Computer Department` IS NULL THEN 'Not Detected' 
    WHEN ve.`Computer Department` = '' THEN 'Not Detected' 
    ELSE ve.`Computer Department` 
  END AS `Department` 
FROM 
  computers c 
  LEFT JOIN clients cl ON cl.clientid = c.clientid 
  LEFT JOIN locations l ON l.locationid = c.locationid 
  LEFT JOIN drives d ON d.computerid = c.computerid 
  LEFT JOIN `v_extradatacomputers` ve ON ve.computerid = c.computerid 
WHERE 
  d.FileSystem NOT IN (
    'CDFS', 'UKNFS', 'DVDFS', 'FAT', 'FAT32', 
    'NetFS'
  ) 
  AND d.missing = '0'
```