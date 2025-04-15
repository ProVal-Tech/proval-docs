---
id: '165f6290-8932-459b-9bfe-18c86f7a61d6'
slug: /165f6290-8932-459b-9bfe-18c86f7a61d6
title: 'plugin_proval_vssadminstorage'
title_meta: 'plugin_proval_vssadminstorage'
keywords: ['vssadmin', 'storage', 'shadowcopy', 'audit', 'database']
description: 'This document provides detailed information about the VSSAdmin storage, including its schema and dependencies. It outlines the structure of the plugin_proval_vssadminstorage table, detailing each column and its purpose, as well as the SQL statement for creating the table. Additionally, it references related documents for further context and understanding.'
tags: ['database', 'storage', 'windows']
draft: false
unlisted: false
---

## Purpose

This table contains the VSSAdmin storage details.

## Dependencies

- [VSS Resize](/docs/0600e89c-06a5-42da-9ed8-41e43d9cfd7d)
- [Vssadmin List Storage Audit](/docs/0de90f98-d7ae-4a79-a851-30829a596846)
- [VSSAdmin Storage Audit](/docs/7f7e7d3b-047d-41dc-acc2-5083adcaaf39)

## Tables

#### plugin_proval_vssadminstorage

| Column                | Type     | Explanation                                         |
|----------------------|----------|-----------------------------------------------------|
| computerid           | INT      | Computer ID of the agent                            |
| ShadowCopyVolume     | VARCHAR  | Volume letter where VSSAdmin is enabled            |
| ShadowStorageUsed    | VARCHAR  | Volume storage used by VSS storage                  |
| ShadowStorageAllocated| VARCHAR  | The total allocated storage space for VSS storage   |
| ShadowStorageMax     | VARCHAR  | Maximum storage for the VSS storage                 |
| TimeStamp            | DATETIME | Stores the date when the script was last executed   |

## SQL

```sql
CREATE TABLE IF NOT EXISTS `labtech`.`plugin_proval_vssadminstorage` (
  `computerid` INT(11) NOT NULL,
  `ShadowCopyVolume` VARCHAR(50) NOT NULL,
  `ShadowStorageUsed` VARCHAR(50) NOT NULL,
  `ShadowStorageAllocated` VARCHAR(50) NOT NULL,
  `ShadowStorageMax` VARCHAR(50) NOT NULL,
  `TimeStamp` DATETIME NOT NULL,
  PRIMARY KEY (`computerid`, `ShadowCopyVolume`),
  CONSTRAINT `plugin_proval_vssadminstorage_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `labtech`.`computers`(`ComputerID`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```


