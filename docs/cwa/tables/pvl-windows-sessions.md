---
id: 'a5bff446-3e21-42cf-8208-d0de57f497ee'
slug: /a5bff446-3e21-42cf-8208-d0de57f497ee
title: 'pvl_windows_sessions'
title_meta: 'pvl_windows_sessions'
keywords: ['windows', 'sessions', 'storage', 'output', 'database']
description: 'This document outlines the purpose and dependencies of storing the output from the query session command, specifically focusing on the Windows Sessions data structure and its associated table schema. It also references the necessary script for retrieving session data.'
tags: ['database', 'report', 'setup']
draft: false
unlisted: false
---

## Purpose

Stores the output of the `query session` command returned by the [CWM - Automate - Script - Windows Sessions [DV, Globals]](/docs/7d803c02-dd33-4a82-810e-02b4820ae88b) script.

## Dependencies

[CWM - Automate - Script - Windows Sessions [DV, Globals]](/docs/7d803c02-dd33-4a82-810e-02b4820ae88b)

## Tables

#### pvl_windows_sessions

| Column        | Type         | Explanation                                 |
|---------------|--------------|---------------------------------------------|
| computerid    | int (16)     | Computer ID                                 |
| SessionName   | varchar(256) | Name of the Windows Session                 |
| UserName      | varchar(256) | Name of the user logged on to that session  |
| ID            | int (16)     | Session ID of the session                   |
| State         | varchar(32)  | State of the session                        |
| Type          | varchar(64)  | Type of the session                         |
| Device        | varchar(64)  | Device of the session                       |
| ScriptRunTime | DateTime     | Data collection time                        |