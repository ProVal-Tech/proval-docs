---
id: '63cc0fa9-43fb-4030-9303-d0053cc80ab8'
slug: /63cc0fa9-43fb-4030-9303-d0053cc80ab8
title: 'Audit Mac Users'
title_meta: 'Audit Mac Users'
keywords: ['user', 'profiles', 'data', 'gather', 'information']
description: 'This task executes the `Mac User Audit` script daily to identify user accounts on macOS machines'
tags: ['report', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Summary

This task executes the [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97) daily to identify user accounts on [Group - cPVAL Macintosh Machines](/docs/3a2610c1-5f47-448f-83b4-0d72bda9c6e).

## Dependencies

- [Automation - Mac User Audit](/docs/4c215a71-9d5a-4bf4-a9db-c4b4ca4fed97)
- [Group - cPVAL Macintosh Machines](/docs/d3c7b05d-29e2-478f-805d-46ec8325044)
- [Solution - Mac Users Audit](/docs/d4d9f6a6-92f9-4a6c-a197-136ff523c547)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Audit Mac Users | This task executes the `Mac User Audit` script daily to identify user accounts on macOS machines. | True | Daily | `1 day(s)` | `08/14/2026 02:00 PM` | Never | `cPVAL Macintosh Machines` |  `Mac User Audit`| 

## Task Creation

[Task Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/tasks/audit-mac-users.toml)

## Changelog

### 2026-08-17

- Initial version of the document
