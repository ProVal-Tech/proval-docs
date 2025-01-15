---
id: '40cf6430-7ec1-496c-8e6e-b92a499120e6'
title: 'Account Lock Details for Local and Domain Users'
title_meta: 'Account Lock Details for Local and Domain Users'
keywords: ['account', 'lock', 'user', 'details', 'local', 'domain']
description: 'This document provides a comprehensive overview of account lock details for both local and domain users, including SQL representation and relevant dependencies for effective user management.'
tags: ['user', 'management', 'account', 'lockout', 'sql', 'detail']
draft: false
unlisted: false
---
## Summary

This dataview shows the account lock detailed information of both local or domain users.

## Dependencies

- [User Management - Account Lockout Audit](https://proval.itglue.com/DOC-5078775-10219462)
- [plugin_proval_account_lock](https://proval.itglue.com/DOC-5078775-10220562)
- [User Management - Account Lock Detail](https://proval.itglue.com/DOC-5078775-10220563)

## Columns

| Column             | Description                                            |
| ------------------ | ------------------------------------------------------ |
| Client             | Client name of the agent                               |
| Location           | Location name of the agent                             |
| Computer           | Computer Name of the agent                             |
| Operating System   | Operating system info of the agent                     |
| Last Contact       | Last contact of agent with the RMM                     |
| User Name          | User Name locked out                                   |
| Local User         | Locked user detail whether local or domain             |
| Local Admin        | Locked user info whether local admin or not            |
| Last Logon of User | Last login date of the locked user                     |
| Password           | Locked user password information whether set or not    |
| Account Lock Date  | Locked user date/time when the account locked          |
| Script Run Time    | Script run time to show when the account lock detected |

## SQL Representation

```
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






