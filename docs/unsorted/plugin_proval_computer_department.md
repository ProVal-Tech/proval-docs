---
id: 'cwa_ad_users_department_info'
title: 'AD Users Department Information for Domain Servers'
title_meta: 'AD Users Department Information for Domain Servers'
keywords: ['ad', 'users', 'department', 'domain', 'servers', 'sql', 'database']
description: 'This document outlines the process for listing the Active Directory users department information from Domain servers, including the necessary SQL commands to create custom tables for auditing purposes.'
tags: ['active-directory', 'database', 'report', 'setup']
draft: true
unlisted: true
---
## Purpose

Lists the AD Users department information of the Domain servers.

## Dependencies

@Computer Department Auditing -- Script

## Table

#### custom_proval_computer_department

| Column      | Type    | Explanation                                   |
|-------------|---------|-----------------------------------------------|
| computerid  | INT     | The AD Server computer id                     |
| clientid    | INT     | The client id of the AD Server                |
| locationid  | INT     | The location where the AD server is located.  |
| username     | VARCHAR | The username of the audited user.             |
| department   | VARCHAR | The department of the audited user.           |

## SQL

Put the SQL to create the custom tables here:

```
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




