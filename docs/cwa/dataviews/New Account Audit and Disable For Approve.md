---
id: 'fac82ae1-8f32-40b3-b9b2-a38f1a71e633'
slug: /fac82ae1-8f32-40b3-b9b2-a38f1a71e633
title: 'New Account Audit and Disable For Approve'
title_meta: 'New Account Audit and Disable For Approve'
keywords: ['audit', 'accounts', 'creation', 'detection', 'management', 'local', 'admin', 'status', 'verification']
description: 'This dataview provides insights into newly created accounts, including details about the creator, account type, and logon status. It is essential for auditing account creation on servers and helps in monitoring security and compliance.'
tags: ['accounts']
draft: false
unlisted: false
---

## Summary

This dataview shows newly created accounts. It can be used for auditing accounts created on servers as it contains information such as who created the account, when it was created, whether the created account and creator account are domain or non-domain, local or admin, and whether the account has ever logged into the system.

## Dependencies

- [ProVal - Submitted - New Account Detection](https://proval.itglue.com/DOC-5078775-7695147)
- [User Management - New Local Account Audit And Disable [DV, Autofix, Global]](https://proval.itglue.com/DOC-5078775-7695148)
- [New User Account Audit Table](/docs/64d9813f-2eba-4448-8d78-c9a001979ee9)
- [User Management - Approved New User - Activate [DV, Param]](/docs/d3db4260-b3e9-4ec6-b422-07434a2a239d)

## Columns

| Column                       | Description                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| Client Name                  | Shows the client name                                                       |
| Location Name                | Shows the location name                                                     |
| Computer Name                | Shows the computer name                                                     |
| New Account Creator          | Name of the user account that created the new account                       |
| Creator Is LocalAdmin        | Indicates whether the new account creator is local or admin (Yes - Local, No - Admin) |
| Creator Is LocalUser         | Indicates whether the new account creator is local or domain (Yes - Local, No - Domain) |
| Creator LastLogon            | Shows the last logon date of the new account creator                       |
| Creator PasswordSet          | Indicates whether the account creator has a password set or not             |
| New Account Created          | Shows the name of the newly created account                                  |
| New Account Is LocalAdmin    | Indicates whether the new account is local or admin (Yes - Local, No - Admin) |
| New Account Is LocalUser     | Indicates whether the new account is local or domain (Yes - Local, No - Domain) |
| New Account LastLogon        | Shows the last logon date of the newly created account (For never logged in - NEVER) |
| New Account Creation Date     | Shows the creation date of the new account                                   |
| New Account Disable Status    | Indicates whether the new account is disabled or not (No Action Taken - if this feature is not chosen in the script) |
| New Account Approved         | Indicates whether the new account is approved after verification (No Action Required - Since disable is not enabled, it will show that approval is not required) |
| New Account Approved Date    | Shows when the account was approved to be enabled.                          |


