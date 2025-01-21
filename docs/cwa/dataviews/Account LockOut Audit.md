---
id: '40cf6430-7ec1-496c-8e6e-b92a499120e6'
title: 'Account Lock Details for Local and Domain Users'
title_meta: 'Account Lock Details for Local and Domain Users'
keywords: ['account', 'lock', 'user', 'details', 'local', 'domain']
description: 'This document provides a comprehensive overview of account lock details for both local and domain users, including SQL representation and relevant dependencies for effective user management.'
tags: ['sql']
draft: false
unlisted: false
---

## Summary

This document provides detailed information about account locks for both local and domain users.

## Dependencies

- [User Management - Account Lockout Audit](<../../unsorted/User Management - Account Lockout Audit.md>)
- [plugin_proval_account_lock](<../../unsorted/plugin_proval_account_lock.md>)
- [User Management - Account Lock Detail](<../../unsorted/User Management - Account Lock Detail.md>)

## Columns

| Column             | Description                                            |
| ------------------ | ------------------------------------------------------ |
| Client             | Client name of the agent                               |
| Location           | Location name of the agent                             |
| Computer           | Computer name of the agent                             |
| Operating System   | Operating system information of the agent              |
| Last Contact       | Last contact of the agent with the RMM                |
| User Name          | User name that was locked out                          |
| Local User         | Indicates whether the locked user is local or domain   |
| Local Admin        | Indicates whether the locked user is a local admin     |
| Last Logon of User | Last login date of the locked user                     |
| Password           | Indicates whether the locked user’s password is set    |
| Account Lock Date  | Date and time when the account was locked              |
| Script Run Time    | Script run time indicating when the account lock was detected |

## SQL Representation

```sql
SELECT 
  c.clientid, 
  c.locationid, 
  c.computerid, 
  cl.`Name` as `Client`, 
  l.`Name` as `Location`, 
  c.`Name` as `Computer`, 
  c.`OS` as `Operating System`, 
  c.`LastContact`, 
  p.UserName as `User Name`, 
  IF(p.LocalUser = 1, 'True', 'False') as `Local User`, 
  IF(p.LocalAdmin = 1, 'True', 'False') as `Local Admin`, 
  p.LastLogon as `Last Logon of User`, 
  IF(p.Password = 1, 'Set', 'Not Set') as `Password`, 
  p.`Account Lock Date`, 
  p.`Script Run Time` as `Script Run Time` 
FROM 
  computers c 
  JOIN clients cl ON cl.`ClientID` = c.`ClientID` 
  JOIN locations l ON l.`LocationID` = c.`LocationID` 
  JOIN plugin_proval_account_lock p ON p.computerid = c.`ComputerID`
```

