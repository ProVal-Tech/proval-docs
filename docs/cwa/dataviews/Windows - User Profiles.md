---
id: 'cwa-user-profile-info'
title: 'Windows User Profile Information'
title_meta: 'Windows User Profile Information'
keywords: ['windows', 'user', 'profile', 'information', 'computer', 'account', 'local', 'admin', 'sid', 'lastlogon']
description: 'This document provides an overview of the Windows user profile information gathered from the EPM - Accounts - Script - User Profile - Get Information script. It details the dependencies, columns, and descriptions of the user profile data collected.'
tags: ['user', 'profile', 'information', 'local', 'admin', 'sid', 'lastlogon', 'computer']
draft: false
unlisted: false
---
## Summary

Displays Windows user profile information gathered from the script [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496).

## Dependencies

- [EPM - Accounts - Custom Table - plugin_proval_userprofiles](https://proval.itglue.com/DOC-5078775-8476498)
- [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496)

## Columns

| Column         | Description                                                                                              |
|----------------|----------------------------------------------------------------------------------------------------------|
| Client         | The name of the client for the target computer.                                                         |
| Location       | The name of the location for the target computer.                                                       |
| ComputerID     | The ComputerID of the target computer.                                                                  |
| Computer       | The name of the target computer.                                                                         |
| User           | The username of the target profile. If `(Inferred)` is appended, then the user could not be found and the username was inferred from the Profile path. |
| Enabled        | 'True' or 'False' if the local account is enabled. Will be set to 'Remote' when account is not local.  |
| SID            | The SID of the target profile.                                                                           |
| ProfilePath    | The user folder path for the target profile.                                                            |
| ProfileSizeMB  | The size of the user folder for the target profile.                                                     |
| IsLocal        | Shows if the user is a local user.                                                                       |
| IsAdmin        | Shows if the user is a local admin.                                                                      |
| LastLogon      | Shows the last logon time of the user.                                                                   |
| LastScan       | The last time information was gathered about this profile.                                               |


