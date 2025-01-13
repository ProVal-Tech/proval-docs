---
id: 'cwa_mapped_drive_audit_current_user'
title: 'Mapped Drive Audit - Current User'
title_meta: 'Mapped Drive Audit - Current User'
keywords: ['mapped', 'drive', 'audit', 'current', 'user']
description: 'This document outlines the structure and purpose of the table that stores mapped drive details for the currently logged-in users, including dependencies and SQL table creation instructions.'
tags: ['database', 'setup', 'windows']
draft: true
unlisted: true
---
## Purpose

This table stores the mapped drive details of the currently logged-in users.

## Dependencies

- [Mapped Drive Audit - Current User](https://proval.itglue.com/DOC-5078775-10218252)
- [Mapped Drive Audit - Current User](https://proval.itglue.com/DOC-5078775-10218252)

## Tables

### plugin_proval_Mapped_Drive_CurrentUser

| Column     | Type     | Explanation                                 |
|------------|----------|---------------------------------------------|
| Computerid | INT      | Computerid of the agent                     |
| username   | VARCHAR  | Username for which the mapped drive detected |
| Path       | VARCHAR  | Path of the mapped drive                    |
| Timestamp  | DATETIME | Script last ran date on the agent           |

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




