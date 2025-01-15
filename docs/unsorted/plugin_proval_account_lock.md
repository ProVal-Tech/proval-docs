---
id: '11fad349-3b51-4bfd-8f45-d07db1827543'
title: 'Locked Out User Account Audit'
title_meta: 'Locked Out User Account Audit'
keywords: ['lockout', 'audit', 'user', 'account', 'management']
description: 'This document outlines the process of auditing locked out user accounts, detailing the necessary dependencies, table structures, and SQL commands required to manage and retrieve information on both domain and local user accounts that have been locked out.'
tags: ['account', 'database', 'security', 'report', 'setup']
draft: false
unlisted: false
---
## Purpose

The table collects the information of the Locked out user's (both domain/local) account.

## Dependencies

- [Account LockOut Audit](https://proval.itglue.com/DOC-5078775-10218265)
- [User Management - Account Lockout Audit](https://proval.itglue.com/DOC-5078775-10219462)
- [User Management - Account Lock Detail](https://proval.itglue.com/DOC-5078775-10220563)

## Tables

### plugin_proval_account_lock

| Column             | Type     | Explanation                       |
|--------------------|----------|-----------------------------------|
| Computerid         | INT      | Computerid of the agent           |
| User Name          | VARCHAR  | Locked user name                  |
| Local User         | INT      | 1 - Local User<br>0 - Domain User |
| Local Admin        | INT      | 1 - Local Admin<br>0 - Non local admin |
| Password           | INT      | 1 - Password Set<br>0 - No Password Set |
| Account Lock Date  | DATETIME | Account lock date                 |
| Last Logon         | DATETIME | Account last login date           |
| Script Run Time    | DATETIME | Script last execution date        |

## SQL

```sql
CREATE TABLE IF NOT EXISTS `plugin_proval_account_lock` (
  `computerid` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `LocalUser` tinyint(1) NOT NULL,
  `LocalAdmin` tinyint(1) NOT NULL,
  `LastLogon` datetime NOT NULL,
  `password` tinyint(1) NOT NULL,
  `Account Lock Date` datetime NOT NULL,
  `Script Run Time` datetime DEFAULT NULL,
  PRIMARY KEY (
    `computerid`, `UserName`, `Account Lock Date`
  ),
  CONSTRAINT `plugin_proval_account_lock_ibfk_1` FOREIGN KEY (`computerid`) REFERENCES `computers` (`ComputerID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8
```







