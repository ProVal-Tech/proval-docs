---
id: '4416d8f0-fa01-4121-9611-bb21b64c1705'
slug: /4416d8f0-fa01-4121-9611-bb21b64c1705
title: 'Audit Inactive AD Users'
title_meta: 'Audit Inactive AD Users'
keywords: ['inactive', 'users', 'active directory', 'user management']
description: 'This internal monitor detect the online AD Infrastructure Server where the client EDF "Audit Inactive AD Users" should be checked for the auditing to be enabled'
tags: ['active-directory', 'accounts']
draft: false
unlisted: false
---

## Summary

This internal monitor detects the online AD Infrastructure Master Server where the client EDF `Audit Inactive AD Users` is enabled for auditing.


## Dependencies

- [Script - Audit - Inactive AD Users - X Days](/docs/cd2a8419-a43c-46ea-ba52-8b9b6c0a01fa)
- **Alert Template:** `△ Custom - Execute Script - Audit Inactive AD Users`
- [Table - pvl_ad_inactive_users](/docs/2b118df6-1fef-4530-9303-0bb56c478361)
- [Solution - Inactive AD Users Disable/Enable](/docs/d93ff68b-9515-4d4c-bfa4-ff551b3eac37)

## Target

- AD Infrastructure Master Server

## Alert Template

- `△ Custom - Execute Script - Audit Inactive AD Users`
