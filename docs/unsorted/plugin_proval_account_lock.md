---
id: '11fad349-3b51-4bfd-8f45-d07db1827543'
title: 'Locked Out User Account Audit'
title_meta: 'Locked Out User Account Audit'
keywords: ['lockout', 'audit', 'user', 'account', 'management']
description: 'This document outlines the process of auditing locked-out user accounts, detailing the necessary dependencies, table structures, and SQL commands required to manage and retrieve information on both domain and local user accounts that have been locked out.'
tags: ['database', 'report', 'security', 'setup']
draft: true
unlisted: false
---

## Purpose

This document collects information about locked-out user accounts (both domain and local).

## Dependencies

- [Account LockOut Audit](<../cwa/dataviews/Account LockOut Audit.md>)
- [User Management - Account Lockout Audit](<./User Management - Account Lockout Audit.md>)
- [User Management - Account Lock Detail](<./User Management - Account Lock Detail.md>)

## Tables

### plugin_proval_account_lock

| Column             | Type     | Explanation                       |
|--------------------|----------|-----------------------------------|
| Computerid         | INT      | Computer ID of the agent          |
| User Name          | VARCHAR  | Locked user name                  |
| Local User         | INT      | 1 - Local User, 0 - Domain User  |
| Local Admin        | INT      | 1 - Local Admin, 0 - Non-local Admin |
| Password           | INT      | 1 - Password Set, 0 - No Password Set |
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

