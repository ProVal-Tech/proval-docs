---
id: '4b2a084a-e67b-4c61-801c-d5103e08b619'
slug: /4b2a084a-e67b-4c61-801c-d5103e08b619
title: 'Guest Account Removal Monitor'
title_meta: 'guest-account-removal-monitor'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'accounts']
description: 'Disables the built-in Windows Guest account if it is enabled.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-12-09
---

## Summary

This condition reads the custom field `cpvaldisableguestaccount` is enabled. It also reads if the windows role `AD-Domain-Services` doesn't exist. If these conditions are met, then the `Disable Guest Accounts` automation will run.

## Details

- **Name:** `Guest Account Removal Monitor`
- **Description:**  `Disables Guest Accounts`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [Solution - Disable Guest Account](/docs/5e9750da-82c2-4f0a-a6a0-894412269e53)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/guest-account-removal-monitor.toml)

## Changelog

### 2026-10-08

- Initial version of the document