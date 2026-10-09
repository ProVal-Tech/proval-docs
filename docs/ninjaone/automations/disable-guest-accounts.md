---
id: '89454fe4-a6b8-4e6a-8b47-a59f23128e07'
slug: /89454fe4-a6b8-4e6a-8b47-a59f23128e07
title: 'Disable Guest Accounts'
title_meta: 'Disable Guest Accounts'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'accounts']
description: 'Disables the built-in Windows Guest account on devices where the cpvalDisableGuestAccount custom field is set to Enable.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-09
---

## Overview

Disables the built-in Windows Guest account when the [cPVAL Disable Guest Account](/docs/b7743a14-544e-4e5c-8c20-7579dd0c5c39) custom field is set to `Enable`. If the account is already disabled, nothing changes.

Use it when a security audit or policy requires the Guest account to be disabled. The `Guest Account Removal Monitor` compound condition runs it on Windows workstations.

Domain controllers are skipped. Manage the domain's Guest account with Group Policy instead.

## Sample Run

`Play Button` > `Run Automation` > `Script` > `Disable Guest Accounts`

Set **Run As** to `System`.

## Dependencies

- [Custom Field - cPVAL Disable Guest Account](/docs/b7743a14-544e-4e5c-8c20-7579dd0c5c39)
- [Compound Condition - Guest Account Removal Monitor](/docs/4b2a084a-e67b-4c61-801c-d5103e08b619)
- [Solution - Disable Guest Account](/docs/5e9750da-82c2-4f0a-a6a0-894412269e53)

## Custom Fields

| Field Name | Type | Mandatory | Scope | Description |
| ---------- | ---- | --------- | ----- | ----------- |
| `cpvalDisableGuestAccount` | Dropdown | Yes | Organization, Location, Device | Set to `Enable` to disable the Guest account, or `Disable` to leave it alone. Set it for a client, then override it for a single device if needed. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/disable-guest-accounts.ps1)

## Output

- Activity Details

You'll know it worked when the activity details show `Disabled Guest account` or `already disabled`.

## Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| The activity says the field is not set to `Enable`. | The custom field is set to `Disable` or is blank. | Set `cpvalDisableGuestAccount` to `Enable`. |
| The script fails right away. | It is not running as System. | Set **Run As** to `System`. |
| The Guest account is enabled again later. | A Group Policy or Intune policy turns it back on. | Set **Accounts: Guest account status** to **Disabled** in that policy. |

## Changelog

### 2026-10-09

- Initial version of the document.
