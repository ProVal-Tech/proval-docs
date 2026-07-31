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
  date: 2026-07-31
---

## Overview

This script keeps approved applications up to date automatically using a portable copy of Winget. It does **not** install any third-party auto-update application. Instead, it deploys `winget.exe` and its dependencies under `ProgramData`, writes a self-contained update runtime, creates a whitelist or blacklist of apps, and registers scheduled tasks that run the updates on a schedule (and optionally at logon). Everything is recreated on every run, so old configurations are always replaced cleanly.

**Key Features:**

- **Portable Winget Deployment:** Downloads and extracts a fully portable `winget.exe` with all dependencies (VCLibs, Visual C++ redistributable) so updates work even where Winget is not natively installed, including SYSTEM context.
- **Zero Window Flashing:** Utilizes a custom, compiled Go executable (`SilentLauncher.exe`) to guarantee that no console windows flash on the user's screen during task execution.
- **Structured Detection:** The update runtime uses `winget list --details` to detect outdated applications, which is more reliable across Winget versions and localised output than the column-based `winget upgrade` table.
- **Source-Aware Upgrades:** Captures each package's origin source (`winget` or `msstore`) and passes `--source` to the upgrade command, ensuring Microsoft Store apps upgrade from the correct catalog.
- **Winget Validation:** Validates that Winget actually returned application entries before trusting the result. Falls back to portable Winget when the system-installed command returns no data, and attempts a `source reset` as a last resort.
- **Chained User-Context Task:** When user updates are enabled, the SYSTEM task starts the user-context task on completion, so user-scope apps are updated right after system-scope apps without a conflicting schedule.
- **Signed Runtime:** Deploys the update runtime from a signed, encoded source. A readable reference is kept alongside the encoded placeholder so future maintainers can edit, re-sign, and re-encode the runtime.
- Provisions the Strapper logging module via **`Install-PSGalleryModule`**, bypassing the PackageManagement engine and avoiding dynamic .NET DLL compilation or NuGet provider bootstrapping.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10 or later.
- Network access to **ProVal's File Server** to download the silent launcher ([SilentLauncher.exe](/docs/b0b9f423-eee3-4148-b8a0-e99400c45698)) and the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to **www.powershellgallery.com** (queried by `Install-PSGalleryModule` to resolve and download the Strapper module).
- Network access to **github.com** for the Winget release bundle ([Microsoft.DesktopAppInstaller](https://github.com/microsoft/winget-cli/releases/latest)) and 7-Zip extraction tools ([ProVal-Tech/7zip](https://github.com/ProVal-Tech/7zip/releases/latest)).
- Network access to **aka.ms** for VCLibs and Visual C++ redistributable prerequisites.
- Administrative privileges (the script requires `-RunAsAdministrator` to create scheduled tasks and write to `$env:ProgramData`).

## Approval Lists

The script supports two approval models for controlling which applications are updated. You supply one or the other; if both are given, the whitelist wins and the blacklist is discarded.

### Whitelist

When you supply `-WhitelistedApp`, only the listed applications are updated. All other applications are ignored, even if Winget reports them as outdated.

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip, Mozilla.Firefox'
```

The list is written to `included_apps.txt` in the working directory, one package ID per line.

### Blacklist

When you supply `-BlacklistedApp`, all applications are updated **except** the listed ones.

```powershell
.\Configure-WingetAutoUpdate.ps1 -BlacklistedApp 'Google.Chrome'
```

The list is written to `excluded_apps.txt` in the working directory, one package ID per line.

### No List

When neither parameter is supplied, all outdated applications detected by Winget are updated. Any existing list files from a previous run are removed.

## Payload Usage

This script allows users to configure automatic updates using parameters. Below are usage examples:

### Example 1

Updates all apps daily at 6 AM (the defaults), system context only.

```powershell
.\Configure-WingetAutoUpdate.ps1
```

### Example 2

Updates only specific apps using a whitelist.

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip, Mozilla.Firefox'
```

### Example 3

Updates all apps except Chrome using a blacklist, on a weekly schedule.

```powershell
.\Configure-WingetAutoUpdate.ps1 -BlacklistedApp 'Google.Chrome' -UpdatesInterval Weekly
```

### Example 4

Updates a list of apps daily at 2 PM and also at logon, including user-scope apps.

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip, Mozilla.Firefox' -UpdatesInterval Daily -UpdatesAtTime '02PM' -InstallUserContext -UpdatesAtLogon
```

### Example 5

Updates apps every other day at 7:30 PM.

```powershell
.\Configure-WingetAutoUpdate.ps1 -UpdatesInterval BiDaily -UpdatesAtTime '07:30PM'
```

### Example 6

Configures the update but does not run it immediately after setup.

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip' -DoNotRunAfterInstallation
```

### Example 7

Reinstalls the portable Winget files, re-downloads SilentLauncher, and removes any old Winget-AutoUpdate application.

```powershell
.\Configure-WingetAutoUpdate.ps1 -WhitelistedApp '7zip.7zip' -Force
```

### Example 8

Uninstalls everything: scheduled tasks, deployed files, stored configuration, and any installed Winget-AutoUpdate application.

```powershell
.\Configure-WingetAutoUpdate.ps1 -Uninstall
```

## What Happens When You Run the Script

When you execute `Configure-WingetAutoUpdate.ps1`, the following steps occur in order:

1. The script provisions the Strapper module via `Install-PSGalleryModule` and initialises the logging environment.
2. Your chosen configuration (whitelist/blacklist, interval, time, logon trigger, user context) is saved to a local Strapper table for auditing by `Get-WingetReport.ps1`.
3. Existing scheduled tasks under `\WAU\` are removed so old setups are always replaced.
4. Working directories are created and secured with Everyone FullControl ACLs.
5. The approval list (`included_apps.txt` or `excluded_apps.txt`) is written.
6. A portable `winget.exe` is downloaded, extracted, and validated (skipped if already present, unless `-Force` is used).
7. `SilentLauncher.exe` is downloaded from ProVal's File Server.
8. The update runtime (`Winget-UpdateApproved.ps1`) is written to disk from a signed, encoded source.
9. Scheduled tasks are registered. The SYSTEM task runs on your chosen schedule; the user task (if enabled) has no trigger of its own.
10. Unless `-DoNotRunAfterInstallation` is set, the SYSTEM task is started immediately.

### Scheduled Task Behaviour

| Task | Trigger | Purpose |
|---|---|---|
| `Winget-AutoUpdate` (SYSTEM) | Interval and/or logon | Runs the update runtime for machine-scope apps |
| `Winget-AutoUpdate-UserContext` (User) | None (started by SYSTEM task) | Runs the update runtime for user-scope apps |

:::note
The user-context task has **no schedule of its own**. The SYSTEM runtime starts it via `Start-ScheduledTask` when the system run finishes. This chaining ensures user-scope apps are updated immediately after system-scope apps, and the user task runs even if the system update fails.
:::

### Update Runtime Behaviour

When the scheduled task fires, the runtime:

1. Acquires a single-instance mutex to prevent overlapping runs.
2. Detects its run context (SYSTEM or User).
3. In user context, tests the system-installed `winget` command before trusting it. Falls back to portable Winget when the command is missing or returns no output.
4. Queries `winget list --details` for outdated applications.
5. Validates that Winget returned actual entries. If zero entries are detected, attempts a `source reset` and retries.
6. Filters the outdated list against the approval list (whitelist or blacklist).
7. Upgrades each approved package, passing `--source` for correct catalog targeting.
8. Verifies each upgrade succeeded by re-querying Winget.
9. Releases the mutex and starts the user-context task (SYSTEM context only).

## Generated Files and Scenario Breakdown

When the script runs, it orchestrates several files and scheduled tasks across two working directories. Below is an end-to-end breakdown of what is created and why:

1. **Portable Winget** (`C:\ProgramData\_Automation\App\Winget\`)
   - `winget.exe`: The extracted Winget binary used for all update operations.
   - Supporting DLLs and dependencies extracted from the App Installer bundle.
   - All intermediate artifacts (`.msixbundle`, `.msix`, `7zr.exe`, `7za.exe`, `7z.7z`, `.appx`, `VC_redist*.exe`) are deleted after extraction.

2. **Update Runtime and Approval Lists** (`C:\ProgramData\_Automation\Script\Winget-AutoUpdate\`)
   - `Winget-UpdateApproved.ps1`: The self-contained update runtime. Reads the approval lists, queries Winget for outdated apps, upgrades only approved package IDs, and logs all actions through Strapper.
   - `included_apps.txt` or `excluded_apps.txt`: The whitelist or blacklist of application identifiers, one per line.
   - `Winget-UpdateApproved-log.txt` and `Winget-UpdateApproved-error.txt`: Runtime logs written by Strapper when the update task fires.

3. **Silent Launcher** (`C:\ProgramData\_Automation\Script\Winget-AutoUpdate\`)
   - `SilentLauncher.exe`: A compiled Go executable that runs scripts with the Windows API `CREATE_NO_WINDOW` flag. All scheduled tasks launch their targets through it to guarantee zero window flashing.

4. **SYSTEM Scheduled Task**
   - *Task*: `Winget-AutoUpdate` under `\WAU\` (runs as `NT AUTHORITY\SYSTEM`, highest run level).
   - Action: Executes `SilentLauncher.exe`, passing `Winget-UpdateApproved.ps1` as an argument.
   - Triggers: Interval trigger (Daily, BiDaily, Weekly, BiWeekly, or Monthly at the chosen time) and/or a logon trigger, depending on parameters. `Never` creates no interval trigger.

5. **User-Context Scheduled Task** *(only with `-InstallUserContext`)*
   - *Task*: `Winget-AutoUpdate-UserContext` under `\WAU\` (runs as the interactive users group, highest run level).
   - Action: Executes `SilentLauncher.exe`, passing `Winget-UpdateApproved.ps1` as an argument.
   - Triggers: **None.** Started programmatically by the SYSTEM runtime via `Start-ScheduledTask`.

6. **Configuration Table** *(Strapper local storage)*
   - `windowsAutoUpdateConfig`: Stores the active whitelist/blacklist, interval, time, logon flag, and user-context flag. Read by `Get-WingetReport.ps1` to determine auto-update status per application.

:::note
The update runtime (`Winget-UpdateApproved.ps1`) is written from a fixed, parameterized source embedded in the script. Its on-disk content never changes between runs unless the source is edited, allowing it to be securely Authenticode signed. All varying data (approval lists, Winget path) is resolved at runtime from the file system, ensuring the signed content remains byte-identical. The deployed `.ps1` file is written as UTF-8 without a byte order mark (BOM).
:::

## Parameters

| Parameter | Required | Default | Type | Description |
|---|---|---|---|---|
| `WhitelistedApp` | False | *(not set)* | String | Comma-separated list of apps to update. Takes precedence over `BlacklistedApp`. |
| `BlacklistedApp` | False | *(not set)* | String | Comma-separated list of apps to exclude. All other apps are updated. |
| `InstallUserContext` | False | *(off)* | Switch | Also create a user-context task so user-scope apps get updated. |
| `UpdatesInterval` | False | Daily | String | Frequency: `Daily`, `BiDaily`, `Weekly`, `BiWeekly`, `Monthly`, `Never`. |
| `UpdatesAtTime` | False | 06AM | String | Time of day, 12-hour format (e.g. `06AM`, `02PM`, `07:30PM`). |
| `UpdatesAtLogon` | False | *(off)* | Switch | Also run at user logon, in addition to the interval. |
| `DoNotRunAfterInstallation` | False | *(off)* | Switch | Do not run the update immediately after setup. |
| `Uninstall` | False | *(off)* | Switch | Remove tasks, files, configuration, and any installed Winget-AutoUpdate app. |
| `Force` | False | *(off)* | Switch | Reinstall Winget files, re-download SilentLauncher, and remove any installed Winget-AutoUpdate app. Tasks, lists, and runtime are always recreated regardless of this switch. |

## Output

Scheduled tasks created under `\WAU\`:

- `Winget-AutoUpdate` (SYSTEM, runs the update runtime silently through `SilentLauncher.exe`)
- `Winget-AutoUpdate-UserContext` (only with `-InstallUserContext`, runs silently through `SilentLauncher.exe`, started by the SYSTEM task)

Files written under `C:\ProgramData\_Automation\Script\Winget-AutoUpdate`:

- `Winget-UpdateApproved.ps1` (update runtime)
- `SilentLauncher.exe` (silent launcher)
- `included_apps.txt` or `excluded_apps.txt` (approval lists)
- `Winget-UpdateApproved-log.txt` and `Winget-UpdateApproved-error.txt` (runtime logs)

Files written under `C:\ProgramData\_Automation\App\Winget`:

- `winget.exe` and its portable dependencies

Configuration script logs (next to this script):

- `.\Configure-WingetAutoUpdate-log.txt`
- `.\Configure-WingetAutoUpdate-error.txt`

## Changelog

### 2026-07-31

- Replaced the legacy `Invisible.vbs` VBScript wrapper with a custom, compiled Go executable (`SilentLauncher.exe`), guaranteeing zero console window flashing for all scheduled tasks using the Windows API `CREATE_NO_WINDOW` flag.
- Replaced the `Install-Module` / `Update-Module` / `Find-Module` Strapper provisioning logic with the [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547) script, retrieved at runtime from the content repository. This bypasses the PackageManagement engine entirely, eliminating dynamic .NET DLL compilation, NuGet provider bootstrapping, and the associated failure modes in constrained environments.
- Updated the update runtime to use `winget list --details` for outdated application detection instead of the column-based `winget upgrade` table, improving reliability across Winget versions and localised output.
- Added source-aware upgrades: the runtime now captures each package's origin source (`winget` or `msstore`) and passes `--source` to the upgrade command, ensuring Microsoft Store apps upgrade from the correct catalog.
- Added Winget output validation: the runtime verifies that Winget returned actual application entries before trusting the result, falls back to portable Winget when the system command returns no data, and attempts a `source reset` as a last resort.
- Added a signed, encoded deployment model for the update runtime, with a readable here-string reference kept alongside the Base64 placeholder for future maintainers.
- Added `github.com` and `aka.ms` as explicit network requirements for the Winget bundle and redistributable prerequisites.

### 2026-06-29

- Initial version of the document.
