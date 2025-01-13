---
id: 'cwa-user-profile-information'
title: 'User Profile Information Storage'
title_meta: 'User Profile Information Storage'
keywords: ['windows', 'user', 'profile', 'data', 'audit', 'computer', 'local', 'admin']
description: 'This document outlines the purpose and structure of storing Windows user profile information, detailing dependencies, and providing a schema for the user profiles table including user attributes and audit timestamps.'
tags: ['windows', 'database', 'configuration', 'security', 'report']
draft: false
unlisted: false
---
## Purpose

Stores Windows user profile information. Data is filled by [EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496) and displayed in [EPM - Accounts - Dataview - Windows - User Profiles](https://proval.itglue.com/DOC-5078775-8476497).

## Dependencies

[EPM - Accounts - Script - User Profile - Get Information](https://proval.itglue.com/DOC-5078775-8476496)

## Tables

#### plugin_proval_userprofiles

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
| Enabled     | VARCHAR  | True or False on if the local account is enabled. If not a local user, then field is set to Remote. |




