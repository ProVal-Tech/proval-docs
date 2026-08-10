---
id: 'b5cb3a64-95d8-4d68-be9f-a4e978923112'
slug: /b5cb3a64-95d8-4d68-be9f-a4e978923112
title: 'Invoke-Office365Repair'
title_meta: 'Invoke-Office365Repair'
keywords: ['office', 'office-repair', 'click-to-run', 'c2r', 'quick-repair', 'full-repair', 'online-repair', 'officeclicktorun']
description: 'Runs an unattended Quick or Full repair of Microsoft 365 / Office Click-to-Run apps, waits for the repair to actually finish, and verifies the install afterwards.'
tags: ['office365', 'office', 'microsoft365', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-10
---

## Overview

This script repairs the **Microsoft 365 / Office 365 Click-to-Run** apps on the local machine. It wraps Microsoft's own supported `OfficeClickToRun.exe` repair command line so that a **Quick Repair** or a **Full (online) Repair** can be triggered unattended from an RMM, with no user session and no prompts.

The command it builds is Microsoft's, unchanged:

```text
"<ClientFolder>\OfficeClickToRun.exe" scenario=Repair platform=<x86|x64|arm64>
    culture=<ll-cc> forceappshutdown=True
    RepairType=<QuickRepair|FullRepair> DisplayLevel=False
```

What the script adds around that command is the part that matters unattended:

- **Locates `OfficeClickToRun.exe`** from the Click-to-Run registry, then the `ClickToRunSvc` service image path, then the known install folders — rather than assuming a hard-coded path.
- **Detects `platform` and `culture`** from the Click-to-Run configuration. These must match the *installed* Office bitness and language, **not** the operating system. Click-to-Run accepts a mismatched platform, exits `0`, and then repairs nothing.
- **Pre-flight checks** that Office really is Click-to-Run, that `ClickToRunSvc` is running, and that no other Click-to-Run operation is already in progress.
- **Waits for the repair to actually finish.** `OfficeClickToRun.exe` hands the work to the Click-to-Run service and can return long before the repair is done, so its exit code proves nothing on its own. The script watches the Click-to-Run worker processes for liveness instead.
- **Verifies the install afterwards**, and specifically catches the classic *"the command returned 0 and did nothing"* failure.
- **Exits `0` on success and `1` on failure** so the RMM can alert.

> **Warning:** `forceappshutdown=True` closes Word, Excel, Outlook and the rest **without prompting and without saving**. It is required for an unattended repair, but running this during the day will lose a user's unsaved work. Schedule it outside working hours, or pass `-LeaveAppsOpen` to send `forceappshutdown=False` instead.

## Quick Start

> **Try QuickRepair first → escalate to FullRepair only if it doesn't resolve the issue.**

| Phase | When | What you do |
| --- | --- | --- |
| **1. Quick Repair** (First attempt) | Any maintenance window | Run `.\Invoke-Office365Repair.ps1` with no parameters. Repairs from the local cache — fast, works offline, and fixes most problems. |
| **2. Full Repair** (Escalation) | Only if the Quick Repair did not fix it | Run `.\Invoke-Office365Repair.ps1 -RepairType FullRepair`. Effectively uninstalls and reinstalls Office from the Microsoft CDN. Needs internet access and takes considerably longer. |

> **Remember:** Both repair types close all running Office apps without saving (unless `-LeaveAppsOpen` is passed). Schedule accordingly.

## Requirements

**Environment prerequisites:**

- Windows with **Office Click-to-Run** installed (Microsoft 365 Apps, Office 2013/2016/2019/2021/2024 C2R).
- **PowerShell 5.1** or later.
- The `ClickToRunSvc` service present (the script will start it if it is stopped, and set it from `Disabled` to `Manual` if needed).
- Internet access to the Microsoft CDN — **only** for `-RepairType FullRepair`. A `QuickRepair` works offline.
- Network connectivity to `contentrepo.net` and the PowerShell Gallery, to automatically install/update the `Strapper` module if missing. This is **optional** — see **Output** below.

**Runtime requirements:**

- The script must be run with **Administrative privileges** (enforced by `#Requires -RunAsAdministrator`). Running as `SYSTEM` via an RMM is the intended use.
- **Click-to-Run only.** Volume-licensed MSI installs of Office have no `OfficeClickToRun.exe` and are repaired with `msiexec /f` instead. The script detects this and exits with a clear message rather than failing obscurely.

## Impact

When you run this script on a machine, it:

1. Reads the Click-to-Run configuration and logs the product, version, platform, culture, install path, and client path.
2. Resolves the `platform` and `culture` to send: an explicit override wins, then the detected value, then a fallback (`x64` / `en-us`).
3. Starts `ClickToRunSvc` if it is stopped. **If the service is `Disabled`, its start type is changed to `Manual`.** This is the script's only persistent configuration change, and it is not reverted.
4. Aborts if another Click-to-Run operation (an update or another repair) is already running.
5. **Closes every running Office application without saving** (unless `-LeaveAppsOpen` is passed), then runs the repair.
6. Waits for the repair to go quiet, logging one progress line per minute.
7. Verifies the install and reports the result via the exit code.

The repair itself is Microsoft's and resets the Office program files. A `QuickRepair` does not touch user data, profiles, or activation. A `FullRepair` removes and re-downloads the entire installation.

> **There is no undo.** A repair cannot be rolled back — see **Rollback and Undo**.

## What This Script Does Not Do

- Does **not** repair volume-licensed **MSI** installs of Office. Use `msiexec /f` for those.
- Does **not** show a repair UI. `DisplayLevel=False` is fixed, because as `SYSTEM` there is no user session for the UI to appear in.
- Does **not** perform any scenario other than `Repair`. It will not install, update, uninstall, or change the Office channel.
- Does **not** save open documents before closing Office apps, and does **not** reopen them afterwards.
- Does **not** reboot the machine.
- Does **not** touch Office activation, licensing, or user profiles/OST files.
- Does **not** guarantee that a `FullRepair` completes silently — see the warning in **Troubleshooting**.

## Process

1. **Detect the install** — Reads `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration`. Finds `OfficeClickToRun.exe` by checking, in order: the `ClientFolder` value, the `ClickToRunSvc` service image path, then the well-known install folders (including the Office 15 layout). Throws if Office is not Click-to-Run, or if it is registered but the executable is missing.
2. **Resolve platform and culture** — Override, then the detected value, then the fallback. Warns loudly when an override disagrees with what Office reports, because a mismatch makes the repair silently do nothing.
3. **Check the service** — Confirms `ClickToRunSvc` exists and is `Running`; starts it (and un-disables it) if not.
4. **Refuse to stack** — Enumerates the Click-to-Run worker processes (`OfficeClickToRun.exe`, `OfficeC2RClient.exe`, `officesvcmgr.exe`, `IntegratedOffice.exe`), excluding the permanently running `/service` host by its PID. Aborts if any are already busy.
5. **Warn about unsaved work** — Logs any running Office apps and what `forceappshutdown` is about to do to them.
6. **Run the repair** — Launches Microsoft's command line without `-Wait`, recording a baseline of busy PIDs and of the existing `REPAIR` scenario instance ID beforehand.
7. **Wait for completion** — Polls every **15 seconds**. The repair is considered finished once the launcher and all new worker processes have been gone for **4 consecutive polls (60 seconds)**. A **120-second grace period** at the start prevents a slow service pickup from being misread as a repair that never ran. A changed `REPAIR` instance ID in the registry is used as independent confirmation that the service accepted the request, and reports back the parameters it accepted. Ceilings: **45 minutes** for a `QuickRepair`, **120 minutes** for a `FullRepair` — these are limits, not durations; the script returns as soon as the repair goes quiet.
8. **Verify** — Re-reads the configuration, compares the version before and after, and confirms the install path still contains at least one of `WINWORD.EXE`, `EXCEL.EXE`, `OUTLOOK.EXE`, or `POWERPNT.EXE`. On any failure it also lists recent Click-to-Run logs from `%windir%\Temp` and `%TEMP%` for a technician to review.

## Payload Usage

```powershell
.\Invoke-Office365Repair.ps1
```

Quick Repair, silent, closing any open Office apps. This is the default and the right first attempt.

```powershell
.\Invoke-Office365Repair.ps1 -RepairType FullRepair
```

Full (online) Repair — uninstalls and reinstalls Office from the Microsoft CDN.

```powershell
.\Invoke-Office365Repair.ps1 -Platform x86 -Culture en-gb
```

Quick Repair with the platform and culture forced, for a machine whose Click-to-Run registry values are wrong.

```powershell
.\Invoke-Office365Repair.ps1 -LeaveAppsOpen
```

Quick Repair that leaves running Office apps alone. The repair will usually fail if anything is open, but no unsaved work is lost.

Run from an RMM as `SYSTEM`:

```powershell
PowerShell.exe -ExecutionPolicy Bypass -File .\Invoke-Office365Repair.ps1 -RepairType QuickRepair
```

## Parameters

| Parameter          | Alias | Required | Default        | Type     | Description                                                                                                                                                                     |
| ------------------ | ----- | -------- | -------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `RepairType`       |       | False    | `QuickRepair`  | String   | `QuickRepair` repairs from the local cache — fast and works offline. `FullRepair` is the Office UI's "Online Repair": it reinstalls Office from the CDN. The wait allowance scales automatically. |
| `Platform`         |       | False    | *(detected)*   | String   | The Office bitness: `x86`, `x64`, or `arm64`. Defaults to what the Click-to-Run configuration reports. Only override this if that registry value is wrong — a mismatch makes the repair silently do nothing. |
| `Culture`          |       | False    | *(detected)*   | String   | The Office language, e.g. `en-us`. Defaults to the Click-to-Run configuration value. As with `Platform`, the detected value is normally correct.                                 |
| `LeaveAppsOpen`    |       | False    | `$false`       | Switch   | By default the repair sends `forceappshutdown=True`, which is required for an unattended repair. Pass `-LeaveAppsOpen` to send `forceappshutdown=False` instead and leave running apps alone, at the cost of the repair likely failing. |

`scenario=Repair` and `DisplayLevel=False` are fixed and are not exposed as parameters.

## Exit Codes

| Code | Meaning |
| --- | --- |
| `0` | The repair completed and the Office install was verified intact. |
| `1` | Any failure: Office is not Click-to-Run, the service is unavailable, another operation was in progress, the repair timed out, no repair activity ever started, or the install did not verify afterwards. |

## Output

Logging is handled by the `Strapper` module:

```text
.\Invoke-Office365Repair-log.txt
.\Invoke-Office365Repair-error.txt
```

plus Strapper's SQLite log database.

If `Strapper` is unavailable (for example, no access to `contentrepo.net` or the PowerShell Gallery), the script falls back to writing the same messages to standard output via a local `Write-Log` with an identical signature. **The repair is never blocked by the logging layer** — only the log files are lost, and the RMM console output still contains everything.

## Troubleshooting

Every failure path logs a message prefixed with `An error occurred:` and, where relevant, lists recent Click-to-Run logs from `%windir%\Temp` and `%TEMP%` to review.

| Symptom / Message | Likely Cause | What to Do |
| --- | --- | --- |
| `Office Click-to-Run was not found (no ...\ClickToRun\Configuration key).` | This machine has a volume-licensed **MSI** install of Office, or no Office at all. | Repair MSI installs with `msiexec /f` instead. Confirm Office is actually installed. |
| `Office Click-to-Run is registered but OfficeClickToRun.exe could not be found.` | The Click-to-Run client itself is missing — the install is damaged beyond what a repair can fix. | Reinstall Office. [Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed) can clear the remains first. |
| `The ClickToRunSvc service does not exist.` | Office Click-to-Run is not installed correctly. | Reinstall Office. |
| `Could not start ClickToRunSvc: <message>` | The service is disabled by policy, or corrupted. | Check for a GPO disabling the service, then investigate the System event log. |
| `Another Click-to-Run operation (an update or repair) is already in progress.` | An Office update or another repair is running. A stacked request would be rejected anyway. | Let it finish and run the script again. The log lists the busy process names and PIDs. |
| `The repair command returned without any repair activity ever starting.` | **The most common real failure.** `OfficeClickToRun.exe` accepted a malformed request, exited `0`, and did nothing. Almost always a `platform` or `culture` that does not match the install. | Compare the values in the log against `HKLM:\SOFTWARE\Microsoft\Office\ClickToRun\Configuration` (`Platform` and `ClientCulture`), then re-run with the correct `-Platform` / `-Culture`. |
| `The repair did not finish within <N> minutes.` | A genuinely slow `FullRepair` (large download, slow link), or a stalled Click-to-Run operation. | Click-to-Run may still be working — check the machine before retrying. Review the Click-to-Run logs listed in the output. |
| `The repair ran but the Office install no longer looks complete.` | The repair removed Office but did not put it back — typically a `FullRepair` that lost its connection to the CDN partway through. | Office needs to be reinstalled. Do not simply re-run the repair. |
| `The culture override '<x>' is not a valid ll-cc language tag.` | A malformed `-Culture` value. | Use a proper language tag, e.g. `en-us`, `en-gb`, `fr-fr`. |
| `Click-to-Run ran a <X> rather than the requested <Y>.` | The service substituted a different repair type. | Informational warning. Check the result; if a `FullRepair` was downgraded, investigate connectivity. |
| A silent `FullRepair` never completes. | A known behaviour on some Office builds: `DisplayLevel=False` combined with `FullRepair` can stall. The script warns about this before starting one. | Use `-RepairType QuickRepair`, or perform the Online Repair interactively from the Office UI on that machine. |
| Users report lost work after the run. | `forceappshutdown=True` closed their apps without saving. Working as designed. | Schedule the script outside working hours, or use `-LeaveAppsOpen` and accept that the repair will fail if Office is open. |

## Rollback and Undo

**An Office repair cannot be undone.** There is no rollback step, and the script does not attempt one — by the time the repair is running, the work is being done by Microsoft's Click-to-Run service and is outside the script's control.

What the script leaves behind is limited and predictable:

| Change | Reverted automatically? | Manual undo |
| --- | --- | --- |
| Office program files repaired/reinstalled | No — this is the intended outcome | Not applicable. Reinstall Office if the result is worse than the starting point. |
| Running Office apps closed | No | Users reopen their apps. Unsaved work is unrecoverable. |
| `ClickToRunSvc` started | No — it is left running, which is its normal state | `Stop-Service -Name 'ClickToRunSvc'` |
| `ClickToRunSvc` start type changed from `Disabled` to `Manual` | No | `Set-Service -Name 'ClickToRunSvc' -StartupType 'Disabled'` — though a disabled `ClickToRunSvc` will break Office updates. |

The script writes no files of its own apart from its logs, creates no scheduled tasks, and makes no other registry changes.

**If a run aborted during pre-flight** — before the repair was launched — nothing was changed at all beyond possibly starting `ClickToRunSvc`. Fix the reported cause and re-run.

**If Office is broken after a `FullRepair`** — the executables are missing from the install path and the script reported the install as not intact — a repair cannot recover it. Reinstall Office, using [Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed) first if the installer refuses.

## Related Content

- **[Invoke-OfficeScrub](/docs/e9253255-9a1f-4392-8ec6-9f7fb6e401ed)** — removes Microsoft Office products via OffScrub. Use it when a repair cannot recover the install and Office must be reinstalled cleanly.

## Changelog

### 2026-08-10

- Replaced the `-ForceAppShutdown` boolean parameter with a `-LeaveAppsOpen` switch
- Documented the `contentrepo.net` dependency for the `Strapper` module

### 2026-07-29

- Initial version of the document
