---
id: '165f6290-8932-459b-9bfe-18c86f7a61d6'
title: 'VSSAdmin Storage Details'
title_meta: 'VSSAdmin Storage Details'
keywords: ['vssadmin', 'storage', 'shadowcopy', 'audit', 'database']
description: 'This document provides detailed information about the VSSAdmin storage, including its schema and dependencies. It outlines the structure of the plugin_proval_vssadminstorage table, detailing each column and its purpose, as well as the SQL statement for creating the table. Additionally, it references related documents for further context and understanding.'
tags: ['database', 'audit', 'storage', 'configuration', 'windows']
draft: false
unlisted: false
---
## Purpose

This table contains the vssadmin storage details.

## Dependencies

- [VSS Resize](https://proval.itglue.com/DOC-5078775-10728931)
- [Vssadmin List Storage Audit](https://proval.itglue.com/DOC-5078775-10728929)
- [VSSAdmin Storage Audit](https://proval.itglue.com/DOC-5078775-10728930)

## Tables

#### plugin_proval_vssadminstorage

| Column                | Type     | Explanation                                         |
|----------------------|----------|-----------------------------------------------------|
| computerid           | INT      | computerid of the agent                             |
| ShadowCopyVolume     | VARCHAR  | Volume letter where vssadmin enabled                |
| ShadowStorageUsed    | VARCHAR  | Volume storage used by vss storage                   |
| ShadowStorageAllocated| VARCHAR  | The total allocated storage space for vss storage    |
| ShadowStorageMax     | VARCHAR  | Maximum storage for the vss storage                  |
| TimeStamp            | DATETIME | Stores date when script was last executed            |

## SQL

```
CREATE TABLE IF NOT EXISTS `labtech`.`plugin_proval_vssadminstorage` (
  `computerid` INT(11) NOT NULL,
  `ShadowCopyVolume` VARCHAR(50) NOT NULL,
  `ShadowStorageUsed` VARCHAR(50) NOT NULL,
  `ShadowStorageAllocated` VARCHAR(50) NOT NULL,
  `ShadowStorageMax` VARCHAR(50) NOT NULL,
  `TimeStamp` DATETIME NOT NULL,
  PRIMARY KEY (`computerid`,`ShadowCopyVolume`),
  CONSTRAINT `plugin_proval_vssadminstorage_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `labtech`.`computers`(`ComputerID`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```







