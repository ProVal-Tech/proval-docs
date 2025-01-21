---
id: '59c1fe7a-2bb8-420c-bd29-938a615fe37f'
title: 'Popular Web Browser Audit - IE Included'
title_meta: 'Popular Web Browser Audit - IE Included'
keywords: ['audit', 'web', 'browser', 'internet', 'explorer', 'disabled']
description: 'This document provides a detailed dataview of the web browsers installed on agents, specifically focusing on the audit status of Internet Explorer, which has been decommissioned since June 15, 2022. It lists various browsers under audit and includes SQL representation for querying the relevant data.'
tags: ['security', 'software', 'web-browser', 'windows']
draft: true
unlisted: false
---

## Summary

This dataview shows the web browsers installed on the agent with Internet Explorer disabled status audit since it was decommissioned on June 15, 2022.

The list of browsers under audit includes: Mozilla Firefox, Google Chrome, Vivaldi, Waterfox, Librewolf, Opera, Brave, Iceweasel, Tor Browser, Pale Moon, Safari, and Chromium.

## Dependencies

[Internet Explorer - Disable](<../cwa/scripts/Internet Explorer - Disable Global, DV, Autofix.md>)

## Columns

| Column                | Description                           |
|----------------------|---------------------------------------|
| Client               | Client name of the agent              |
| Location             | Location name of the agent            |
| Computer             | Computer name of the agent            |
| Operating System     | Operating system information of the agent |
| Last Contact         | Last contact with RMM of the agent    |
| Web Browser Name     | Web browsers detected on the agent.   |
| IE Audit             | Status of IE disabled or not          |

## SQL Representation

```
SELECT 
  t.clientid, 
  t.locationid, 
  t.computerid, 
  t.Client, 
  t.Location, 
  t.Computer, 
  t.`Operating System`, 
  t.LastContact, 
  t.`Web Browser Name`, 
  t.`IE Audit` 
FROM 
  (
    SELECT 
      DISTINCT c.clientid, 
      c.locationid, 
      c.computerid, 
      cl.name AS `Client`, 
      l.name AS `Location`, 
      c.name AS `Computer`, 
      c.os AS `Operating System`, 
      c.LastContact, 
      CASE WHEN s.name IS NULL THEN 'Not Detected' ELSE s.name END AS `Web Browser Name`, 
      CASE WHEN c.computerid IN (
        SELECT 
          id 
        FROM 
          extrafielddata 
        WHERE 
          extrafieldid IN(
            SELECT 
              id 
            FROM 
              extrafield 
            WHERE 
              NAME = 'IE Disabled'
          ) 
          AND `Value` = 1
      ) THEN 'IE Disabled' ELSE 'Script No Action' END AS `IE Audit` 
    FROM 
      computers c 
      LEFT JOIN clients cl ON cl.clientid = c.clientid 
      LEFT JOIN locations l ON l.locationid = c.locationid 
      JOIN software s ON c.ComputerID = s.ComputerID 
    WHERE 
      (
        s.Name REGEXP "(Mozilla Firefox|Google Chrome|Vivaldi|Waterfox|Librewolf|Opera|Brave|Iceweasel|Tor Browser|Pale Moon|Safari|Chromium)" 
        AND c.os LIKE '%server%'
      ) 
    GROUP BY 
      c.computerid
  ) AS t
```



