---
id: '3258a739-0239-47fe-87ae-f9cdc4a3206e'
slug: /3258a739-0239-47fe-87ae-f9cdc4a3206e
title: 'Set-M365Shortcut'
title_meta: 'Set-M365Shortcut'
keywords: ['shortcut', 'public-desktop', 'microsoft365', 'office', 'click-to-run', 'c2r', 'onboarding', 'lnk']
description: 'Creates a Microsoft 365 folder on the Public Desktop containing a shortcut for every installed Microsoft 365 application, waiting for the Office install to finish first.'
tags: ['microsoft365', 'office365', 'deployment', 'onboarding', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Overview

This script puts a single folder on the **Public Desktop** — `Microsoft 365` by default — and fills it with a shortcut for every Microsoft 365 application installed on the machine.

Because the folder lives on the Public Desktop, it appears on the desktop of **every user** of that machine, including users who log in for the first time later. That removes the per-user shortcut step from a build or onboarding process.

The script is built to be run **as part of a deployment, immediately after the Microsoft 365 install job is kicked off**. It does not assume Office is already there — it waits for the Click-to-Run install to finish, then creates the shortcuts.

- **Waits for the install.** Polls the Click-to-Run configuration, the application executables, and the Click-to-Run worker processes. Shortcuts are only written once the executables exist and the installer has gone quiet.
- **Safe on machines without Office.** If Microsoft 365 never appears within the timeout, nothing is written to the desktop.
- **Idempotent.** An existing folder is reused, and existing shortcuts are rewritten to point at the current executables — so it is safe to re-run after an Office repair, reinstall, or version change.
- **Silent.** Nothing is written to the console or the pipeline. Every message, including the per-application results, goes to the log file only.

## Quick Start

Run with no parameters. This is the intended use in almost all cases:

```powershell
.\Set-M365Shortcut.ps1
```

Waits up to 45 minutes for Microsoft 365 to finish installing, then creates a shortcut for every installed application in `C:\Users\Public\Desktop\Microsoft 365`.

If Office is already installed and you do not want the script to wait at all:

```powershell
.\Set-M365Shortcut.ps1 -TimeoutMinutes 0
```

## Requirements

**Environment prerequisites:**

- Windows with **PowerShell 5.1** or later.
- Microsoft 365 Apps (**Office Click-to-Run**) installed, or an install in progress. Volume-licensed MSI installs of Office are not supported.
- Network connectivity to `contentrepo.net` and the PowerShell Gallery, so the `Strapper` logging module can be installed or updated.

**Runtime requirements:**

- Must run with **Administrative privileges** (enforced by `#Requires -RunAsAdministrator`), because the Public Desktop is not writable by a standard user. Running as `SYSTEM` from an RMM is the intended use.

## Impact

When you run this script on a machine, it:

1. Waits for Microsoft 365 to be installed and for Click-to-Run to go idle, up to `-TimeoutMinutes`. It continues as soon as both are true — the timeout is a ceiling, not a duration.
2. Logs the detected product, version, platform, install path, and the applications it is about to shortcut.
3. Creates the folder on the Public Desktop if it does not already exist, or reuses it if it does.
4. Writes one `.lnk` per installed application, each with its target, working directory, icon, and description set.
5. Logs a per-application result line (`Created`, `Updated`, or `Failed`) and a summary.

The folder becomes visible on the desktop of every user of the machine. Existing user desktops are otherwise untouched — no per-user shortcuts are added, moved, or removed.

## What This Script Does Not Do

- Does **not** install, update, or repair Microsoft 365. It only waits for an install that something else started.
- Does **not** create shortcuts for applications that are not installed. Requested-but-missing applications are logged and skipped.
- Does **not** touch the Start Menu, the taskbar, or any individual user's desktop.
- Does **not** remove shortcuts, and does **not** clean up the folder if an application is later uninstalled.
- Does **not** pin the folder, set its icon, or control where it appears on the desktop.
- Does **not** write anything to the console or the pipeline, and does **not** set a non-zero exit code on failure. Check the log file for results.
- Does **not** support volume-licensed **MSI** installs of Office.

## Process

1. **Wait for the install** — Polls every **15 seconds**. A poll counts as ready when at least one requested application executable exists *and* no Click-to-Run worker process (`OfficeClickToRun.exe`, `OfficeC2RClient.exe`, `officesvcmgr.exe`, `IntegratedOffice.exe`) is running. **Two consecutive ready polls** are required, because Click-to-Run goes briefly quiet between install stages. With `-TimeoutMinutes 0`, a single check is made. One progress line is logged per minute.
2. **Locate the applications** — Reads `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration` and searches only under the registered `InstallationPath` (`\root\Office16` on current builds, `\Office16` on older ones). A folder is only accepted if it actually contains a supported application, so a folder Click-to-Run has created but not yet populated is not mistaken for a finished install.
3. **Resolve the Public Desktop** — Read from the `Common Desktop` shell folder value so localized and redirected desktops resolve correctly, falling back to `%PUBLIC%\Desktop`.
4. **Create the folder and shortcuts** — The folder is created if missing. Each shortcut is written, then confirmed to exist on disk before being reported as successful.

If the executables are present but Click-to-Run never goes quiet before the timeout, the script logs a warning and creates the shortcuts anyway — the resolved paths do not change once the applications exist.

## Payload Usage

```powershell
.\Set-M365Shortcut.ps1
```

Waits up to 45 minutes, then shortcuts every installed application into `C:\Users\Public\Desktop\Microsoft 365`.

```powershell
.\Set-M365Shortcut.ps1 -FolderName 'Office Apps' -TimeoutMinutes 90
```

Uses `C:\Users\Public\Desktop\Office Apps` instead, and allows the install up to 90 minutes to finish. Useful on slow links where a full Microsoft 365 download takes longer than the default allowance.

```powershell
.\Set-M365Shortcut.ps1 -Application 'Word', 'Excel', 'Outlook' -TimeoutMinutes 0
```

Does not wait. Creates shortcuts only for Word, Excel, and Outlook, and only for those that are already installed. Use this on machines where Office is known to be in place.

Run from an RMM as `SYSTEM`:

```powershell
PowerShell.exe -ExecutionPolicy Bypass -File .\Set-M365Shortcut.ps1
```

## Parameters

| Parameter         | Alias | Required | Default           | Type       | Description |
| ----------------- | ----- | -------- | ----------------- | ---------- | ----------- |
| `Application`     |       | False    | *(all installed)* | String\[\] | Limits the shortcuts to the named applications. Accepts one or more of `Word`, `Excel`, `PowerPoint`, `Outlook`, `OneNote`, `Access`, `Publisher`, `Project`, `Visio`. When omitted, every supported application that is installed receives a shortcut. |
| `FolderName`      |       | False    | `Microsoft 365`   | String     | The name of the folder created on the Public Desktop. A folder name only — path separators and other invalid file name characters are rejected. |
| `TimeoutMinutes`  |       | False    | `45`              | Int        | How long to wait for a Microsoft 365 install to appear and finish, from `0` to `240`. This is a ceiling, not a duration — the script continues as soon as the applications are present and Click-to-Run is idle. Pass `0` to skip waiting entirely and check the current state once. |

## Output

The script writes no console or pipeline output. Everything it has to say is in the log file.

**Shortcuts created:**

```text
C:\Users\Public\Desktop\<FolderName>\<Application>.lnk
```

**Logs**, handled by the `Strapper` module:

```text
.\Set-M365Shortcut-log.txt
.\Set-M365Shortcut-error.txt
```

plus Strapper's SQLite log database.

The log contains the detected product, version, platform, and install path; the applications skipped as not installed; a `Created` / `Updated` / `Failed` line per application; and a final count of shortcuts written.

## Troubleshooting

| Symptom / Message | Likely Cause | What to Do |
| --- | --- | --- |
| `Microsoft 365 was not installed after waiting <N> minute(s). No shortcuts were created.` | The install never completed within the timeout, failed, or was never started. | Confirm the Microsoft 365 install job actually ran and succeeded, then re-run this script. Raise `-TimeoutMinutes` on slow connections. |
| `Microsoft 365 (Office Click-to-Run) does not appear to be installed on this machine. No shortcuts were created.` | Run with `-TimeoutMinutes 0` on a machine without Microsoft 365, or the machine has a volume-licensed **MSI** install. | Install Microsoft 365 Apps, or run without `-TimeoutMinutes 0` so the script waits for the install. |
| `Click-to-Run was still busy after <N> minute(s), but the application executables are present. Continuing.` | An Office update or repair was running when the timeout expired. | Informational. The shortcuts were still created and are valid. |
| `Not installed, skipping: <apps>` | An application named in `-Application` is not part of the installed Microsoft 365 product. | Expected on most builds — `Project`, `Visio`, `Access`, and `Publisher` are licensed separately. Remove them from `-Application` or install them. |
| `The Public Desktop folder could not be resolved.` | The `Common Desktop` shell folder value is wrong or the folder is missing, typically from an aggressive folder-redirection policy. | Check the Public Desktop path on the machine and any folder-redirection GPOs. |
| `Failed to create the Public Desktop folder '<path>'.` | Insufficient rights, or the path is blocked by a policy or security product. | Confirm the script ran elevated (as `SYSTEM` from the RMM). Check for a policy restricting writes to the Public Desktop. |
| `Failed to write the shortcut '<path>'.` | Shortcut creation was blocked — commonly an antivirus or application-control product blocking `WScript.Shell`. | Review the security product's logs and allow the script, then re-run. |
| `Shortcuts point at an old Office version after an upgrade.` | The shortcuts were created before the version change. | Re-run the script. Targets are rewritten to the current executables. |
| `Shortcuts do not appear on a user's desktop.` | Public Desktop items are hidden by policy, or the user's desktop is redirected. | Check the "Remove Common program groups" / desktop-redirection policies applying to that user. |
| `No log file is produced.` | The `Strapper` module could not be installed — no access to `contentrepo.net` or the PowerShell Gallery. | Allow outbound access to both, then re-run. Logging is required; the script cannot report results without it. |

## Rollback and Undo

Everything the script creates is a file on disk, and removing it is straightforward:

| Change | Reverted automatically? | Manual undo |
| --- | --- | --- |
| Folder created on the Public Desktop | No | `Remove-Item -Path 'C:\Users\Public\Desktop\Microsoft 365' -Recurse -Force` |
| Shortcuts inside the folder | No | Delete the individual `.lnk` files, or remove the whole folder. |
| Log files in the script directory | No | Delete `Set-M365Shortcut-log.txt` and `Set-M365Shortcut-error.txt`. |

The script makes **no registry changes**, creates no scheduled tasks, installs nothing beyond the `Strapper` logging module, and does not modify the Microsoft 365 installation.

Deleting the folder removes the shortcuts from every user's desktop at once. Individual users can also delete the folder from their own desktop only if they have rights to the Public Desktop — normally they cannot, which is the point.

## Related Content

- **[New-DesktopUriShortcut](/docs/56fa7d90-7c83-4c4a-ac0e-c49a6d5701af)** — creates a single Public Desktop shortcut to any file or website. Use it for one-off shortcuts outside Microsoft 365.
- **[Invoke-Office365Repair](/docs/b5cb3a64-95d8-4d68-be9f-a4e978923112)** — repairs a broken Microsoft 365 install. Re-run `Set-M365Shortcut` afterwards if the repair changed the install path or version.
- **[Update-Office](/docs/498075f7-623c-4b92-9fbc-fe0f5e7113a4)** — updates Microsoft 365 to the latest version.
- **[Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed)** — removes Microsoft Office products when a reinstall is needed.

## Changelog

### 2026-08-17

- Initial version of the document
