---
id: '11c4193c-786a-4477-ae73-9992ff55ea16'
slug: /11c4193c-786a-4477-ae73-9992ff55ea16
title: 'User Activity Audit Script'
title_meta: 'User Activity Audit Script'
keywords: ['audit', 'login', 'logout', 'user', 'activity', 'reporting']
description: 'This document provides a comprehensive overview of the User Login/Logout Audit DataView, detailing user activity related to login and logout events. It includes dependencies, a description of the columns present in the DataView, and insights into user interactions with the system.'
tags: ['report', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The DataView shows the login/logout audit of the users.

## Dependencies

- [Activity Logging Reporting](<../scripts/Activity Logging Reporting DV, Global.md>)
- [pvl_login_logout_audit](<../tables/pvl_login_logout_audit.md>)

## Columns

| Column            | Description                                           |
|-------------------|-------------------------------------------------------|
| Client Name       | Client name of the agent                              |
| Location Name     | Location name of the agent                            |
| Computer Name     | Computer name of the agent                            |
| Operating System   | Operating system of the agent                         |
| Last Contact      | Last contact of the agent with the RMM               |
| Username          | Username whose activity is traced                     |
| User Domain       | This shows the user domain or local name             |
| Activity Time     | The user login/logout activity time                   |
| Connection Type   | Indicates whether the connection was remote, network, or interactive, etc. |
| Logon Type        | Indicates whether the user was detected for login or logout |
| Script Ran Date   | This shows the script's last ran date and time       |



