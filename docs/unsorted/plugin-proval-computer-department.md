---
id: 'f00a8cb1-b9db-44f6-9037-1fbe29c372b4'
slug: /f00a8cb1-b9db-44f6-9037-1fbe29c372b4
title: 'plugin_proval_computer_department'
title_meta: 'plugin_proval_computer_department'
keywords: ['ad', 'users', 'department', 'domain', 'servers', 'sql', 'database']
description: 'This document outlines the process for listing the Active Directory users department information from Domain servers, including the necessary SQL commands to create custom tables for auditing purposes.'
tags: ['active-directory', 'database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

This document lists the Active Directory (AD) users' department information from the Domain servers.

## Dependencies

- Computer Department Auditing -- Script

## Table

#### custom_proval_computer_department

| Column      | Type    | Explanation                                   |
|-------------|---------|-----------------------------------------------|
| computerid  | INT     | The AD Server computer ID                     |
| clientid    | INT     | The client ID of the AD Server                |
| locationid  | INT     | The location where the AD server is located.  |
| username     | VARCHAR | The username of the audited user.             |
| department   | VARCHAR | The department of the audited user.           |

## SQL

Put the SQL to create the custom tables here:

```sql
CREATE TABLE IF NOT EXISTS `labtech`.`plugin_proval_computer_department` (
  `computerid` INT(11) NOT NULL,
  `clientid` INT(11) NOT NULL,
  `locationid` INT(11) NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `department` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`computerid`, `username`),
  CONSTRAINT `plugin_proval_computer_department_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `labtech`.`computers`(`computerid`) ON UPDATE NO ACTION ON DELETE CASCADE
);
```


