---
id: 'cwa_login_logout_audit'
title: 'User Login/Logout Audit DataView'
title_meta: 'User Login/Logout Audit DataView'
keywords: ['audit', 'login', 'logout', 'user', 'activity', 'reporting']
description: 'This document provides a comprehensive overview of the User Login/Logout Audit DataView, detailing user activity related to login and logout events. It includes dependencies, a description of the columns present in the dataview, and insights into user interactions with the system.'
tags: ['report', 'activity', 'windows', 'security', 'configuration']
draft: false
unlisted: false
---
## Summary

The dataview shows the login/logout audit of the users.

## Dependencies

- [Activity Logging Reporting](https://proval.itglue.com/DOC-5078775-13392962)
- [pvl_login_logout_audit](https://proval.itglue.com/DOC-5078775-13392964)

## Columns

| Column            | Description                                           |
|-------------------|-------------------------------------------------------|
| Client Name       | Client name of the agent                              |
| Location Name     | Location name of the agent                            |
| Computer Name     | Computer Name of the agent                            |
| Operating System   | Operating system of the agent                         |
| LastContact       | Last contact of the agent with the RMM               |
| Username          | Username whose activity traced                         |
| UserDomain        | This shows the user domain or local name             |
| Activity_Time     | The user login/logout activity time                   |
| ConnectionType    | The connection to show whether the connection was remote, network, or interactive, etc. |
| Logon Type        | This shows whether the user detected for login or logout |
| ScriptRanDate     | This shows the script last ran date and time         |



