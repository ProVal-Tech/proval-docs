---
id: 'cwa-o365-audit-users'
title: 'O365 - Audit Users to Custom Table'
title_meta: 'O365 - Audit Users to Custom Table'
keywords: ['o365', 'audit', 'users', 'custom', 'table', 'information', 'baseline']
description: 'This document outlines the purpose and structure of a script that stores baseline information about Office 365 users. It details the dependencies and the schema of the database table used to store user data, including columns for ClientID, DisplayName, Email, IsLicensed, 2FAStatus, and ContactID.'
tags: ['office365', 'database', 'report', 'configuration', 'security']
draft: false
unlisted: false
---
## Purpose

Stores baseline information about Office 365 users gathered by the script [O365 - Audit Users to Custom Table [DV]](https://proval.itglue.com/DOC-5078775-8071511).

## Dependencies

[O365 - Audit Users to Custom Table [DV]](https://proval.itglue.com/DOC-5078775-8071511).

## Table

#### plugin_proval_o365_users

| Column      | Type | Explanation                                                     |
|-------------|------|-----------------------------------------------------------------|
| ClientID    | INT  | The ClientID associated with the O365 user.                     |
| DisplayName | CHAR | The display name of the O365 user.                              |
| Email       | CHAR | The primary e-mail address of the O365 user.                   |
| IsLicensed   | CHAR | True or False depending on if the user is licensed or not.     |
| 2FAStatus   | CHAR | String denoting the type of 2FA set up on the account.         |
| ContactID   | INT  | The ContactID associated with the O365 user. Will be NULL if a match cannot be found. |


