---
id: 'fac82ae1-8f32-40b3-b9b2-a38f1a71e633'
title: 'New Account Audit Dataview'
title_meta: 'New Account Audit Dataview for Account Creation Monitoring'
keywords: ['audit', 'accounts', 'creation', 'detection', 'management', 'local', 'admin', 'status', 'verification']
description: 'This dataview provides insights into newly created accounts, including details about the creator, account type, and logon status. It is essential for auditing account creation on servers and helps in monitoring security and compliance.'
tags: ['accounts']
draft: false
unlisted: false
---
## Summary

This dataview shows newly created accounts. It can be used in auditing of accounts created on server as it has info like who created, when created, whether created account and creator account are domain or non-domain, local or admin, ever logged in to the system etc.

## Dependencies

- [ProVal - Submitted - New Account Detection](https://proval.itglue.com/DOC-5078775-7695147)
- [User Management - New Local Account Audit And Disable [DV,Autofix,Global]](https://proval.itglue.com/DOC-5078775-7695148)
- [New User Account Audit Table](https://proval.itglue.com/DOC-5078775-7771654)
- [User Management - Approved New User - Activate [DV,Param]](https://proval.itglue.com/DOC-5078775-7771978)

## Columns

| Column                       | Description                                                                 |
|------------------------------|-----------------------------------------------------------------------------|
| Client Name                  | It shows the client name                                                   |
| Location Name                | It shows the location name                                                 |
| Computer Name                | It shows the computer name                                                 |
| New Account Creator           | Name of the user account who created the new account                       |
| Creator Is LocalAdmin        | It denotes the new account creator is local or admin (Yes - Local, No - Admin) |
| Creator Is LocalUser         | It denotes the new account creator is local or domain (Yes - Local, No - Domain) |
| Creator LastLogon            | It shows the last logon date of new account creator                        |
| Creator PasswordSet          | It shows the account creator has password set or not                       |
| New Account Created          | It shows the newly account name which was created                          |
| New Account Is LocalAdmin    | It shows the new account is local or admin (Yes - Local, No - Admin)     |
| New Account is LocalUser     | It shows the new account is local or domain (Yes - Local, No - Domain)    |
| New Account LastLogon        | It shows the newly created account last logon (For never logged in - NEVER) |
| New Account Creation Date     | It shows the new account creation date                                     |
| New Account Disable Status    | It shows whether new account is disabled or not. (No Action Taken - if this feature not chosen in the script) |
| New Account Approved         | It shows whether new account is approved after verification (No Action Require - Since disable not enabled then it will show approval not required too) |
| New Account Approved Date    | It shows when the account is approved to get enabled.                      |












