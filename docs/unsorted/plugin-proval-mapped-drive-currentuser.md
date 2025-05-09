---
id: '5ec5392b-3704-4969-aab6-7a59a603b3ea'
slug: /5ec5392b-3704-4969-aab6-7a59a603b3ea
title: 'plugin_proval_Mapped_Drive_CurrentUser'
title_meta: 'plugin_proval_Mapped_Drive_CurrentUser'
keywords: ['mapped', 'drive', 'audit', 'current', 'user']
description: 'This document outlines the structure and purpose of the table that stores mapped drive details for the currently logged-in users, including dependencies and SQL table creation instructions.'
tags: ['database', 'setup', 'windows']
draft: false
unlisted: true
---

## Purpose

This table stores the mapped drive details of the currently logged-in users.

## Dependencies

- [Mapped Drive Audit - Current User](/docs/6e855af4-7a44-4332-a5cf-73b238c6dac7)
- [Mapped Drive Audit - Current User](/docs/6e855af4-7a44-4332-a5cf-73b238c6dac7)

## Tables

### plugin_proval_Mapped_Drive_CurrentUser

| Column     | Type     | Explanation                                 |
|------------|----------|---------------------------------------------|
| Computerid | INT      | Computer ID of the agent                    |
| username   | VARCHAR  | Username for which the mapped drive is detected |
| Path       | VARCHAR  | Path of the mapped drive                    |
| Timestamp  | DATETIME | Script last run date on the agent           |

## SQL

```
CREATE TABLE IF NOT EXISTS `labtech`.`plugin_proval_Mapped_Drive_CurrentUser` (
  `computerid` INT(11) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `Path` VARCHAR(5000) NOT NULL,
  `TimeStamp` DATETIME NOT NULL,
  CONSTRAINT `plugin_proval_Mapped_Drive_CurrentUser_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `labtech`.`computers`(`ComputerID`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```