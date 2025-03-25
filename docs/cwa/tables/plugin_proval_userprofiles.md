---
id: '7a87abf3-b410-491b-bbc1-534092e61f55'
slug: /7a87abf3-b410-491b-bbc1-534092e61f55
title: 'plugin_proval_userprofiles'
title_meta: 'plugin_proval_userprofiles'
keywords: ['windows', 'user', 'profile', 'data', 'audit', 'computer', 'local', 'admin']
description: 'This document outlines the purpose and structure of storing Windows user profile information, detailing dependencies, and providing a schema for the user profiles table including user attributes and audit timestamps.'
tags: ['database', 'report', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores Windows user profile information. Data is filled by [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>) and displayed in [EPM - Accounts - Dataview - Windows - User Profiles](<../dataviews/Windows - User Profiles.md>).

## Dependencies

- [EPM - Accounts - Script - User Profile - Get Information](<../scripts/User Profile - Get Information.md>)

## Tables

### plugin_proval_userprofiles

| Column      | Type     | Explanation                                               |
|-------------|----------|----------------------------------------------------------|
| computerid  | INT      | The ComputerID of the audited computer.                  |
| username    | VARCHAR  | The username of the associated profile.                   |
| localuser   | TINYINT  | 1 if the user is a local user, 0 if not.                |
| localadmin  | TINYINT  | 1 if the user is a local admin, 0 if not.               |
| profilesize | INT      | The size in MB of the user profile folder.               |
| usersid     | VARCHAR  | The SID of the user for the associated profile.          |
| LastLogon   | DATETIME | The last time the user logged in.                         |
| TimeStamp   | DATETIME | The date and time of the audit.                           |
| UserProfile | VARCHAR  | The path to the user profile folder.                      |
| Enabled     | VARCHAR  | True or False indicating if the local account is enabled. If not a local user, then the field is set to Remote. |


