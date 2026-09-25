---
id: '585e6715-2136-4b26-baca-d8f7e09f8b88'
slug: /585e6715-2136-4b26-baca-d8f7e09f8b88
title: 'Disable-GuestAccount'
title_meta: 'Disable-GuestAccount'
keywords: ['guest', 'guest-account', 'local-user', 'disable', 'accounts']
description: 'Disables the built-in Windows Guest account if it is enabled.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-24
---

## Description

Disables the built-in Windows Guest account if it is enabled. If it is already disabled, nothing changes. It works even if the Guest account has been renamed.

Use it when a security audit or policy requires the Guest account to be disabled.

## Requirements

- Run as administrator.
- Internet access to install the `Strapper` logging module.

## Usage

Disable the Guest account:

```powershell
.\Disable-GuestAccount.ps1
```

Preview the result without making changes:

```powershell
.\Disable-GuestAccount.ps1 -WhatIf
```

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
| The Guest account is enabled again later. | A Group Policy or Intune policy turns it back on. | Set **Accounts: Guest account status** to **Disabled** in that policy. |
| The log shows an error. | Windows blocked the change. | Check `Disable-GuestAccount-error.txt` for the reason. |

## Changelog

### 2026-09-24

- Initial version of the document.
