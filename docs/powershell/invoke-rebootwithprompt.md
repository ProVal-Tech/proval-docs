---
id: '1ff05046-df36-4692-80a7-36458aa43392'
slug: /1ff05046-df36-4692-80a7-36458aa43392
title: 'Invoke-RebootWithPrompt'
title_meta: 'Invoke-RebootWithPrompt'
keywords: ['reboot', 'prompt', 'scheduling', 'windows', 'restart']
description: 'Prompts end users to reboot their Windows 10/11 device with postponement and scheduling logic.'
tags: ['reboot', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-06-03
---

## Description

Prompts end users to reboot their Windows 10/11 device with postponement and scheduling logic.

The script runs under SYSTEM via RMM and self-reschedules with scheduled tasks, so the RMM only needs to run it once.

**Default flow:**

1. Up to 4 regular prompts are shown (`Postpone` or `Reboot Now`).
2. On the 5th prompt, the user can select a reboot time within 48 hours (`Schedule Reboot`).
3. If a reboot is scheduled 15+ minutes in the future, a reminder appears 10 minutes before reboot.
4. If the 5th prompt is ignored, reboot is forced when the final prompt times out (default 15 minutes).

Dutch prompt text is shown automatically for `nl-NL` and `nl-BE` display languages.

**Behavior details:**

- **Locked screen** — Prompts are skipped; the script reschedules itself to try again at the next interval.
- **No internet** — The script reschedules itself rather than failing.
- **.NET Desktop Runtime 10** — Automatically installed if not already present (required by Prompter).
- **Idempotent** — Re-running while a prompt cycle is active exits without changes unless `-Force` is specified.

## Requirements

- Windows 10 or Windows 11
- PowerShell 5.0+
- Administrative context (SYSTEM via RMM recommended)
- Internet access for Prompter, .NET Desktop Runtime 10, and Strapper bootstrap

## Usage

Run with defaults:

```powershell
.\Invoke-RebootWithPrompt.ps1
```

More frequent prompts:

```powershell
.\Invoke-RebootWithPrompt.ps1 -MaxPostpone 4 -IntervalMinutes 60
```

Reset existing prompt cycle:

```powershell
.\Invoke-RebootWithPrompt.ps1 -Force
```

## Parameters

| Parameter                | Required | Default | Type   | Description                                                        |
|--------------------------|----------|---------|--------|--------------------------------------------------------------------|
| `MaxPostpone`            | False    | `4`     | Int    | Number of regular prompts before the final scheduling prompt.      |
| `IntervalMinutes`        | False    | `240`   | Int    | Minutes between prompt attempts.                                   |
| `RegularPromptTimeout`   | False    | `600`   | Int    | Timeout in seconds for regular prompts.                            |
| `FinalPromptTimeout`     | False    | `900`   | Int    | Timeout in seconds for the final scheduling prompt.                |
| `DelayAfterFinalPrompt`  | False    | `900`   | Int    | Delay in seconds when an invalid/too-soon schedule is selected.    |
| `SuppressPopupTimeWindows` | False  |         | String | Suppress window in `HHmm-HHmm` format.                            |
| `SkipWeekends`           | False    | `False` | Switch | Skip prompting on weekends.                                        |
| `IfNotLoggedIn`          | False    | `False` | Switch | Reboot immediately if no user is logged in.                        |
| `Force`                  | False    | `False` | Switch | Reset prompt state and scheduled tasks.                            |
| `Icon`                   | False    |         | String | Optional prompt icon path or URL.                                  |
| `HeaderImage`            | False    |         | String | Optional header image path or URL.                                 |
| `Title`                  | False    | `Device Reboot Required` | String | Prompt window title.                                  |
| `RegularPromptMessage`   | False    |         | String | Message for regular prompts.                                       |
| `FinalPromptMessage`     | False    |         | String | Message for the final scheduling prompt.                           |
| `ReminderPromptTitle`    | False    |         | String | Title for the reminder prompt before a scheduled reboot.           |
| `ReminderPromptMessage`  | False    |         | String | Message for the reminder prompt before a scheduled reboot.         |


## Output

**Artifacts created:**

| Artifact | Path |
|----------|------|
| Prompter app | `C:\ProgramData\_Automation\App\Prompter\Prompter.exe` |
| Script persistence | `C:\ProgramData\_Automation\Script\Invoke-RebootPrompt\Invoke-RebootWithPrompt.ps1` |
| Scheduled task (main) | `Scheduled_Task_Invoke-RebootPrompt` |
| Scheduled task (reschedule) | `Scheduled_Task_Invoke-RebootPrompt_Reschedule` |
| Scheduled task (reminder) | `Scheduled_Task_Invoke-RebootPrompt_Reminder` |

## Changelog

### 2026-06-03

- Initial version of the document
