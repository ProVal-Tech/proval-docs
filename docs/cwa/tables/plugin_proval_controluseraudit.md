---
id: 'cwa-user-audit-info'
title: 'ConnectWise Control User Audit Information'
title_meta: 'ConnectWise Control User Audit Information'
keywords: ['connectwise', 'audit', 'users', 'information', 'roles']
description: 'This document provides detailed information about the ConnectWise Control User Audit script, including its purpose, dependencies, and the structure of the data it stores regarding existing ConnectWise Control users.'
tags: ['connectwise', 'database', 'security', 'setup', 'report']
draft: false
unlisted: false
---
## Purpose

Stores information from the @CW Control - User Audit script about existing ConnectWise Control users.

## Dependencies

@CW Control - User Audit (Script)

## Table

#### plugin_proval_controluseraudit

| Column                     | Type      | Explanation                                                                |
|---------------------------|-----------|----------------------------------------------------------------------------|
| ComputerID                | INT       | The ComputerID of the audited CWC server.                                 |
| Username                   | VARCHAR   | The username of the audited CWC user.                                     |
| DisplayName               | VARCHAR   | The display name of the audited CWC user.                                 |
| Email                     | VARCHAR   | The e-mail address of the audited CWC user.                               |
| CreationDate              | DATETIME  | The date that the audited CWC user was created.                           |
| LastActivityDate          | DATETIME  | The last time the audited CWC user performed any action.                  |
| LastLockoutDate           | DATETIME  | The last time that the audited CWC user was locked out.                   |
| LastLoginDate             | DATETIME  | The last time that the audited CWC user logged into CWC.                  |
| LastPasswordChangedDate    | DATETIME  | The last time that the audited CWC user changed their password.           |
| Roles                     | VARCHAR   | The CWC roles assigned to the audited CWC user.                           |
| IsApproved                | TINYINT   | 1 or 0 to determine if the audited CWC user is an approved user or not.  |
| IsLockedOut               | TINYINT   | 1 or 0 to determine if the audited CWC user is locked out.                |
| 2FAEnabled                | TINYINT   | 1 or 0 to determine if the audited CWC user has 2FA enabled.             |

