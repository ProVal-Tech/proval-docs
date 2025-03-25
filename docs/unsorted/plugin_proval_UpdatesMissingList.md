---
id: '7e520489-d8bc-4282-b147-d0c33f5a7130'
slug: /7e520489-d8bc-4282-b147-d0c33f5a7130
title: 'plugin_proval_UpdatesMissingList'
title_meta: 'plugin_proval_UpdatesMissingList'
keywords: ['patches', 'audit', 'updates', 'database', 'sql', 'agent', 'proval']
description: 'This document provides a detailed overview of the Missing Patches Audit, including the structure of the missing patches details table, its dependencies, and the SQL command to create the necessary table for tracking missing patches directly from the agent using the PSWindowsUpdate module.'
tags: ['database', 'report', 'software', 'update']
draft: true
unlisted: false
---

## Purpose

This document contains the details of missing patches directly from the agent using the PSWindowsUpdate module.

## Dependencies

- [Missing Patches Audit](https://proval.itglue.com/DOC-5078775-9371056)
- [Patching Audit](https://proval.itglue.com/DOC-5078775-10219452)

## Tables

### plugin_proval_UpdatesMissingList

| Column       | Type     | Explanation                             |
|--------------|----------|-----------------------------------------|
| computerid   | INT      | Computer ID of the agent                |
| SerialNumber | INT      | Missing patches list with incremental (1, 2, 3, ...) |
| KB           | VARCHAR  | Missing patches KB number               |
| Title        | VARCHAR  | Missing patches detail                   |
| Size         | VARCHAR  | Missing patch file size                 |
| ReleaseDate  | DATETIME | Missing patch release date              |
| TimeStamp    | DATETIME | Script last run time date               |

## SQL

```sql
CREATE TABLE IF NOT EXISTS `plugin_proval_UpdatesMissingList` (
  `SerialNumber` INT(5) NOT NULL AUTO_INCREMENT,
  `computerid` INT(11) NOT NULL,
  `KB` VARCHAR(50) NOT NULL,
  `Title` VARCHAR(250) NOT NULL,
  `Size` VARCHAR(50) NOT NULL,
  `ReleaseDate` VARCHAR(100) NOT NULL,
  `TimeStamp` DATETIME NOT NULL,
  PRIMARY KEY (`SerialNumber`),
  CONSTRAINT `plugin_proval_UpdatesMissingList_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `computers` (`ComputerID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = INNODB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;
```


