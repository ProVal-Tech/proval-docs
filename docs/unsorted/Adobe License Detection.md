---
id: 'cf0c479b-fce8-4af8-9ae2-24fd7fc2a7ed'
title: 'Adobe License Information Dataview'
title_meta: 'Adobe License Information Dataview'
keywords: ['adobe', 'license', 'rmm', 'dataview', 'sql']
description: 'This document provides a detailed overview of the Adobe License information dataview, including its dependencies, columns, and SQL representation for retrieving the relevant data from the database.'
tags: ['database', 'report', 'software']
draft: true
unlisted: false
---
## Summary

This dataview displays Adobe License information.

## Dependencies

[Adobe License Detail](https://proval.itglue.com/DOC-5078775-10218281)

## Columns

| Column             | Description                             |
|--------------------|-----------------------------------------|
| Client Name        | Client Name of the agent                |
| Location Name      | Location Name of the agent              |
| Computer Name      | Computer Name of the agent              |
| Operating System    | Operating System of the agent           |
| Last Contact       | Last Contact of the agent with the RMM  |
| Adobe License      | Adobe License information                |

## SQL Representation

```
SELECT 
  t.`Client Name`, 
  t.`Location Name`, 
  t.`Computer Name`, 
  t.`Operating System`, 
  t.`Last Contact`, 
  t.`Adobe License` 
FROM 
  (
    SELECT 
      c.clientid, 
      c.locationid, 
      c.computerid, 
      cl.name AS `Client Name`, 
      l.name AS `Location Name`, 
      c.name AS `Computer Name`, 
      c.os AS `Operating System`, 
      c.lastcontact AS `Last Contact`, 
      CASE WHEN edc.value IS NULL THEN 'Not Detected' ELSE edc.value END AS `Adobe License` 
    FROM 
      computers c 
      LEFT JOIN clients cl ON cl.clientid = c.clientid 
      LEFT JOIN locations l ON l.locationid = c.locationid 
      LEFT JOIN (
        SELECT 
          ef.id, 
          ef.Value, 
          e.name 
        FROM 
          extrafielddata ef 
          JOIN extrafield e ON ef.extrafieldid = e.id 
        WHERE 
          ef.extrafieldid IN (
            SELECT 
              id 
            FROM 
              extrafield 
            WHERE 
              NAME = 'Adobe License Key'
          )
      ) edc ON edc.id = c.computerid 
      LEFT JOIN software s ON s.computerid = c.computerid 
    WHERE 
      s.name LIKE '%Adobe%' 
    GROUP BY 
      c.computerid
  ) AS t
```













