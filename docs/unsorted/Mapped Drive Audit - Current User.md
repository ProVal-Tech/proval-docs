---
id: '6e855af4-7a44-4332-a5cf-73b238c6dac7'
title: 'Mapped Network Drives for Current User'
title_meta: 'Mapped Network Drives for Current User'
keywords: ['mapped', 'network', 'drives', 'current', 'user']
description: 'This document provides a detailed overview of the mapped network drives for the currently logged-in user on a machine, including SQL representation and relevant dependencies.'
tags: []
draft: true
unlisted: false
---
## Summary

This dataview gathers a detail of the mapped network drives for the current user logged into the machine.

## Dependencies

- [Mapped Drive Audit - Current User](<./Mapped Drive Audit - Current User.md>) 
- [plugin_proval_Mapped_Drive_CurrentUser](<./plugin_proval_Mapped_Drive_CurrentUser.md>) 

## Columns

| Column           | Description                                                        |
|------------------|--------------------------------------------------------------------|
| Client           | Client name of the agent.                                         |
| Location         | Location name of the agent.                                       |
| Computer         | Computer name of the agent.                                       |
| Operating System  | Operating system information of the agent                         |
| LastContact      | LastContact of the agent                                          |
| Username         | Logged in username for which the mapped drive detected            |
| Path             | Path of the mapped drive                                          |
| TimeStamp        | Timestamp of last script ran                                       |

## SQL Representation

```
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














