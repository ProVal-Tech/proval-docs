---
id: 'd88e1dfe-3dbc-44bb-a08d-b8ea9839d08f'
slug: /d88e1dfe-3dbc-44bb-a08d-b8ea9839d08f
title: 'Set-LocalPassword'
title_meta: 'Set-LocalPassword'
keywords: ['local user', 'password', 'never expires', 'dont_expire_passwd', 'adsi', 'accounts']
description: 'Enables the "Password never expires" setting on every local user account by setting the DONT_EXPIRE_PASSWD flag via a signed, Base64-embedded ADSI worker script.'
tags: ['accounts', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-23
---

## Overview

Enables the **"Password never expires"** setting on every local user account - the same result as checking that box for each account in `lusrmgr.msc`.

The checkbox maps to the `DONT_EXPIRE_PASSWD` (`0x10000`) bit of an account's `UserFlags`. A small worker script does the actual work; it is embedded in the parent as a Base64 blob so it can be Authenticode-signed out of band, decoded byte-exactly, written to disk, and executed.

## Requirements

- Must run elevated (`#requires -RunAsAdministrator`).
- PowerShell 5 or later.
- Internet access to install/update the `Strapper` module if it is missing.
- The worker uses the ADSI WinNT provider, so no additional modules are required and it works on any supported Windows version.

## Process

- Enforces TLS 1.2+ and installs/updates the `Strapper` module, then sets the Strapper environment.
- Decodes the embedded worker (`$encodedScript`) and writes it to `%ProgramData%\_Automation\Script\Set-LocalPassword\Set-LocalPasswordWorker.ps1` (UTF-8, no BOM, byte-exact so an Authenticode signature survives).
- Runs the deployed worker in the same elevated session, so its `Write-Log` output lands in this script's log. The worker:
  - Enumerates every local user account on the machine.
  - Reads the current `DONT_EXPIRE_PASSWD` flag for each account.
  - Skips and logs any account already set to never expire.
  - Otherwise sets the flag and commits the change with `SetInfo()`.
  - Logs a warning/error for accounts that cannot be read or updated.
- Removes the deployed worker file.

Built-in accounts (Administrator, Guest, DefaultAccount, etc.) are included.

## Maintenance

The `$null = @'...'@` block in the parent holds a human-readable copy of the worker for reference only; the copy that actually runs is `$encodedScript`. When the worker changes, sign the worker source (UTF-8 without a BOM), then regenerate the blob and paste it back in:

```powershell
[Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes((Get-Content .\Set-LocalPasswordWorker.ps1 -Raw)))
```

## Payload Usage

```powershell
.\Set-LocalPassword.ps1
```

Checks "Password never expires" on every local user account. The script takes no parameters.

## Output

    .\Set-LocalPassword-Log.txt
    .\Set-LocalPassword-Error.txt

## Changelog

### 2026-07-23

- Initial version of the document
