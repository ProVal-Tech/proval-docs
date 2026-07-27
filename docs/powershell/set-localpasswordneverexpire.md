---
id: 'd88e1dfe-3dbc-44bb-a08d-b8ea9839d08f'
slug: /d88e1dfe-3dbc-44bb-a08d-b8ea9839d08f
title: 'Set-LocalPasswordNeverExpire'
title_meta: 'Set-LocalPasswordNeverExpire'
keywords: ['local-user', 'password', 'never-expires', 'dont-expire-passwd', 'adsi', 'accounts']
description: 'Enables the Password never expires setting on every local user account by setting the DONT_EXPIRE_PASSWD flag via the ADSI WinNT provider.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Overview

Enables the **Password never expires** setting on every local user account — the same result as checking that box for each account in `lusrmgr.msc`.

The checkbox maps to the `DONT_EXPIRE_PASSWD` (`0x10000`) bit in each account's `UserFlags` property. The script reads the current flag state for every local account and sets it where it is not already enabled. Accounts that already have the setting are skipped and logged.

Built-in accounts (Administrator, Guest, DefaultAccount, etc.) are included.

## Requirements

- Must run elevated (`#requires -RunAsAdministrator`).
- PowerShell 5.1 or later.
- Internet access to install or update the `Strapper` module if it is not already present.
- No additional modules are required; the script uses the built-in ADSI WinNT provider available on every supported Windows version.

## What It Does

1. Prepares a secure connection and ensures the Strapper logging module is available.
2. Enumerates every local user account on the machine.
3. For each account:
   - Checks whether Password never expires is already set.
   - If yes, logs the account as unchanged and moves on.
   - If no, enables the setting and confirms the change.
   - Logs a warning or error for any account that cannot be read or updated.
4. Writes a final summary showing how many accounts were updated, skipped, or failed.

The script supports `-WhatIf`, which previews the changes without modifying anything.

## Usage

Enable Password never expires on all local accounts:

```powershell
.\Set-LocalPasswordNeverExpire.ps1
```

Preview which accounts would be changed without making modifications:

```powershell
.\Set-LocalPasswordNeverExpire.ps1 -WhatIf
```

No mandatory parameters are required.

## Output

Log files are written through the Strapper module:

```PlainText
.\Set-LocalPasswordNeverExpire-Log.txt
.\Set-LocalPasswordNeverExpire-Error.txt
```

## Changelog

### 2026-07-28

- Simplified execution: the script now performs all account changes directly, removing the intermediate worker-script deployment step.
- Added `-WhatIf` support so changes can be previewed before committing.
- Added a final summary line reporting updated, skipped, and failed account counts.
- Improved error handling for accounts that cannot be read or modified.

### 2026-07-23

- Initial version of the document.
