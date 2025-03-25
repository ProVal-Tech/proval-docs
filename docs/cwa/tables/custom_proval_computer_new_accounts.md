---
id: '64d9813f-2eba-4448-8d78-c9a001979ee9'
slug: /64d9813f-2eba-4448-8d78-c9a001979ee9
title: 'custom_proval_computer_new_accounts'
title_meta: 'custom_proval_computer_new_accounts'
keywords: ['proval', 'accounts', 'audit', 'database', 'user']
description: 'This document details the structure and purpose of the custom_proval_computer_new_accounts table, which is designed to store information about newly created accounts on the server. It includes dependencies, column types, and explanations for each field in the table.'
tags: ['database']
draft: false
unlisted: false
---

## Purpose

The table named: **custom_proval_computer_new_accounts** is built to store all information about the newly created accounts on the server. It is created by a script named: **User Management - New Local Account Audit And Disable [DV, Autofix, Global]**.

## Dependencies

- [ProVal - Submitted - New Account Detection](https://proval.itglue.com/DOC-5078775-7695147)  
- [User Management - New Local Account Audit And Disable [DV, Autofix, Global]](<../../unsorted/User Management - New Local Account Audit And Disable DV, Autofix, Global.md>)  
- [New Account Audit and Disable For Approve [Script]](https://proval.itglue.com/DOC-5078775-7695146)  
- [User Management - Approved New User - Activate [DV, Param]](<../scripts/User Management - Approved New User - Activate DV, Param.md>)  

## Table

### custom_proval_computer_new_accounts

| Column                    | Type     | Explanation                                                                                          |
|--------------------------|----------|------------------------------------------------------------------------------------------------------|
| computerid               | INT      | Stores the computer ID of the computer.                                                             |
| Creator UserName         | VARCHAR  | Stores the username of the person who created the new account.                                       |
| Creator LocalUser        | TINYINT  | Indicates whether the creator of the new account is local or domain (1 - Local, 0 - Domain).       |
| Creator LocalAdmin       | TINYINT  | Indicates whether the creator of the new account is an admin or non-admin (1 - Admin, 0 - Non Admin). |
| Creator LastLogon        | DATETIME | Records the creator's last logon date.                                                               |
| Creator Password         | TINYINT  | Indicates whether the creator has a password set (1 - Yes, 0 - No).                                 |
| Created Username         | VARCHAR  | Stores the newly created user account name.                                                          |
| Created LocalUser        | TINYINT  | Indicates whether the newly created account is local or domain (1 - Local, 0 - Domain).             |
| Created LocalAdmin       | TINYINT  | Indicates whether the newly created account is an admin or non-admin (1 - Admin, 0 - Non Admin).   |
| Created LastLogon        | DATETIME | Records the last logon date of the newly created account. (If the date is 1970-01-01 00:00:00, it means the account has never logged in.) |
| Created Password         | TINYINT  | Indicates whether the newly created account has a password set (1 - Yes, 0 - No).                   |
| Account Creation Date    | DATETIME | Stores the date the account was created.                                                             |
| Disable Status           | TINYINT  | Indicates whether the newly created account is disabled (0 - New Account Approved, 1 - Disabled, 2 - No Action). Here, 2 means the script that creates this table did not choose to disable the newly created account; it is only meant for auditing the new account. |
| Approve Status           | TINYINT  | Indicates whether the account is approved to be enabled (0 - Not Approved, 1 - Approved and Enabled, 2 - No Action). |
| Approve Date Status      | DATETIME | Represents when the newly created account was approved to be enabled. (If the date is 1970-01-01 00:00:00, it means the account is not approved.) |


