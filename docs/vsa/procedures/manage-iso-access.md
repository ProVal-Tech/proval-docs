---
id: 'ce389f31-cb77-495f-9b20-18003303ae30'
slug: /ce389f31-cb77-495f-9b20-18003303ae30
title: 'Manage ISO Access'
title_meta: 'Manage ISO Access'
keywords: ['iso', 'mount', 'control', 'windows', 'access']
description: 'This document outlines two agent procedures, ISO Mount Disable and ISO Mount Enable, designed to manage end-user access to mounting ISOs in Windows environments. It includes example logs and a detailed process for modifying registry settings to enable or disable ISO mounting capabilities.'
tags: ['security', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This document describes two agent procedures: ISO Mount Disable and ISO Mount Enable, which are used to prevent or allow end users from mounting ISOs in Windows.

## Example Agent Procedure Log

| Time                     | Procedure                | Status                                             | User                          |
|--------------------------|--------------------------|----------------------------------------------------|-------------------------------|
| 11:32:02 am 19-Dec-22    | ISO Mount Enable         | Success THEN                                       | provaltech.com/dan.hicks      |
| 11:32:02 am 19-Dec-22    | ISO Mount Enable         | Endpoint user ISO access enabled.                  | provaltech.com/dan.hicks      |
| 11:32:01 am 19-Dec-22    | ISO Mount Enable         | Reinstating end-user ISO Mount capability from endpoint. | provaltech.com/dan.hicks      |
| 11:30:32 am 19-Dec-22    | ISO Mount Enable         | Reinstating end-user ISO Mount capability from endpoint. | provaltech.com/dan.hicks      |
| 11:30:24 am 19-Dec-22    | Run Now - ISO Mount Enable | Admin provaltech.com/dan.hicks scheduled procedure Run Now - ISO Mount Enable to run at Dec 19 2022 11:30 AM | provaltech.com/dan.hicks      |

## Process

Sets `SZ HKEY_CLASSES_ROOT/Windows.IsoFile/shell/mount/ProgrammaticAccessOnly` to remove Mount access, and removes the value to re-enable it.

## Output

Agent Procedure Log
