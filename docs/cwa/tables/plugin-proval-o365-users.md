---
id: 'b6256c5a-da00-4a11-91b1-819bc770349a'
slug: /b6256c5a-da00-4a11-91b1-819bc770349a
title: 'plugin_proval_o365_users'
title_meta: 'plugin_proval_o365_users'
keywords: ['o365', 'audit', 'users', 'custom', 'table', 'information', 'baseline']
description: 'This document outlines the purpose and structure of a script that stores baseline information about Office 365 users. It details the dependencies and the schema of the database table used to store user data, including columns for ClientID, DisplayName, Email, IsLicensed, 2FAStatus, and ContactID.'
tags: ['database', 'office365', 'report', 'security']
draft: false
unlisted: false
---

## Purpose

This document stores baseline information about Office 365 users gathered by the script [O365 - Audit Users to Custom Table [DV]](/docs/c4cb8f27-762f-4ebc-9840-f5cb7712a05d).

## Dependencies

The script [O365 - Audit Users to Custom Table [DV]](/docs/c4cb8f27-762f-4ebc-9840-f5cb7712a05d) is required.

## Table

### plugin_proval_o365_users

| Column      | Type | Explanation                                                     |
|-------------|------|-----------------------------------------------------------------|
| ClientID    | INT  | The ClientID associated with the O365 user.                     |
| DisplayName | CHAR | The display name of the O365 user.                              |
| Email       | CHAR | The primary email address of the O365 user.                    |
| IsLicensed   | CHAR | Indicates whether the user is licensed (True or False).        |
| 2FAStatus   | CHAR | A string denoting the type of 2FA set up on the account.       |
| ContactID   | INT  | The ContactID associated with the O365 user. Will be NULL if a match cannot be found. |


