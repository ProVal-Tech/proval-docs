---
id: '11fad349-3b51-4bfd-8f45-d07db1827543'
slug: /11fad349-3b51-4bfd-8f45-d07db1827543
title: 'plugin_proval_account_lock'
title_meta: 'plugin_proval_account_lock'
keywords: ['lockout', 'audit', 'user', 'account', 'management']
description: 'This document outlines the process of auditing locked-out user accounts, detailing the necessary dependencies, table structures, and SQL commands required to manage and retrieve information on both domain and local user accounts that have been locked out.'
tags: ['database', 'report', 'security', 'setup']
draft: false
unlisted: false
---

## Purpose

This document collects information about locked-out user accounts (both domain and local).

## Dependencies

- [Account LockOut Audit](<../../cwa/dataviews/Account LockOut Audit.md>)
- [User Management - Account Lockout Audit](<../../cwa/Scripts/User Management - Account Lockout Audit.md>)

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
