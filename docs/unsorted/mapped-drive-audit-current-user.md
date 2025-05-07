---
id: '6e855af4-7a44-4332-a5cf-73b238c6dac7'
slug: /6e855af4-7a44-4332-a5cf-73b238c6dac7
title: 'Mapped Drive Audit - Current User'
title_meta: 'Mapped Drive Audit - Current User'
keywords: ['mapped', 'network', 'drives', 'current', 'user']
description: 'This document provides a detailed overview of the mapped network drives for the currently logged-in user on a machine, including SQL representation and relevant dependencies.'
tags: []
draft: false
unlisted: true
---

## Summary

This document gathers details of the mapped network drives for the current user logged into the machine.

## Dependencies

- [Mapped Drive Audit - Current User](/docs/6e855af4-7a44-4332-a5cf-73b238c6dac7) 
- [plugin_proval_Mapped_Drive_CurrentUser](/docs/5ec5392b-3704-4969-aab6-7a59a603b3ea) 

## Columns

| Column           | Description                                                        |
|------------------|--------------------------------------------------------------------|
| Client           | Client name of the agent.                                         |
| Location         | Location name of the agent.                                       |
| Computer         | Computer name of the agent.                                       |
| Operating System  | Operating system information of the agent                         |
| LastContact      | Last contact of the agent                                          |
| Username         | Logged-in username for which the mapped drive is detected         |
| Path             | Path of the mapped drive                                          |
| TimeStamp        | Timestamp of the last script run                                   |

## SQL Representation

```sql
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.name as `Client`, 
  l.name as `Location`, 
  c.name as `Computer`, 
  c.os as `Operating System`, 
  c.LastContact, 
  ppc.UserName, 
  ppc.Path, 
  ppc.Timestamp 
FROM 
  computers c 
  JOIN locations l ON l.LocationID = c.LocationID 
  JOIN clients cl ON cl.ClientID = c.ClientID 
  JOIN plugin_proval_Mapped_Drive_CurrentUser ppc ON ppc.computerid = c.ComputerID
```
