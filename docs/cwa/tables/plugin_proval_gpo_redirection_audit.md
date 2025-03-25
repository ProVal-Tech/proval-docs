---
id: '025887c2-41a2-4e85-b706-dc0841a104d9'
slug: /025887c2-41a2-4e85-b706-dc0841a104d9
title: 'plugin_proval_gpo_redirection_audit'
title_meta: 'plugin_proval_gpo_redirection_audit'
keywords: ['gpo', 'audit', 'dataview', 'redirection', 'settings']
description: 'This document outlines the setup of a table for storing data displayed in the Redirection-Audit Dataview, populated by the Audit - GPO Redirection Settings script. It includes details on table structure, dependencies, and SQL commands for table creation.'
tags: ['database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This table will store the data to be displayed in the Redirection-Audit Dataview. It is populated by the Audit - GPO Redirection Settings script.

## Dependencies

[EPM - Data Collection - Script - Audit - GPO Redirection Settings](<../scripts/Audit - GPO Redirection Settings.md>)

## Tables

#### plugin_proval_gpo_redirection_audit

| Column         | Type          | Explanation                                             |
|----------------|---------------|--------------------------------------------------------|
| ComputerID     | INT           | References the computer the data was collected from.   |
| User           | VARCHAR(50)   | References the user account that the data was found on.|
| PropertyName   | VARCHAR(100)  | References the specific property that is holding the data. |
| SettingType    | VARCHAR(25)   | The type of setting being shown (Global or Folder).    |
| Description     | TEXT          | The description of what the property is setting, if known. |
| Value          | TEXT          | The value assigned to the property.                     |

## SQL

```
CREATE TABLE IF NOT EXISTS `@TableName@` (
    `ComputerID` INT NOT NULL,
    `User` VARCHAR(50) NOT NULL DEFAULT '0',
    `PropertyName` VARCHAR(100) NOT NULL DEFAULT '0',
    `SettingType` VARCHAR(25) NULL DEFAULT NULL,
    `Description` TEXT(150) NULL,
    `Value` TEXT(200) NULL,
    PRIMARY KEY (`ComputerID`, `User`, `PropertyName`)
)
COLLATE='utf8_general_ci';
```


