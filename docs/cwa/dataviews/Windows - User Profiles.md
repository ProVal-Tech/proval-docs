---
id: 'da3a0d43-7bdd-4408-99ce-138337eecb43'
title: 'Windows - User Profiles'
title_meta: 'Windows - User Profiles'
keywords: ['windows', 'user', 'profile', 'information', 'computer', 'account', 'local', 'admin', 'sid', 'lastlogon']
description: 'This document provides an overview of the Windows user profile information gathered from the EPM - Accounts - Script - User Profile - Get Information script. It details the dependencies, columns, and descriptions of the user profile data collected.'
tags: []
draft: false
unlisted: false
---

## Summary

Displays Windows user profile information gathered from the script [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>).

## Dependencies

- [EPM - Accounts - Custom Table - plugin_proval_userprofiles](<../tables/plugin_proval_userprofiles.md>)
- [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>)

## Columns

| Column         | Description                                                                                              |
|----------------|----------------------------------------------------------------------------------------------------------|
| Client         | The name of the client for the target computer.                                                         |
| Location       | The name of the location for the target computer.                                                       |
| ComputerID     | The ComputerID of the target computer.                                                                  |
| Computer       | The name of the target computer.                                                                         |
| User           | The username of the target profile. If `(Inferred)` is appended, then the user could not be found and the username was inferred from the profile path. |
| Enabled        | 'True' or 'False' if the local account is enabled. Will be set to 'Remote' when the account is not local.  |
| SID            | The SID of the target profile.                                                                           |
| ProfilePath    | The user folder path for the target profile.                                                            |
| ProfileSizeMB  | The size of the user folder for the target profile.                                                     |
| IsLocal        | Indicates if the user is a local user.                                                                   |
| IsAdmin        | Indicates if the user is a local admin.                                                                  |
| LastLogon      | Shows the last logon time of the user.                                                                   |
| LastScan       | The last time information was gathered about this profile.                                               |



