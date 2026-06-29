---
id: '0eb97e73-a060-4f47-a601-439b171d14cf'
slug: /0eb97e73-a060-4f47-a601-439b171d14cf
title: 'Configure-WingetAutoUpdate'
title_meta: 'Configure-WingetAutoUpdate'
keywords: ['winget', 'auto', 'update', 'auto-update', 'applications']
description: 'This script keeps approved applications up to date automatically using a portable copy of Winget. It does not install any third-party auto-update application.'
tags: ['software', 'upgrade', 'updates', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-29
---

## Overview

This script keeps approved applications up to date automatically using a portable copy of Winget. It does not install any third-party auto-update application. Instead, it deploys `winget.exe` and its dependencies, writes a small update runtime, creates a whitelist or blacklist of apps, and registers scheduled tasks that run the updates on a schedule (and optionally at logon). Everything is recreated on every run, so old configurations are always replaced cleanly.

## Requirements

- PowerShell v5+
- Administrative Privileges (runs as SYSTEM)
- Active Internet Connection (to fetch winget, its dependencies, and app updates)

## Process

1. **Initialization**
    - Set up TLS and quiet output preferences.
    - Install or update the `Strapper` module for logging and config storage.

2. **Uninstall (when requested)**
    - Remove the Winget-AutoUpdate application if it exists on the machine.
    - Remove all scheduled tasks under `\WAU\` and delete all deployed files.

3. **Reset and recreate**
    - Save the chosen configuration for auditing.
    - With `-Force`: remove any installed Winget-AutoUpdate application and reinstall portable winget files.
    - Always remove existing `\WAU\` tasks so old setups are replaced.

4. **Deploy files**
    - Place `winget.exe` and dependencies under `C:\ProgramData\_automation\App\Winget`.
    - Write the update runtime, silent launcher, and app lists under `C:\ProgramData\_automation\Script\Winget-AutoUpdate`.

5. **Register tasks**
    - SYSTEM task `Winget-AutoUpdate` runs the update runtime on the chosen schedule (interval and/or at logon).
    - User task `Winget-AutoUpdate-UserContext` (optional) has **no schedule of its own**. The SYSTEM task starts it when the system run finishes, so user-scope apps are updated right after system-scope apps.

6. **Run and validate**
    - Optionally run the update immediately after setup.
    - Confirm tasks were created and winget is present.

## Payload Usage

**To update all apps daily at 6 AM (defaults), system only:**

```powershell
.\Configure-WingetAutoUpdate.ps1
```

**To update only specific apps (whitelist):**

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip, Mozilla.Firefox'
```

**To update all apps except some (blacklist):**

```powershell
.\Configure-WingetAutoUpdate.ps1 -BlacklistedApp 'Google.Chrome'
```

**To update a list of apps daily at 2 PM and also at logon, including user apps:**

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip, Mozilla.Firefox' -UpdatesInterval Daily -UpdatesAtTime '02PM' -InstallUserContext -UpdatesAtLogon
```

**To update apps weekly:**

```powershell
.\Configure-WingetAutoUpdate.ps1 -BlacklistedApp 'Google.Chrome' -UpdatesInterval Weekly
```

**To update apps every other day at 7:30 PM:**

```powershell
.\Configure-WingetAutoUpdate.ps1 -UpdatesInterval BiDaily -UpdatesAtTime '07:30PM'
```

**To configure but not run the update right away:**

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip' -DoNotRunAfterInstallation
```

**To reinstall the portable winget files and remove any old Winget-AutoUpdate app:**

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip' -Force
```

**To uninstall everything (tasks, files, app, configuration):**

```powershell
.\Configure-WingetAutoUpdate.ps1 -Uninstall
```

## Parameters

| Parameter | Required | Default | Type | Description |
| --- | --- | --- | --- | --- |
| `WhitelistedApp` | False | *(not set)* | String | Comma-separated list of apps to update. Takes precedence over `BlacklistedApp`. |
| `BlacklistedApp` | False | *(not set)* | String | Comma-separated list of apps to exclude. All other apps are updated. |
| `InstallUserContext` | False | *(off)* | Switch | Also create a user-context task so user-scope apps get updated. |
| `UpdatesInterval` | False | Daily | String | Frequency: `Daily`, `BiDaily`, `Weekly`, `BiWeekly`, `Monthly`, `Never`. |
| `UpdatesAtTime` | False | 06AM | String | Time of day, 12-hour format (e.g. `06AM`, `02PM`, `07:30PM`). |
| `UpdatesAtLogon` | False | *(off)* | Switch | Also run at user logon, in addition to the interval. |
| `DoNotRunAfterInstallation` | False | *(off)* | Switch | Do not run the update immediately after setup. |
| `Uninstall` | False | *(off)* | Switch | Remove tasks, files, configuration, and any installed Winget-AutoUpdate app. |
| `Force` | False | *(off)* | Switch | Reinstall winget files and remove any installed Winget-AutoUpdate app. Tasks and files are always recreated regardless of this switch. |

## Notes

- Only one of `WhitelistedApp` or `BlacklistedApp` is used at a time. If both are given, `WhitelistedApp` wins.
- Tasks and files are removed and recreated on every run, so older configurations are always replaced.
- `UpdatesAtTime` and `UpdatesAtLogon` are additive, not mutually exclusive. If both are given, the task runs at logon **and** at the scheduled interval/time. The exception is `UpdatesInterval Never`, which creates no interval trigger; combined with `UpdatesAtLogon` the task runs only at logon and `UpdatesAtTime` is effectively ignored.
- Only the SYSTEM task is scheduled. When `-InstallUserContext` is used, the user task is **chained**: the SYSTEM run starts it on completion, so it always runs right after the system task (and never at the same time). This is needed because a SYSTEM run cannot see or update user-scope apps. The user task is started even if the system update fails, so user-scope apps are still updated.

## Output

Scheduled tasks created under `\WAU\`:

- `Winget-AutoUpdate` (SYSTEM, runs the update runtime)
- `Winget-AutoUpdate-UserContext` (only with `-InstallUserContext`, runs silently)

Files written under `C:\ProgramData\_automation\Script\Winget-AutoUpdate`:

- `Winget-UpdateApproved.ps1` (update runtime)
- `Invisible.vbs` (silent launcher)
- `included_apps.txt` or `excluded_apps.txt` (approval lists)
- `Winget-UpdateApproved-log.txt` and `Winget-UpdateApproved-error.txt` (runtime logs)

Files written under `C:\ProgramData\_automation\App\Winget`:

- `winget.exe` and its portable dependencies

Configuration script logs (next to this script):

- `.\Configure-WingetAutoUpdate-log.txt`
- `.\Configure-WingetAutoUpdate-error.txt`

## Changelog

### 2026-06-29

- Initial version of the document
