---
id: '9eee7f2a-78f1-4243-b681-6b36b56c1c9f'
title: 'Volume Exhaustion Information Storage'
title_meta: 'Volume Exhaustion Information Storage for Monitoring'
keywords: ['volume', 'storage', 'monitoring', 'database', 'exhaustion', 'space']
description: 'This document outlines the structure and purpose of the volume exhaustion information storage, detailing the necessary SQL table and its dependencies for effective monitoring of disk space on target computers.'
tags: ['database', 'performance', 'setup', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores volume exhaustion information from [Volume Free Space - Monitor Creation](<../scripts/Create Predictive Volume Exhaustion Monitors.md>).

## Dependencies

[Volume Free Space - Monitor Creation](<../scripts/Create Predictive Volume Exhaustion Monitors.md>)

## Tables

#### plugin_proval_volume_exhaustion

| Column          | Type    | Explanation                                                                 |
|-----------------|---------|-----------------------------------------------------------------------------|
| ComputerID      | INT     | The ID of the target computer                                               |
| DriveLetter     | VARCHAR | The drive letter of the volume                                              |
| Size            | BIGINT  | The size of the volume in bytes                                            |
| SizeRemaining   | BIGINT  | The amount of space remaining in bytes                                      |
| ExhaustionDate  | DATETIME| The date and time that this volume is estimated to run out of space.       |
| Timestamp       | DATETIME| The last time data was gathered for this volume.                           |

## SQL

```
CREATE TABLE `plugin_proval_volume_exhaustion` (
    `ComputerID` INT(11) NOT NULL,
    `DriveLetter` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
    `Size` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
    `SizeRemaining` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0',
    `ExhaustionDate` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
    `Timestamp` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`ComputerID`, `DriveLetter`) USING BTREE,
    CONSTRAINT `FK1_plugin_proval_volume_exhaustion` FOREIGN KEY (`ComputerID`) REFERENCES `computers` (`ComputerID`) ON UPDATE NO ACTION ON DELETE CASCADE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
```













