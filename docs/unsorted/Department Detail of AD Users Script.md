---
id: '00ba69e7-ba56-4582-b675-0d6bb9db89dc'
slug: /00ba69e7-ba56-4582-b675-0d6bb9db89dc
title: 'Department Detail of AD Users Script'
title_meta: 'Department Detail of AD Users Script'
keywords: ['ad', 'users', 'department', 'information', 'database']
description: 'This document provides an overview of the dataview that stores department information for Active Directory (AD) users, including its dependencies, columns, and SQL representation for querying the data.'
tags: ['active-directory', 'database', 'report']
draft: true
unlisted: false
---

## Summary

This dataview stores the AD Users department information.

## Dependencies

- [plugin_proval_computer_department](<./plugin_proval_computer_department.md>)
- [Computer Department Auditing [DV]](<../cwa/scripts/Computer Department AuditingDV.md>)

## Columns

| Column            | Description                                                 |
|-------------------|-------------------------------------------------------------|
| Client Name       | Client Name of the DC Server                                |
| Location Name     | Location Name of the DC Server                              |
| Computer Name     | Computer Name of the DC Server                              |
| Operating System   | Operating System of the DC Server                           |
| Department        | Department information of the AD Users of the DC Server    |
| UserName          | User name list of the DC server                             |

## SQL Representation

```sql
SELECT 
  cl.name AS `Client Name`, 
  l.name AS `Location Name`, 
  c.name AS `Computer Name`, 
  c.os AS `Operating System`, 
  pp.UserName, 
  pp.department AS `User Department` 
FROM 
  computers c 
  JOIN clients cl ON c.clientid = cl.clientid 
  JOIN locations l ON l.locationid = c.locationid 
  JOIN plugin_proval_computer_department pp ON pp.computerid = c.computerid
```


