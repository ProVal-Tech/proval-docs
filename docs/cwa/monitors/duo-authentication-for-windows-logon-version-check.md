---
id: 'b75e9b1e-2035-4d68-bb4c-4d852012cace'
slug: /b75e9b1e-2035-4d68-bb4c-4d852012cace
title: 'Duo Authentication for Windows Logon Version Check'
title_meta: 'Duo Authentication for Windows Logon Version Check'
keywords: ['duo', 'authentication', 'windows', 'monitor', 'version', 'update']
description: 'This remote monitor checks whether Duo Authentication for Windows Logon is installed and up to date. If the application is missing or outdated, it triggers the deployment script to automatically install or update it.'
tags: ['installation', 'update', 'security', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-07
---

## Summary

The **Duo Authentication for Windows Logon Version Check** remote monitor is automatically created by the [Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2) script, but **only** when the script is triggered by the internal monitor – i.e., for computers that are part of the automated Duo deployment. It is not created during manual script runs.

The monitor runs every hour and performs a single check:

1. It determines the latest available version of Duo Authentication for Windows Logon.
2. It reads the installed version from the registry.
3. If the application is **not installed**, the monitor returns `Failure: Not Installed`.
4. If the installed version is **older** than the latest version, it returns `Failure: Outdated (Installed: x.x.x, Latest: y.y.y)`.
5. If the latest version is **already installed**, it returns `Success`.

When any `Failure:` string is returned, the monitor triggers the alert template **△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment**. This runs the same deployment script against the computer, which automatically installs or updates the application and then verifies the result.

This monitor replaces the old **DUO Authentication - Latest Version Detection** monitor set, which is now deprecated.

## Details

- **Alert Template:** `△ Custom - Execute Script - Duo Authentication for Windows Logon Deployment`  
- **Suggested Alert Style:** Once  
- **Check Interval:** 3600 seconds (1 hour)

| Check Action | Server Address | Check Type | Execute Info | Comparator | Interval |
|--------------|----------------|------------|---------------|-------------|----------|
| System       | 127.0.0.1      | Run File   | **REDACTED**  | State Based | 3600     |

The monitor executes a PowerShell command that:

- Contacts the Duo download server to discover the latest version.
- Searches the uninstall registry keys for the installed version.
- Compares the two versions and returns either `Success` or a descriptive `Failure:` string.

When the output begins with `Failure:`, the alert template fires and runs the deployment script without any additional user input. The script handles the installation or update, and if it fails, a ticket is created automatically.

## Dependencies

- [Script: Duo Authentication for Windows Logon Deployment](/docs/3ccff739-75fe-11f1-ba72-92000234cfc2)
- [Internal Monitor: Duo Authentication for Windows Logon Deployment](/docs/01a557b0-e14a-4c87-885d-7ad2e79bf74e)
- [Solution: Duo Authentication for Windows Logon Deployment](/docs/df469efc-a893-4332-91e6-7bbfcb019b4c)

## Target

Local Machine

## Ticketing

This remote monitor does **not** create tickets by itself. If the deployment script (triggered by the alert) fails, the script is responsible for creating or updating a ticket. Successful installations do not generate tickets. Manual runs of the script that created the monitor will not produce tickets.

## Changelog

### 2026-07-07

- Initial version of the document
- Replaces the deprecated **DUO Authentication - Latest Version Detection** monitor set.
- Automatically created on machines where auto‑deployment is enabled, ensuring continuous compliance.
