---
id: '0a3f085c-11da-4567-80c3-8ba2f4047e4a'
slug: /0a3f085c-11da-4567-80c3-8ba2f4047e4a
title: 'Reboot Pending Prompt - Detection [Macintosh]'
title_meta: 'Reboot Pending Prompt - Detection [Macintosh]'
keywords: ['reboot', 'reboot-pending', 'uptime', 'omniprompt', 'reboot-pending-prompt', 'macos']
description: 'Detection script for the "Reboot Pending Prompt" solution on macOS. Determines if a Mac requires a reboot and if the current conditions permit a user prompt.'
tags: ['reboot', 'notifications', 'macos']
draft: false
unlisted: false
last_update:
  date: 2026-09-09
---

## Overview

This script serves as the detection logic for the "[Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)" solution on macOS. Its primary function is to intelligently decide whether a reboot prompt should be displayed to the user.

It performs checks in four key areas:

1. **Operational Safety & Opt-In:** Before evaluating necessity, the script checks the client-level opt-in status (`cPVAL Reboot Prompt For MAC`) and the device-level manual override (`cPVAL Pending Reboot`). It also checks if the `OmniPrompt` utility is already running to prevent conflicting actions.
2. **Scheduled Restart Awareness:** If the user has already picked their own restart time through the optional reboot scheduler, that commitment takes priority over everything below. The Mac is left alone until the restart is nearly due, at which point this script triggers the Autofix so the reminder can be shown. See [Scheduled Reboot Handling](#scheduled-reboot-handling).
3. **Necessity:** It determines if a reboot is actually required by comparing system uptime against a configured threshold, or by checking for a manual administrator override. *(Note: macOS does not have a Windows-style Registry pending reboot flag, so this specific trigger is omitted).*
4. **Timing & Convenience:** If a reboot is needed, the script validates if the current moment is appropriate for a prompt. It checks constraints such as "Quiet Hours" (suppress windows), weekend exclusions, user presence (logged in vs. lock screen), and ensures the user isn't prompted too frequently.

If the script determines a reboot is needed, the timing is valid, and no conflicting prompts are active, it returns an exit code that triggers the remediation (Autofix) script.

## Install-In-Progress Protection

Before allowing any unattended reboot (no user logged in, or locked screen with the missed prompt threshold reached), the script checks whether software or updates are currently being installed. If an install is detected, the script exits cleanly without rebooting. It will try again on the next cycle after the install finishes.

This prevents the machine from restarting in the middle of a macOS software update, application installer, or feature upgrade.

The script looks for the following macOS-specific processes:

| Signal | What It Means |
| :--- | :--- |
| `softwareupdate` | macOS Software Update is actively installing an update |
| `install` | A general macOS installer package is running |
| `msud` | macOS Software Update Daemon is active |
| `setupd` | macOS Setup Assistant or installer is running |
| `osinstallersetupd` | macOS OS Installer is actively performing an upgrade |

> **Note:** This check only applies to unattended reboots. If a user is at their desk and clicks "Yes" to reboot, the reboot happens immediately regardless of background installs. The user made a conscious choice to restart.

## Scheduled Reboot Handling

When the optional reboot scheduler is enabled (see `cPVAL Reboot Schedule Max Hours`), the user is allowed to pick their own restart time on the final prompt. This script is what honours that choice.

Before it evaluates whether a reboot is needed at all, it inspects the two tracking fields the Autofix maintains:

| Field State | What This Script Does |
| :--- | :--- |
| `cPVAL Scheduled Reboot Time` holds a future time, further out than the reminder window | Nothing. The device is deliberately not detected while it waits for the restart the user already agreed to. |
| `cPVAL Scheduled Reboot Time` is now within `cPVAL Reboot Reminder Lead Minutes`, or is already overdue | Triggers the Autofix so it can display the pre-reboot reminder and hand the countdown to the operating system. |
| `cPVAL Reboot Reminder Sent Time` is set and the device has restarted since | Clears every tracking field. The cycle is complete. |
| `cPVAL Reboot Reminder Sent Time` is set and the countdown is still running | Nothing. A restart is already pending, so a second reminder must not be fired into it. |
| `cPVAL Reboot Reminder Sent Time` is set but 60 minutes have passed with no restart | Treats the countdown as cancelled, clears the stale values, and resumes the normal prompt cycle. |
| Either field holds a value that cannot be read | Clears it and resumes the normal prompt cycle. |

A device that was switched off or asleep through its scheduled time arrives here overdue, which still triggers the Autofix. The restart therefore happens late rather than never.

> **⚠️ Important:** `cPVAL Reboot Reminder Lead Minutes` must be set to the same value on both this Detection automation and the Autofix automation. This script uses it to decide when a scheduled restart is due for its reminder, and the Autofix uses it to size the countdown. Keep the value well below 60 minutes, or a restart that is still legitimately pending will be treated as cancelled.

## Platform Differences (macOS vs. Windows)

Administrators managing both platforms should be aware of the following behavioral differences in the macOS detection script:

- **No Registry Pending Reboot Check:** macOS does not have a direct equivalent to the Windows CBS/Windows Update Registry keys. Reboot necessity is determined solely by the manual `cPVAL Pending Reboot` checkbox and the `cPVAL Reboot Prompt Uptime Days` threshold.
- **No Session 0 Isolation Workaround:** On Windows, the script must check for a Scheduled Task to avoid conflicting with the Autofix script. On macOS, running as root from NinjaRMM already renders in the console user's session, so the script simply checks for a running `OmniPrompt` process (`pgrep -x OmniPrompt`) to avoid conflicts.
- **Different Install Signals:** The Install-In-Progress guard checks for macOS-specific processes rather than Windows servicing processes or the MSI mutex.
- **Reminder Timing Is Identical:** The scheduled restart and reminder logic behaves exactly as it does on Windows. Both platforms store the same tracking fields and use the same reminder window, so a scheduled restart works the same way on a Mac as it does on a workstation.

## Sample Run

> **Note:** This script is specifically engineered to operate as the detection condition within the [Reboot Pending Prompt - Macintosh](/docs/203e9aa3-5081-487b-b71c-ee8c37a6f769) compound condition. Manual execution is not recommended, as the script's output is intended to trigger automated remediation actions rather than provide direct feedback.

## Dependencies

- [Custom Field: cPVAL Reboot Prompt For MAC](/docs/fafa4c99-8301-46bd-a195-07ff66ea713f)
- [Custom Field: cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01)
- [Custom Field: cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395)
- [Custom Field: cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45)
- [Custom Field: cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33)
- [Custom Field: cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c)
- [Custom Field: cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098)
- [Custom Field: cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83)
- [Custom Field: cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d)
- [Custom Field: cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562)
- [Custom Field: cPVAL Reboot During Suppress Period](/docs/32897c40-8b81-4f6b-97eb-6fdc47a20bc5)
- [Custom Field: cPVAL Max Missed Prompts Before Force](/docs/f93e2bb8-905f-4032-98c5-4d943f0e6580)
- [Custom Field: cPVAL Consecutive Missed Prompts](/docs/e61fd6fa-cf42-4315-831f-d4a150bc53d6)
- [Custom Field: cPVAL First Missed Prompt Time](/docs/d6add994-9648-4f4c-9888-b2c8416b0c9a)
- [Custom Field: cPVAL Reboot Reminder Lead Minutes](/docs/0ee089f7-57f0-4f99-a896-bd366b9ff08c)
- [Custom Field: cPVAL Scheduled Reboot Time](/docs/e5cebd02-17e2-4e64-9ace-c62d8541f52c)
- [Custom Field: cPVAL Reboot Reminder Sent Time](/docs/0181a174-2874-47d1-a18f-009c1aeb7024)
- [Solution: Reboot Pending Prompt](/docs/d7758fa4-9fcc-4259-a7a5-0ca65dda10eb)

## Custom Fields

| Custom Field | Type | Example | Scope | Available Options | Editable | Description |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| [cPVAL Reboot Prompt For MAC](/docs/fafa4c99-8301-46bd-a195-07ff66ea713f) | Dropdown | `Enable` | Organization, Location, Device | `Enable`, `Disable` | Yes | CLIENT-level master switch. Enable = opted in client-wide; Disable = opted out; unset = defers to the per-device `cPVAL Pending Reboot`. |
| [cPVAL Pending Reboot](/docs/31558959-f3a5-4f4f-9388-6e7512972b01) | Checkbox | `True` | Device | `True`, `False` | Yes | Manual override to force a prompt cycle, and also opts this single machine in when the MAC-level switch is unset. |
| [cPVAL Last Prompted](/docs/fe3a8ca4-3722-4eaf-895a-723f8d563395) | Text | `2024-05-20 14:30:00` | Device | N/A | No | Timestamp of the last successful prompt. Managed automatically by the script. |
| [cPVAL Times Prompted](/docs/fded67bb-c3a3-40bb-acb1-2baa0464de45) | Numeric | `2` | Device | N/A | No | Counter for how many times the user has been prompted. Managed automatically by the script. |
| [cPVAL Reboot Prompt Uptime Days](/docs/d38a1b1a-1620-456a-a341-2770520a8f33) | Numeric | `14` | Organization, Location, Device | N/A | Yes | Uptime threshold (days) to trigger a reboot. Set to `0` to disable. |
| [cPVAL Reboot Prompt Count](/docs/40cf882a-83e1-4197-b536-e6840c498d0c) | Numeric | `4` | Organization, Location, Device | N/A | Yes | Max number of prompts allowed before the cycle resets. |
| [cPVAL Reboot Prompt Duration Between Prompt](/docs/2b88d214-a59b-4972-a462-121ecfc2a098) | Numeric | `4` | Organization, Location, Device | N/A | Yes | Minimum hours to wait between prompts. |
| [cPVAL Reboot Prompt Skip Weekends](/docs/01773daf-c7be-4d03-ab86-8b81cc939a83) | Dropdown | `Enable` | Organization, Location, Device | `Enable`, `Disable` | Yes | Enable to suppress prompts on Saturdays and Sundays. |
| [cPVAL Reboot Prompt Suppress Time Window](/docs/12775f61-616e-4157-9f47-4623433bf68d) | Text | `1800-0800` | Organization, Location, Device | N/A | Yes | 24h time range (HHmm-HHmm) to suppress prompts. |
| [cPVAL Reboot if Not Logged In](/docs/c1c1cb99-496a-4b3a-9a9c-e0fdf7ee4562) | Dropdown | `Enable` | Organization, Location, Device | `Enable`, `Disable` | Yes | Enable to reboot immediately if no user is signed in. |
| [cPVAL Reboot During Suppress Period](/docs/32897c40-8b81-4f6b-97eb-6fdc47a20bc5) | Dropdown | `Enable` | Organization, Location, Device | `Enable`, `Disable` | Yes | Enable to allow unattended/forced reboots during suppress windows or weekends. |
| [cPVAL Max Missed Prompts Before Force](/docs/f93e2bb8-905f-4032-98c5-4d943f0e6580) | Numeric | `3` | Organization, Location, Device | N/A | Yes | Number of consecutive missed prompts before forcing a reboot. Set to `0` to disable. |
| [cPVAL Consecutive Missed Prompts](/docs/e61fd6fa-cf42-4315-831f-d4a150bc53d6) | Numeric | `2` | Device | N/A | No | Number of consecutive times the prompt was skipped. Managed automatically. |
| [cPVAL First Missed Prompt Time](/docs/d6add994-9648-4f4c-9888-b2c8416b0c9a) | Text | `2024-05-20 14:30:00` | Device | N/A | No | Timestamp of the first missed prompt in the current streak. Managed automatically. |
| [cPVAL Reboot Reminder Lead Minutes](/docs/0ee089f7-57f0-4f99-a896-bd366b9ff08c) | Numeric | `15` | Organization, Location, Device | N/A | Yes | How many minutes ahead of a scheduled restart the pre-reboot reminder becomes due. Must match the value used by the Autofix. |
| [cPVAL Scheduled Reboot Time](/docs/e5cebd02-17e2-4e64-9ace-c62d8541f52c) | Text | `2026-09-09 14:30:00` | Device | N/A | No | The restart time the user selected on the final prompt. While this holds a future time, the device is not detected. Managed automatically. |
| [cPVAL Reboot Reminder Sent Time](/docs/0181a174-2874-47d1-a18f-009c1aeb7024) | Text | `2026-09-09 14:15:00` | Device | N/A | No | Records when the reminder was sent and the restart countdown began. A value here means a restart is already pending. Managed automatically. |

## Configuration Hierarchy

The solution evaluates settings using a strict top-down hierarchy. If a value is configured at a higher priority level, it overrides the lower levels.

| Priority | Level | Description |
| :--- | :--- | :--- |
| **1 (Highest)** | **Device Level Custom Field** | Overrides all lower levels. Applied to a specific endpoint. |
| **2** | **Location Level Custom Field** | Overrides Organization level. Applied to all endpoints in a location. |
| **3** | **Organization Level Custom Field** | Global default for the entire tenant. |
| **4 (Lowest)** | **Script Runtime Variable** | Ultimate fallback default used if the custom field is blank at all levels. |

## Script Variables

Instead of hardcoding defaults, the script relies on NinjaRMM Script Variables as the ultimate fallback mechanism. You can configure these variables directly in the script's settings within NinjaRMM to establish global baseline behaviors without modifying the script file.

| Name | Type | Example | Default | Available Options | Description |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `Prompt Count` | Integer | `5` | `4` | N/A | Max number of prompts allowed before the cycle resets. |
| `Duration Between Prompts` | Integer | `6` | `4` | N/A | Minimum hours to wait between prompts. |
| `Suppress Time Window` | String/Text | `1800-0800` | *(blank)* | N/A | 24h time range (HHmm-HHmm) to suppress prompts. |
| `Max Missed Prompts Before Force` | Integer | `3` | `0` | N/A | Number of consecutive missed prompts before forcing a reboot. Set to 0 to disable. |
| `Reboot If Not Logged In` | Dropdown | `Enable` | `Disable` | `Disable`, `Enable` | Enable to reboot immediately if no user is signed in. |
| `Skip Weekends` | Dropdown | `Enable` | `Disable` | `Disable`, `Enable` | Enable to suppress prompts on Sat/Sun. |
| `Reboot During Suppress Period` | Dropdown | `Enable` | `Disable` | `Disable`, `Enable` | Fallback default. Allows unattended/forced reboots during suppress windows. |
| `Reboot Reminder Lead Minutes` | Integer | `15` | `15` | N/A | How many minutes ahead of a scheduled restart the reminder becomes due. Only used when the reboot scheduler is enabled. Must match the Autofix value. |

> **💡 Note:** Do not attempt to change default values by editing the script file directly. Modifying the script may break its execution or signature. Always use Custom Fields or Script Variables to adjust behaviors.

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/reboot-pending-prompt-detection-macintosh.sh)

## Output

- **Activity Details:** Text output indicating if a reboot is required and if conditions were met (e.g., "A reboot is required and all conditions to prompt for reboot have been met.").
- **Custom Fields:** Updates `cPVAL Pending Reboot`, `cPVAL Last Prompted`, `cPVAL Times Prompted`, `cPVAL Consecutive Missed Prompts`, and `cPVAL First Missed Prompt Time` as part of reset and missed-prompt tracking. Clears `cPVAL Scheduled Reboot Time` and `cPVAL Reboot Reminder Sent Time` once a scheduled restart completes, or when either value goes stale.
- **Exit Code:** Returns `1` to trigger the Autofix script, or `0` if no action is needed or conditions are blocked.

## Changelog

### 2026-09-09

- Added support for the optional reboot scheduler. A device with a restart the user has already scheduled is no longer detected while it waits, and is instead detected once that restart comes due for its reminder.
- Added the new custom fields `cPVAL Reboot Reminder Lead Minutes`, `cPVAL Scheduled Reboot Time`, and `cPVAL Reboot Reminder Sent Time`.
- Added the new script variable `Reboot Reminder Lead Minutes`.
- A restart countdown that is still pending after 60 minutes is now treated as cancelled, so a device whose shutdown was aborted returns to the normal prompt cycle on its own.
- The tracking fields for the scheduler are cleared everywhere the existing tracking fields are cleared, including the self-healing reset.

### 2026-07-20

- Initial version of the document.
