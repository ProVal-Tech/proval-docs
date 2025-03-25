---
id: '40cf6430-7ec1-496c-8e6e-b92a499120e6'
slug: /40cf6430-7ec1-496c-8e6e-b92a499120e6
title: 'Account LockOut Audit'
title_meta: 'Account LockOut Audit'
keywords: ['account', 'lock', 'user', 'details', 'local', 'domain']
description: 'This document provides a comprehensive overview of account lock details for both local and domain users, including SQL representation and relevant dependencies for effective user management.'
tags: ['sql']
draft: false
unlisted: false
---

## Summary

This document provides detailed information about account locks for both local and domain users.

## Dependencies

- [User Management - Account Lockout Audit](<../../cwa/Scripts/User Management - Account Lockout Audit.md>)
- [plugin_proval_account_lock](<../../cwa/tables/plugin_proval_account_lock.md>)

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