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
  date: 2026-07-31
---

## Overview

This script audits the applications installed on a machine using a portable copy of Winget and returns the result as PowerShell objects. It runs **once** with administrative rights and, in that single run, prepares the machine, deploys a small audit script, runs that audit in both **system** and **user** context through scheduled tasks, collects the combined inventory, cleans up after itself, and returns an array of application objects.

**Key Features:**

- **Portable Winget Deployment:** Downloads and extracts a fully portable `winget.exe` with all dependencies (VCLibs, Visual C++ redistributable) so the audit works even where Winget is not natively installed, including SYSTEM context.
- **Zero Window Flashing:** Utilizes a custom, compiled Go executable (`SilentLauncher.exe`) to guarantee that no console windows flash on the user's screen during task execution.
- **Structured Detection:** The audit runtime uses `winget list --details` to enumerate installed applications, which is more reliable across Winget versions and localised output than the column-based `winget list` table.
- **Source Inference:** When Winget does not print an `Origin Source:` line for a package, the source is inferred from the header identifier pattern (12-character alphanumeric IDs map to `msstore`, `MSIX\` and `ARP\` prefixes map to untracked local installs, everything else maps to `winget`).
- **Install Scope Awareness:** Records install scope per package. Any package whose `Installed Scope` is `Machine` is reported as `System` regardless of which context captured it.
- **Winget Validation:** In user context, tests the system-installed `winget` command before trusting it. Falls back to portable Winget when the command is missing or returns no output. System context always uses the portable Winget.
- **Auto-Update Cross-Reference:** Reads the `windowsAutoUpdateConfig` table (written by the companion `Configure-WingetAutoUpdate.ps1`) to report whether each application has automatic updates enabled and when the update task last ran.
- **Signed Runtime:** Deploys the audit runtime from a signed, encoded source. A readable reference is kept alongside the encoded placeholder so future maintainers can edit, re-sign, and re-encode the runtime.
- Provisions the Strapper logging module via **`Install-PSGalleryModule`**, bypassing the PackageManagement engine and avoiding dynamic .NET DLL compilation or NuGet provider bootstrapping.
- **Self-Cleaning:** Scheduled tasks and the deployed audit script are always removed at the end of the run. The portable Winget install and log files remain.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10 or later.
- Network access to **ProVal's File Server** to download the silent launcher ([SilentLauncher.exe](/docs/b0b9f423-eee3-4148-b8a0-e99400c45698)) and the module installer ([Install-PSGalleryModule.ps1](/docs/858fa597-2e08-4da4-ad6d-27ca62858547)).
- Network access to **www.powershellgallery.com** (queried by `Install-PSGalleryModule` to resolve and download the Strapper module).
- Network access to **github.com** for the Winget release bundle ([Microsoft.DesktopAppInstaller](https://github.com/microsoft/winget-cli/releases/latest)) and 7-Zip extraction tools ([ProVal-Tech/7zip](https://github.com/ProVal-Tech/7zip/releases/latest)).
- Network access to **aka.ms** for VCLibs and Visual C++ redistributable prerequisites.
- Administrative privileges (the script requires `-RunAsAdministrator` to create scheduled tasks and write to `$env:ProgramData`).

## Payload Usage

This script takes no parameters. It detects its own run context (SYSTEM or user) and adjusts behaviour automatically. Below are usage examples:

### Example 1

Runs the audit and captures the returned application objects in a variable.

```powershell
$packages = .\Get-WingetReport.ps1
```

### Example 2

Runs the audit and displays the result as a table.

```powershell
.\Get-WingetReport.ps1 | Format-Table DisplayName, InstalledVersion, AvailableVersion, Source, Level
```

### Example 3

Runs the audit and shows only outdated applications.

```powershell
.\Get-WingetReport.ps1 | Where-Object UptoDate -eq 0 | Format-Table DisplayName, InstalledVersion, AvailableVersion
```

### Example 4

Runs the audit and shows only applications with automatic updates enabled.

```powershell
.\Get-WingetReport.ps1 | Where-Object AutoUpdateEnabled -eq 1 | Format-Table DisplayName, PackageId, AutoUpdateRunTime
```

## What Happens When You Run the Script

When you execute `Get-WingetReport.ps1`, the following steps occur in order:

1. The script provisions the Strapper module via `Install-PSGalleryModule` and initialises the logging environment.
2. Working directories are created and secured with Everyone FullControl ACLs.
3. A portable `winget.exe` is downloaded, extracted, and validated (skipped if already present).
4. The audit runtime (`Winget-Audit.ps1`) is written to disk from a signed, encoded source.
5. `SilentLauncher.exe` is downloaded from ProVal's File Server.
6. A SYSTEM scheduled task is registered and started. The audit captures machine-scope applications and **replaces** the inventory table.
7. If a user is logged on, a user-context scheduled task is registered and started. The audit captures user-scope applications and **appends** to the inventory table.
8. The parent script waits for each task to finish (via a completion marker file), then reads the combined inventory.
9. Both scheduled tasks are unregistered and the deployed files are deleted.
10. The applications are returned as an array of `PSCustomObject`.

### Completion Marker Behaviour

Because `SilentLauncher.exe` is asynchronous, the scheduled task reports completion before the audit has actually finished. The audit writes a completion marker file (`Winget-Audit-Complete.flag`) in its `end` block — even on failure — so the parent can confirm the audit truly ended.

| Task | Marker Removed Before Start | Timeout |
|---|---|---|
| System audit | Yes | 10 minutes |
| User audit | Yes | 10 minutes |

:::note
The completion marker is written in the `end` block of the audit script, which always runs regardless of whether the `process` block succeeded or threw an error. This guarantees the parent never waits indefinitely for a task that has already finished.
:::

### Audit Runtime Behaviour

When the scheduled task fires, the runtime:

1. Detects its run context (SYSTEM or User).
2. In user context, tests the system-installed `winget` command before trusting it. Falls back to portable Winget when the command is missing or returns no output.
3. Queries `winget list --details` for all installed applications.
4. Parses each entry's name, ID, version, source, available upgrade, and installed scope.
5. Filters out untracked local installs (bare `MSIX\` or `ARP\` identifiers with no catalog source and no pending upgrade).
6. Cross-references the auto-update configuration to determine per-app update status.
7. Stores the result in the `windowsApplicationInventory` Strapper table (replace for SYSTEM, append for User).
8. Writes the completion marker file.

## Generated Files and Scenario Breakdown

When the script runs, it orchestrates several files and scheduled tasks across two working directories. Below is an end-to-end breakdown of what is created and why:

1. **Portable Winget** (`C:\ProgramData\_Automation\App\Winget\`)
   - `winget.exe`: The extracted Winget binary used for all audit operations.
   - Supporting DLLs and dependencies extracted from the App Installer bundle.
   - All intermediate artifacts (`.msixbundle`, `.msix`, `7zr.exe`, `7za.exe`, `7z.7z`, `.appx`, `VC_redist*.exe`) are deleted after extraction.
   - This directory is **not** cleaned up after the run so subsequent audits skip the deployment step.

2. **Audit Runtime** (`C:\ProgramData\_Automation\Script\Winget-Report\`)
   - `Winget-Audit.ps1`: The self-contained audit script. Lists installed applications using `winget list --details`, parses each entry, cross-references the auto-update configuration, and stores the result in the Strapper table.
   - **Deleted** during cleanup.

3. **Silent Launcher** (`C:\ProgramData\_Automation\Script\Winget-Report\`)
   - `SilentLauncher.exe`: A compiled Go executable that runs scripts with the Windows API `CREATE_NO_WINDOW` flag. Both scheduled tasks launch the audit script through it to guarantee zero window flashing.
   - **Deleted** during cleanup.

4. **Completion Marker** (`C:\ProgramData\_Automation\Script\Winget-Report\`)
   - `Winget-Audit-Complete.flag`: Written by the audit script's `end` block (even on failure) so the parent can confirm the audit truly finished.
   - **Deleted** during cleanup.

5. **SYSTEM Scheduled Task**
   - *Task*: `Winget-Report-System` under `\WingetReport\` (runs as `NT AUTHORITY\SYSTEM`, highest run level).
   - Action: Executes `SilentLauncher.exe`, passing `Winget-Audit.ps1` as an argument.
   - Trigger: None (started programmatically by the parent script).
   - **Unregistered** during cleanup.

6. **User-Context Scheduled Task** *(only when a user is logged on)*
   - *Task*: `Winget-Report-User` under `\WingetReport\` (runs as the interactive users group, highest run level).
   - Action: Executes `SilentLauncher.exe`, passing `Winget-Audit.ps1` as an argument.
   - Trigger: None (started programmatically by the parent script).
   - **Unregistered** during cleanup.

7. **Inventory Table** *(Strapper local storage)*
   - `windowsApplicationInventory`: The combined system and user inventory. The SYSTEM audit replaces the table; the user audit appends to it. Read by the parent script during collection and available to external consumers after the run.

8. **Audit Runtime Logs** *(Strapper, written when the audit task fires)*
   - `Winget-Audit-log.txt` and `Winget-Audit-error.txt` in the script working directory.

:::note
The audit runtime (`Winget-Audit.ps1`) is written from a fixed, parameterized source embedded in the script. Its on-disk content never changes between runs unless the source is edited, allowing it to be securely Authenticode signed. All varying data (Winget path, table names, marker path) is resolved at runtime from the file system and environment, ensuring the signed content remains byte-identical. The deployed `.ps1` file is written as UTF-8 without a byte order mark (BOM).
:::

## Parameters

This script takes no parameters. It detects its own run context (SYSTEM or user) and adjusts behaviour automatically.

## Output

Returns an array of `PSCustomObject`, one entry per installed application, with the following properties:

| Property | Type | Description |
|---|---|---|
| `DisplayName` | String | Friendly name of the application. |
| `PackageId` | String | Winget package identifier. |
| `InstalledVersion` | String | Currently installed version, or empty when unknown. |
| `AvailableVersion` | String | Newer version available from the source, or empty when up to date. |
| `Source` | String | Package source (`winget` or `msstore`). |
| `UptoDate` | Int | `1` when up to date, `0` when an update is available. |
| `Level` | String | Context the application was captured in (`System` or `User`). Machine-scope packages captured in user context are still reported as `System`. |
| `AutoUpdateEnabled` | Int | `1` when automatic updates are enabled for the application, otherwise `0`. |
| `AutoUpdateRunTime` | String | Last run time of the `Winget-AutoUpdate` scheduled task in `yyyy-MM-dd HH:mm:ss` format, or empty when not applicable. |

Files written under `C:\ProgramData\_Automation\App\Winget`:

- `winget.exe` and its portable dependencies (persist across runs)

Files written under `C:\ProgramData\_Automation\Script\Winget-Report` (transient, removed during cleanup):

- `Winget-Audit.ps1` (audit runtime)
- `SilentLauncher.exe` (silent launcher)
- `Winget-Audit-Complete.flag` (completion marker)
- `Winget-Audit-log.txt` and `Winget-Audit-error.txt` (audit runtime logs)

Local data table (managed by Strapper):

- `windowsApplicationInventory` (combined system and user inventory)

Configuration script logs (next to this script):

- `.\Get-WingetReport-log.txt`
- `.\Get-WingetReport-error.txt`

## Changelog

### 2026-07-31

- Replaced the legacy `Invisible.vbs` VBScript wrapper with a custom, compiled Go executable (`SilentLauncher.exe`), guaranteeing zero console window flashing for all scheduled tasks using the Windows API `CREATE_NO_WINDOW` flag.
- Replaced the `Install-Module` / `Update-Module` / `Find-Module` Strapper provisioning logic with the [Install-PSGalleryModule](/docs/858fa597-2e08-4da4-ad6d-27ca62858547) script, retrieved at runtime from the content repository. This bypasses the PackageManagement engine entirely, eliminating dynamic .NET DLL compilation, NuGet provider bootstrapping, and the associated failure modes in constrained environments.
- Added a signed, encoded deployment model for the audit runtime, with a readable here-string reference kept alongside the Base64 placeholder for future maintainers.
- Added `github.com` and `aka.ms` as explicit network requirements for the Winget bundle and redistributable prerequisites.

### 2026-07-20

- Updated the audit runtime to leverage `winget list --accept-source-agreements --disable-interactivity --details`, improving the reliability and simplifying the parsing of package information.
- Added source inference from header identifiers when the `Origin Source:` detail line is absent.
- Added install scope awareness: packages with `Installed Scope: Machine` are reported as `System` regardless of the capturing context.
- Added cross-referencing of the `windowsAutoUpdateConfig` table to report per-application auto-update status.

### 2026-06-29

- Initial version of the document.
