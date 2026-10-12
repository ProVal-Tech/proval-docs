---
id: 'f83bc1b1-d17a-46f9-ae65-ae1a31c44a3c'
slug: /f83bc1b1-d17a-46f9-ae65-ae1a31c44a3c
title: 'Disable Guest Account - Workstation'
title_meta: 'Disable Guest Account - Workstation'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'accounts']
description: 'Checks Windows Workstation daily and disables the built-in Guest account when it is enabled.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Summary

Checks the built-in Windows Guest account once a day and disables it if it is enabled. It runs on Windows workstations.

The condition is met when all of these are true:

- The [cPVAL Disable Guest Account](/docs/b7743a14-544e-4e5c-8c20-7579dd0c5c39) custom field is set to `Enable`.
- The device is not a domain controller (the `AD-Domain-Services` role is not installed).
- The [Disable Guest Accounts](/docs/89454fe4-a6b8-4e6a-8b47-a59f23128e07) automation, run with **Detect Only**, finds the Guest account enabled.

When the condition is met, the [Disable Guest Accounts](/docs/89454fe4-a6b8-4e6a-8b47-a59f23128e07) automation runs and disables the account. The condition resets on its own once the account is disabled.

## Details

- **Name:** `Disable Guest Account - Workstation`
- **Description:** `Checks Windows Workstation daily and disables the built-in Guest account when it is enabled.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`
- **Runs Every:** 24 hours

## Dependencies

- [Solution - Disable Guest Account](/docs/5e9750da-82c2-4f0a-a6a0-894412269e53)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/disable-guest-account-workstation.toml)

## Changelog

### 2026-10-12

- Initial version of the document
