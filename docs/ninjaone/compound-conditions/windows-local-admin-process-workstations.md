---
id: '3fa6998e-204c-4d16-b4e5-ef2635a9a705'
slug: /3fa6998e-204c-4d16-b4e5-ef2635a9a705
title: 'Windows - Local Admin Process - Workstations'
title_meta: 'Windows - Local Admin Process - Workstations'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Triggers the Windows - Local Admin - Create/Update script on workstations where the Windows - Local Admin - Process solution is active. The script executes when the local admin account is absent or when a password rotation is due.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Triggers the [Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b) on Windows workstations where the [Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da) solution is enabled. The script executes when the local admin account is absent or when a password rotation is due.

## Details

**Name:** `Windows - Local Admin Process - Workstations`  
**Description:** `Triggers the Windows - Local Admin - Create/Update script on workstations where the Windows - Local Admin - Process solution is active. The script executes when the local admin account is absent or when a password rotation is due.`  
**Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c)
- [Automation: Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b)
- [Automation: Windows - Local Admin - Password Rotation Check](/docs/32679339-2bb2-4d60-aa8d-47f10c52c028)
- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/windows-local-admin-process-workstations.toml)
