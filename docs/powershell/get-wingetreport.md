---
id: 'a344216a-5ff8-426d-a7d7-a688500990b4'
slug: /a344216a-5ff8-426d-a7d7-a688500990b4
title: 'Get-WingetReport'
title_meta: 'Get-WingetReport'
keywords: ['winget', 'auto', 'update', 'audit', 'monitor']
description: 'This script audits the applications installed on a machine using a portable copy of Winget and returns the result as PowerShell objects.'
tags: ['software', 'auditing', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-29
---

## Overview

This script audits the applications installed on a machine using a portable copy of Winget and returns the result as PowerShell objects. It runs **once** with administrative rights and, in that single run, prepares the machine, deploys a small audit script, runs that audit in both **system** and **user** context, collects the combined inventory, cleans up after itself, and returns an array of application objects.

## Requirements

- PowerShell v5+
- Administrative Privileges (runs as SYSTEM or as an elevated administrator)
- Active Internet Connection (to fetch Winget, its dependencies, and the `Strapper` module if missing)

## Process

1. **Initialization**
    - Set up TLS and quiet output preferences.
    - Detect whether the script is running as SYSTEM or as a user.
    - Install or update the `Strapper` module for logging and local data storage.

2. **Prepare the machine**
    - Create and secure the working folders under `C:\ProgramData\_automation`.
    - Install a portable copy of `winget.exe` and its dependencies under `C:\ProgramData\_automation\App\Winget` (only if not already present), so the audit can run even where Winget is not natively available, such as in SYSTEM context.

3. **Deploy the audit script**
    - Write a small `Winget-Audit.ps1` to `C:\ProgramData\_automation\Script\Winget-Report`.
    - The audit script lists installed applications, works out whether each one is up to date and whether automatic updates are enabled, and stores the result in a local `Strapper` table.

4. **Run the audit in both contexts**
    - A **SYSTEM** task captures machine-scope applications and replaces the inventory table.
    - A **user** task captures user-scope applications and appends to the inventory table. This task is created **only when a user is logged on** to the machine.
    - The parent script waits for each task to finish before continuing.

5. **Collect, clean up, and return**
    - Read the combined inventory from the `Strapper` table.
    - Remove both scheduled tasks and delete the deployed audit script.
    - Return the applications as an array of `PSCustomObject`.

## Payload Usage

**To run the audit and capture the result:**

```powershell
$packages = .\Get-WingetReport.ps1
```

**To run the audit and view the result as a table:**

```powershell
.\Get-WingetReport.ps1 | Format-Table DisplayName, InstalledVersion, AvailableVersion, Source, Level
```

**To run the audit and view only outdated applications:**

```powershell
.\Get-WingetReport.ps1 | Where-Object UptoDate -eq 0 | Format-Table DisplayName, InstalledVersion, AvailableVersion
```

## Parameters

This script takes no parameters. It detects its own run context (SYSTEM or user) and adjusts behavior automatically.

## Notes

- **Privileges:** Must run as SYSTEM or as an elevated administrator.
- **Winget source:** In user context the audit prefers the system-installed `winget` command (when it resolves and returns output) because the portable `winget.exe` cannot enumerate every installed application, notably Microsoft Store apps. It falls back to the portable Winget when the command is missing or returns nothing. System context always uses the portable Winget.
- **User task:** The user audit only runs when a user is logged on. On an unattended machine with no active session, only system-scope applications are reported.
- **Auto-update status:** If a `windowsAutoUpdateConfig` table exists (written by the companion Winget-AutoUpdate configuration), the audit uses it to determine whether each application has automatic updates enabled and when the update task last ran. Without that table, auto-update is reported as disabled.
- **Self-cleanup:** The scheduled tasks and the deployed audit script are always removed at the end of the run. The portable Winget install and the log files remain.

## Output

Returns an array of `PSCustomObject`, one entry per installed application, with the following properties:

| Property | Description |
| --- | --- |
| `DisplayName` | Friendly name of the application. |
| `PackageId` | Winget package identifier. |
| `InstalledVersion` | Currently installed version. |
| `AvailableVersion` | Newer version available from the source, or empty when up to date. |
| `Source` | Package source (`winget` or `msstore`). |
| `UptoDate` | `1` when up to date, `0` when an update is available. |
| `Level` | Context the application was captured in (`System` or `User`). |
| `AutoUpdateEnabled` | `1` when automatic updates are enabled for the application, otherwise `0`. |
| `AutoUpdateRunTime` | Last run time of the Winget-AutoUpdate task, when applicable. |

Files written under `C:\ProgramData\_automation\App\Winget`:

- `winget.exe` and its portable dependencies

Local data table (managed by `Strapper`):

- `windowsApplicationInventory` (combined system and user inventory)

Script logs (next to this script):

- `.\Get-WingetReport-log.txt`
- `.\Get-WingetReport-error.txt`

## Changelog

### 2026-06-29

- Initial version of the document
