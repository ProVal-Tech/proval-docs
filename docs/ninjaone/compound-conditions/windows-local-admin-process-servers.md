---
id: 'fe19911d-851f-45f6-b450-c541ce405b8e'
slug: /fe19911d-851f-45f6-b450-c541ce405b8e
title: 'Windows - Local Admin Process - Servers'
title_meta: 'Windows - Local Admin Process - Servers'
keywords: ['local-admin', 'local-account', 'local-admin-process', 'windows-local-admin']
description: 'Triggers the Windows - Local Admin - Create/Update script on Windows servers where the Windows - Local Admin - Process solution is active. The script executes when the local admin account is absent or when a password rotation is due.'
tags: ['accounts', 'windows', 'security']
draft: false
unlisted: false
---

## Summary

Triggers the [Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b) on Windows servers where the [Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da) solution is enabled. The script executes when the local admin account is absent or when a password rotation is due.

## Details

**Name:** `Windows - Local Admin Process - Servers`  
**Description:** `Triggers the Windows - Local Admin - Create/Update script on Windows servers where the Windows - Local Admin - Process solution is active. The script executes when the local admin account is absent or when a password rotation is due.`  
**Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Local Admin Process](/docs/4383ab0b-5593-4e60-954d-21cf82b2499c)
- [Automation: Windows - Local Admin - Create/Update](/docs/309772e8-4eb7-4a06-8704-6873646ef80b)
- [Automation: Windows - Local Admin - Password Rotation Check](/docs/32679339-2bb2-4d60-aa8d-47f10c52c028)
- [Solution: Windows - Local Admin - Process](/docs/11107cf4-cdb3-4d93-be1a-431ffbdce8da)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/windows-local-admin-process-servers.toml)
