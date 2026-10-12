---
id: '585e6715-2136-4b26-baca-d8f7e09f8b88'
slug: /585e6715-2136-4b26-baca-d8f7e09f8b88
title: 'Disable-GuestAccount'
title_meta: 'Disable-GuestAccount'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'detect', 'accounts']
description: 'Detects and disables the built-in Windows Guest account if it is enabled.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-12
---

## Description

Detects and disables the built-in Windows Guest account. If the account is already disabled, nothing changes. It works even if the Guest account has been renamed.

Use it when a security audit or policy requires the Guest account to be disabled.

## Requirements

- Run as administrator.
- Run on a Windows workstation or server. Domain controllers are not supported.
- Internet access to install the `Strapper` logging module.

## Usage

Disable the Guest account:

```powershell
.\Disable-GuestAccount.ps1
```

Check the Guest account without making changes:

```powershell
.\Disable-GuestAccount.ps1 -Detect
```

If the account is enabled, the script returns `Detection: Guest account is enabled`. If it is already disabled, it returns nothing.

Preview the change without making it:

```powershell
.\Disable-GuestAccount.ps1 -WhatIf
```

## Parameters

| Parameter | Alias | Required | Default | Type | Description |
| --------- | ----- | -------- | ------- | ---- | ----------- |
| `Detect` | | False | `False` | Switch | Checks whether the Guest account is enabled. Makes no changes. |

## Output

Results are written to these files in the script's folder:

```text
Disable-GuestAccount-log.txt
Disable-GuestAccount-error.txt
```

You'll know it worked when the log shows `Disabled Guest account` or `already disabled`.

## Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| The log says the script is not supported on domain controllers. | A domain controller's Guest account applies to the whole domain. | Manage the domain's Guest account with Group Policy. |
| The Guest account is enabled again later. | A Group Policy or Intune policy turns it back on. | Set **Accounts: Guest account status** to **Disabled** in that policy. |
| The log shows another error. | Windows blocked the change. | Check `Disable-GuestAccount-error.txt` for the reason. |

## Changelog

### 2026-10-12

- Added the `-Detect` parameter to check the Guest account without making changes.
- The script now stops on domain controllers.

### 2026-09-24

- Initial version of the document.
