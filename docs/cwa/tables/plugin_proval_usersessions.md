---
id: 'c5fe6ff8-9c52-4cfd-8b0b-fffc9df61acf'
title: 'User Session Audit for Windows Machines'
title_meta: 'User Session Audit for Windows Machines'
keywords: ['active', 'session', 'audit', 'windows', 'data']
description: 'This document outlines the purpose and structure of the User Session Audit for Windows machines, detailing the data stored about active user sessions and the dependencies required for its implementation.'
tags: ['active-directory', 'database', 'report', 'windows']
draft: false
unlisted: false
---

## Purpose

This document stores data about active user sessions on Windows machines.

## Dependencies

[User Session Audit](<../scripts/User Session Audit.md>)

## Table

#### plugin_proval_usersessions

| Column        | Type     | Explanation                                      |
|---------------|----------|--------------------------------------------------|
| ComputerID    | INT      | The Computer ID of the audited agent.           |
| Username      | VARCHAR  | The username of the audited session.             |
| State         | VARCHAR  | The state of the audited session.                |
| LogonDate     | DATETIME | The date and time that the session was started.  |
| SessionLength | INT      | The length in minutes of the audited session.    |
| Timestamp     | DATETIME | The date and time that the audit was run.        |

