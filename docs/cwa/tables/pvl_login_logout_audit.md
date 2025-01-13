---
id: 'cwa_user_login_logout_data'
title: 'User Login/Logout Data Table'
title_meta: 'User Login/Logout Data Table'
keywords: ['user', 'login', 'logout', 'data', 'audit']
description: 'This document provides details about the User login/logout data table, including its purpose, dependencies, and the structure of the pvl_login_logout_audit table with descriptions of each column.'
tags: ['database', 'report', 'activity', 'logging', 'security']
draft: false
unlisted: false
---
## Purpose

This table stores the User login/logout data.

## Dependencies

[Activity Logging Reporting](https://proval.itglue.com/DOC-5078775-13392962)

## Tables

#### pvl_login_logout_audit

| Column                                                                 | Type    | Explanation                                                                                     |
|------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------|
| computerid                                                             | INT     | computerid of the agent                                                                         |
| Username                                                               | VARCHAR | The username of the agent for which the login/logout trace found                                |
| UserDomain                                                             | VARCHAR | This shows whether user was domain or local                                                    |
| Activity_Time                                                          | DATETIME| This shows the time when the user was logged in/out                                            |
| ConnectionType                                                         | INT     | This stores the integer value of the user connection type to show whether the user was remote, network, or no interaction type etc |
| Action                                                                 | INT     | This shows whether the user trace found for login or logout                                     |
| ScriptRanDate                                                          | DATETIME| This shows the script date about when script last ran                                          |


