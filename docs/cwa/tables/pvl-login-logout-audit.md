---
id: 'c62e7bbf-226d-4269-9d12-536e43af5589'
slug: /c62e7bbf-226d-4269-9d12-536e43af5589
title: 'pvl_login_logout_audit'
title_meta: 'pvl_login_logout_audit'
keywords: ['user', 'login', 'logout', 'data', 'audit']
description: 'This document provides details about the User login/logout data table, including its purpose, dependencies, and the structure of the pvl_login_logout_audit table with descriptions of each column.'
tags: ['database', 'logging', 'report', 'security']
draft: false
unlisted: false
---

## Purpose

This table stores the User login/logout data.

## Dependencies

[Activity Logging Reporting](/docs/53f4f86f-0936-40ef-ac65-7287f74d7f65)

## Tables

#### pvl_login_logout_audit

| Column            | Type    | Explanation                                                                                     |
|-------------------|---------|-------------------------------------------------------------------------------------------------|
| computerid        | INT     | The computer ID of the agent.                                                                   |
| Username          | VARCHAR | The username of the agent for which the login/logout trace was found.                          |
| UserDomain        | VARCHAR | Indicates whether the user was part of a domain or local.                                      |
| Activity_Time     | DATETIME| The time when the user logged in or out.                                                       |
| ConnectionType    | INT     | An integer value representing the user connection type (e.g., remote, network, or no interaction). |
| Action            | INT     | Indicates whether the trace found was for login or logout.                                     |
| ScriptRanDate     | DATETIME| The date when the script last ran.                                                              |


