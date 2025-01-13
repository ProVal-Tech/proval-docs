---
id: 'cwa-built-in-scripts-permissions'
title: 'Built-In Scripts Permissions'
title_meta: 'Built-In Scripts Permissions'
keywords: ['guid', 'permissions', 'userclass', 'scripts', 'access']
description: 'This document outlines the purpose and details of the Built-In Scripts Permissions, including the GUID and user class assignments for script access and editing. It also highlights dependencies and provides a table detailing the structure of the pvl_scripts_permissions table.'
tags: ['database', 'configuration', 'security']
draft: false
unlisted: false
---
## Purpose

Stores the GUID and the set of user class(es) for Built-In scripts.

## Dependencies

[CWM - Automate - Solution - Script Permission Standardization [Beta]](https://proval.itglue.com/DOC-5078775-16760863)

## Tables

### pvl_scripts_permissions

| Column               | Type    | Explanation                                                                                       |
|----------------------|---------|---------------------------------------------------------------------------------------------------|
| GUID                 | varchar | GUID of the Script                                                                                |
| Access               | varchar | Which set of the userclass will be assigned the permission to use and edit this script            |
| Developer            | varchar | Creator of the script (Stock or ProVal). The beta version of the solution is limited to the stock scripts. |
| InitialPermission     | varchar | Existing view permission of the script.                                                          |
| InitialEditPermission | varchar | Existing Edit Permission of the script.                                                           |


