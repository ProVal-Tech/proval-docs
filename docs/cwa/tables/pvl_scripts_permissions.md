---
id: '22dabcfc-b55c-4eae-81df-96c01446c3b7'
title: 'pvl_scripts_permissions'
title_meta: 'pvl_scripts_permissions'
keywords: ['guid', 'permissions', 'userclass', 'scripts', 'access']
description: 'This document outlines the purpose and details of the Built-In Scripts Permissions, including the GUID and user class assignments for script access and editing. It also highlights dependencies and provides a table detailing the structure of the pvl_scripts_permissions table.'
tags: ['database', 'security']
draft: false
unlisted: false
---

## Purpose

This document stores the GUID and the set of user class(es) for Built-In scripts.

## Dependencies

[CWM - Automate - Solution - Script Permission Standardization [Beta]](<../../solutions/Script Permission Standardization Beta.md>)

## Tables

### pvl_scripts_permissions

| Column               | Type    | Explanation                                                                                       |
|----------------------|---------|---------------------------------------------------------------------------------------------------|
| GUID                 | varchar | GUID of the Script                                                                                |
| Access               | varchar | Which set of the user class will be assigned the permission to use and edit this script          |
| Developer            | varchar | Creator of the script (Stock or ProVal). The beta version of the solution is limited to the stock scripts. |
| InitialPermission    | varchar | Existing view permission of the script.                                                          |
| InitialEditPermission| varchar | Existing edit permission of the script.                                                           |



