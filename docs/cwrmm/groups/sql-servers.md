---
id: '85ffcde0-01c8-4e6b-8c08-51371f80ae9c'
slug: /85ffcde0-01c8-4e6b-8c08-51371f80ae9c
title: 'SQL Servers'
title_meta: 'SQL Servers'
keywords: ['sql', 'sql-server', 'sql-server-patching']
description: 'Group of SQL Servers.'
tags: ['auditing', 'mssql', 'patching']
draft: false
unlisted: false
---

## Summary

Group of SQL Servers.

## Dependencies

- [New SQL Updates](/docs/08281245-9380-4946-b1a6-099aebfffd6f)

## Group Setup Location

**Group Path:** `ENDPOINTS` ➞ `Groups`  
**Group Type:** `Dynamic Group`

## Group Summary

**Group Name:** `SQL Servers`  
**Description:** `Group of SQL Servers.`

![Image1](../../../static/img/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c/image1.webp)

## Group Criteria

The group is defined by the following **conditions**, joined by an **AND** logic.

| Condition             | Operator        | Value(s)                                 |
|-----------------------|-----------------|------------------------------------------|
| Service Display Name  | Contains any of | `SQL Server` |
| OS Type               | Equal           | `Windows`    |
| Endpoint Type         | Equal           | `Server`     |

**Logic:** Detects Windows servers that have a service with a display name containing `SQL Server`.

![Image2](../../../static/img/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c/image2.webp)

## Completed Group

![Image3](../../../static/img/docs/85ffcde0-01c8-4e6b-8c08-51371f80ae9c/image3.webp)
