---
id: '9817ce6b-6f8c-4718-844f-4f44f6c66376'
slug: /9817ce6b-6f8c-4718-844f-4f44f6c66376
title: 'Reboot Pending Prompt - Detection'
title_meta: 'Reboot Pending Prompt - Detection'
keywords: ['reboot', 'reboot-pending', 'uptime', 'prompter', 'reboot-pending', 'reboot-pending-prompt']
description: 'Detection script for the "Reboot Pending Prompt" solution. Determines if a machine requires a reboot and if the current conditions permit a user prompt.'
tags: ['reboot', 'notifications', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-06-10
---

## Overview

This script serves as the detection logic for the [Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb) solution. Its primary function is to intelligently decide whether a reboot prompt should be displayed to the user.

It performs checks in three key areas:

1. **Operational Safety:** Before evaluating necessity, the script checks if the [Reboot Pending prompt - Autofix](/docs/7e3688a0-9f8f-40cf-9239-0e3593a84ba8) is currently active (specifically checking for the scheduled task it manages). If a prompt cycle is already in progress, this script exits immediately to prevent conflicting or duplicate actions.
2. **Necessity:** It determines if a reboot is actually required by checking Windows Registry keys (for pending updates), comparing system uptime against a configured threshold, or checking for a manual administrator override.
3. **Timing & Convenience:** If a reboot is needed, the script then validates if the current moment is appropriate for a prompt. It checks constraints such as "Quiet Hours" (suppress windows), weekend exclusions, user presence (logged in vs. lock screen), and ensures the user isn't prompted too frequently.

If the script determines a reboot is needed, the timing is valid, and no conflicting prompts are active, it returns an exit code that triggers the remediation script.

## Install-In-Progress Protection

Before allowing any unattended reboot (no user logged in, or locked screen with the missed prompt threshold reached), the script checks whether the machine is currently installing software or updates. If it detects an active install, it skips the reboot and exits cleanly. The next time the script runs, it checks again. Once the install finishes, the reboot proceeds normally.

This prevents the machine from restarting in the middle of a Windows Update, application installer, or feature upgrade.

The script looks for the following signals:

| Signal | What It Means |
| :--- | :--- |
| TiWorker.exe | Windows Update is actively installing an update |
| wusa.exe | A standalone Windows Update package is being installed |
| SetupHost.exe | A Windows Feature Update is in progress |
| setup.exe | A general installer is running |
| MoUsoCoreWorker.exe | The Windows Update orchestrator is doing background work |
| Windows10Upgrader.exe | A feature upgrade using the Windows Update Agent is running |
| winget.exe (active) | Windows Package Manager is installing or updating software (only when actively using CPU) |
| BITS transfer jobs | Background downloads are in progress (used by Windows Update and other services) |
| MSI mutex held | An MSI installer package is currently running |

> **Note:** This check only applies to unattended reboots. If a user is at their desk and clicks "Yes" to reboot, the reboot happens immediately regardless of background installs. The user made a conscious choice.

## Sample Run

> **Note:** This script is specifically engineered to operate as the detection condition within the [Reboot Pending Prompt - Windows Workstation](/docs/b540cb53-0d54-4d63-9ce4-073732fd1aa3) policy. Manual execution is not recommended, as the script's output is intended to trigger automated remediation actions rather than provide direct feedback.

## Dependencies

- [Custom Field: cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01)
- [Custom Field: cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395)
- [Custom Field: cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45)
- [Custom Field: cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278)
- [Custom Field: cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33)
- [Custom Field: cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c)
- [Custom Field: cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098)
- [Custom Field: cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83)
- [Custom Field: cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d)
- [Custom Field: cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562)
- [Custom Field: cPVAL Max Missed Prompts Before Force](/docs/f93e2bb8-905f-4032-98c5-4d943f0e6580)
- [Custom Field: cPVAL Consecutive Missed Prompts](/docs/e61fd6fa-cf42-4315-831f-d4a150bc53d6)
- [Custom Field: cPVAL First Missed Prompt Time](/docs/d6add994-9648-4f4c-9888-b2c8416b0c9a)
- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Fields

| Custom Field | Description |
| :--- | :--- |
| [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) | Manual override to force a prompt cycle. |
| [cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395) | Timestamp of the last successful prompt. Managed automatically. |
| [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) | Counter for how many times the user has been prompted. Managed automatically. |
| [cPVAL Reboot Prompt When Pending Reboot](/docs/be5436e5-e658-4e31-a5ca-4a6bf8052278) | Enable/Disable detection based on Windows Registry keys. |
| [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) | Uptime threshold (days) to trigger a reboot. Set to 0 to disable. |
| [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) | Max number of prompts allowed before the cycle resets (or force reboot occurs). |
| [cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098) | Minimum hours to wait between consecutive prompts. |
| [cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83) | Enable to suppress prompts on Saturdays and Sundays. |
| [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d) | 24-hour time range (HHmm-HHmm) to suppress prompts (e.g., '1800-0800'). |
| [cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562) | Enable to reboot immediately if no user is signed in. |
| [cPVAL Max Missed Prompts Before Force](/docs/f93e2bb8-905f-4032-98c5-4d943f0e6580) | Number of consecutive missed prompts allowed before the script triggers a forced reboot. Set to 0 to disable forced reboot. |
| [cPVAL Consecutive Missed Prompts](/docs/e61fd6fa-cf42-4315-831f-d4a150bc53d6) | Tracks how many prompt cycles were missed because the screen was locked or no user was signed in. Managed automatically. |
| [cPVAL First Missed Prompt Time](/docs/d6add994-9648-4f4c-9888-b2c8416b0c9a) | Records when the current missed-prompt streak began. Managed automatically. |

## Default Values

The script includes built-in defaults when related custom fields are blank or not set:

| Setting | Variable Name | Default Value |
| :--- | :--- | :--- |
| Reboot Prompt Count | `$defaultRegularPromptCount` | 4 |
| Reboot Prompt Duration Between Prompt | `$defaultDurationBetweenPromptsHours` | 4 hours |
| Reboot Prompt Suppress Time Window | `$defaultSuppressTimeWindow` | Blank (disabled) |
| Max Missed Prompts Before Force | `$defaultMaxMissedPromptsBeforeForce` | 0 (disabled) |
| Reboot if Not Logged In | `$defaultRebootIfNotLoggedIn` | Disable |
| Reboot Prompt Skip Weekends | `$defaultSkipWeekends` | Disable |

Do not change these values directly in the script. The PowerShell script is code-signed, and editing the defaults will break the signature. If you need different built-in defaults, send a request to ProVal.

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/reboot-pending-prompt-detection.ps1)

## Output

- **Activity Details:** Text output indicating if a reboot is required and if conditions were met.
- **Custom Fields:** Updates `cPVAL Pending Reboot`, `cPVAL Last Prompted`, `cPVAL Times Prompted`, `cPVAL Consecutive Missed Prompts`, and `cPVAL First Missed Prompt Time` as part of reset and missed-prompt tracking.

## Changelog

### 2026-06-10

- Missed prompt counter now uses real elapsed time instead of counting each script run. This makes the
  forced reboot timeline predictable no matter how often the detection script checks in.
- Added safety checks for active installations before rebooting unattended machines. The script now looks
  for Windows Updates, feature upgrades, MSI installers, BITS downloads, and winget activity.
- If a forced reboot is due but an install is still running, the reboot waits until the install finishes.
  It will trigger automatically on the next check after the install completes.
- Machines with no user logged in will no longer reboot mid-update. The script exits safely and retries
  on the next cycle once servicing is done.
- Winget (Windows Package Manager) is only treated as active when it is actually doing work, preventing
  false detections from an idle process.
- Script documentation updated to reflect all of the above changes.

### 2026-06-03

- Added support for missed-prompt tracking custom fields.
- Added default values for missed-prompt handling, weekend behavior, suppress window behavior, and no-user reboot behavior.

### 2026-05-26

- Added a default values region in the PowerShell script.
- Fixed a bug where the script was failing to reset the custom fields for manual reboot after rejecting the first prompt.

### 2026-03-23

- Updated .Net8 Desktop Runtime installation logic to install the latest available version.
- Code Signed the PowerShell script.

### 2025-12-19

- Initial version of the document
