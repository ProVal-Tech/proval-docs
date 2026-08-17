---
id: '52c50165-38d5-4793-b751-97260ab31f72'
slug: /52c50165-38d5-4793-b751-97260ab31f72
title: 'Invoke-OEMUpdateWithPrompt'
title_meta: 'Invoke-OEMUpdateWithPrompt'
keywords: ['oem', 'update', 'firmware', 'driver', 'bios', 'lenovo', 'dell', 'hp', 'pswindowsupdate', 'prompt', 'reboot']
description: 'Safely deploy OEM BIOS and firmware updates by prompting end users to schedule or postpone restarts.'
tags: ['windows', 'dell', 'lenovo', 'hp', 'notifications', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-08-17
---

## Overview

Safely deploy OEM BIOS and firmware updates without interrupting user workflows. This script prompts end users to schedule or postpone updates, preventing unexpected restarts and data loss.

Designed for RMM platforms, it requires only a single deployment. The script automatically handles the prompt cycle, language localization (English/Dutch), and forced reboots via self-managing Windows Scheduled Tasks.

## Requirements

| Requirement | Details |
| --- | --- |
| **Operating System** | Windows 10 or Windows 11 |
| **PowerShell** | Version 5.0 or later |
| **Execution Context** | Administrator / SYSTEM (via RMM) |
| **Internet Access** | Required to download the prompt interface and vendor update tools |

*Note: All dependencies, including the prompt engine and logging modules, are automatically bootstrapped on the first run.*

## Dependencies

- [OmniPrompt](/docs/8ead1ffd-dade-4e17-9958-3313da9a7aa8)
- [SilentLauncher](/docs/b0b9f423-eee3-4148-b8a0-e99400c45698)
- [Initialize-DellCommandUpdate](/docs/aa963f3d-f149-4bfa-8fdc-30f12c21ce7f)
- [Initialize-HPImageAssistant](/docs/92b749f0-2e30-4d4d-8916-fb5f30d85bff)
- [Install-LenovoUpdates](/docs/3640e534-d089-4304-89ba-68d3bc113978)
- [Install-WindowsUpdates](/docs/3ccc8542-1961-4d3f-a54b-4a1bb9a78edd)

## Before You Deploy

Understand how the script behaves in production before adding it to your RMM policies:

* **Single Deployment:** Run this script once per device via your RMM. It creates background scheduled tasks to handle all subsequent prompts, postponements, and the final update.
* **Forced Reboots:** Firmware and BIOS updates require restarts. Once the user's scheduled time arrives (or postponements run out), the device will install the updates and **forcefully reboot**.
* **BitLocker Protection:** Always use `-HandleBitLocker` on encrypted devices. This prevents the dreaded BitLocker recovery screen after a firmware update.
* **User Presence:** By default, prompts only show when a user is actively logged in and unlocked. Use `-IfNotLoggedIn` to push updates to unattended machines, or `-MaxMissedPromptsBeforeForce` to force updates on devices that stay locked for too long.
* **Business Hours:** Protect user productivity by pairing `-SkipWeekends` with `-SuppressPopupTimeWindows '1800-0900'` to hide prompts during nights and weekends.
* **Restarting the Cycle:** If a policy reapplies or you need to reset a stuck device, use the `-Force` parameter to wipe existing tasks and start the prompt cycle from zero.
* **Offline Devices:** The script requires internet access to fetch update tools. If a device is offline, it quietly reschedules itself until a connection is restored.

## Deployment Examples

**Standard deployment (5 postponements, 4-hour intervals):**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1
```

**Respect business hours and weekends:**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1 -MaxPostpone 3 -IntervalMinutes 120 -SkipWeekends -SuppressPopupTimeWindows '1800-0900'
```

**Force updates on unattended/locked devices:**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1 -IfNotLoggedIn -MaxMissedPromptsBeforeForce 3 -UpdateDuringSuppress
```

**Suspend BitLocker on encrypted devices:**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1 -HandleBitLocker
```

**Use generic Windows updates instead of OEM tools:**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1 -UsePsWindowsUpdate
```

**Reset a stuck prompt cycle:**

```powershell
.\Invoke-OEMUpdateWithPrompt.ps1 -Force
```

## Prompt Cycle Walkthrough

### Standard Cycle (English)

1. **Prompts 1 to 5:** The user sees a warning and clicks **Postpone**. The script checks back in 4 hours.
2. **Final Prompt:** Postponements are exhausted. The user must pick a time within the next 48 hours using the date/time picker. If ignored, the update forces automatically after the timeout.
3. **Reminder:** 10 minutes before the chosen time, a final "Starting Soon" warning appears.
4. **Execution:** The update installs and the device forcefully reboots.

### Automatic Localization

If the logged-in user's Windows display language is set to Dutch (`nl-NL` or `nl-BE`), all prompts and buttons automatically translate (e.g., *Uitstellen*, *Nu bijwerken*, *Update plannen*). No extra parameters are required.

### Suppression & Unattended

If `-SkipWeekends` and `-SuppressPopupTimeWindows '1800-0900'` are used:

- Prompts are hidden on weekends and between 6 PM and 9 AM.
- If `-IfNotLoggedIn` is added, the script will silently install updates and reboot the machine if no user is logged in during allowed hours.

## Parameters

| Parameter | Alias | Default | Description |
| --- | --- | --- | --- |
| `MaxPostpone` | `MaxDefer` | `5` | Maximum postponements before the final scheduling prompt appears. |
| `IntervalMinutes` | `Interval` | `240` | Minutes between prompt attempts. |
| `RegularPromptTimeout` | `Timeout` | `600` | Seconds before an ignored prompt auto-closes and counts as missed. |
| `FinalPromptTimeout` | `FinalTimeout` | `900` | Seconds before the final scheduling prompt times out and forces the update. |
| `DelayAfterFinalPrompt` | `Delay` | `600` | Grace period (in seconds) before forcing the update after a timeout. |
| `SuppressPopupTimeWindows`| `Suppress` | | 24-hour time window to hide prompts (e.g., `1800-0900`). |
| `SkipWeekends` | `NoWeekends` | `False` | Hides prompts on Saturdays and Sundays. |
| `IfNotLoggedIn` | `Unattended` | `False` | Bypasses prompts and runs the update immediately if no user is logged in. |
| `MaxMissedPromptsBeforeForce`| `MaxMissed` | `0` | Forces the update after this many consecutive missed prompts on locked devices. |
| `UpdateDuringSuppress` | `ForceDuringSuppress`| `False` | Allows forced/unattended updates to bypass suppression windows and weekends. |
| `Force` | `Recreate` | `False` | Clears active tasks and restarts the prompt cycle from zero. |
| `UsePsWindowsUpdate` | `WindowsUpdate` | `False` | Uses generic Windows updates instead of OEM-specific vendor tools. |
| `Icon` | `IconUrl` | | URL or local path for the prompt window icon. |
| `HeaderImage` | `HeaderUrl` | | URL or local path for the prompt window header banner. |
| `HandleBitLocker` | `BitLocker` | `False` | Suspends BitLocker for one reboot to prevent recovery key prompts. |
| `OEMScriptParametersOverride`| `Override` | | Passes custom arguments directly to the underlying vendor update script. |

## Logs and Artifacts

### Log Locations

Logs are automatically generated in the script's working directory.

- **Initial RMM Run:** `C:\Windows\Temp\Invoke-OEMUpdateWithPrompt-log.txt` (or your RMM's temp folder).
- **Scheduled Runs:** `C:\ProgramData\_Automation\Script\Invoke-OEMUpdatePrompt\Invoke-OEMUpdateWithPrompt-log.txt`
- **Vendor Update Logs:** Stored in `C:\ProgramData\_Automation\Script\<VendorName>\` (e.g., `Initialize-DellCommandUpdate-log.txt`).

### Scheduled Tasks Created

- `Scheduled_Task_Invoke-OEMUpdatePrompt` (Displays the prompt to the active user)
- `Scheduled_Task_Invoke-OEMUpdatePrompt_Reschedule` (Manages the background cycle)
- `Scheduled_Task_Invoke-OEMUpdatePrompt_Reminder` (Displays the 10-minute warning)

### Sample Prompts - English

![Image1](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image1.webp)  
![Image2](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image2.webp)  
![Image3](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image3.webp)  

### Completion Acknowledgement Prompt (No Reboot Pending) - English

![Image7](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image7.webp)  

### Sample Prompts - Dutch

![Image4](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image4.webp)  
![Image5](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image5.webp)  
![Image6](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image6.webp)  

#### Completion Acknowledgement Prompt (No Reboot Pending) - Dutch

![Image8](../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image8.webp)  

## Changelog

### 2026-08-17

- Replaced Prompter with OmniPrompt, a lightweight native binary that removes the .NET Desktop Runtime dependency.
- Switched silent task execution to SilentLauncher, avoiding deprecated scripting hosts and common security blocks.
- Improved language detection so prompts correctly display in Dutch or English based on the logged-in user.
- Added `MaxMissedPromptsBeforeForce` to force the upgrade after repeated missed prompts on locked or inactive machines.
- Added `UpdateDuringSuppress` to allow unattended or forced upgrades outside normal prompting hours.
- Added a pre-upgrade reminder prompt shortly before a scheduled upgrade begins.
- Added an install-in-progress check to prevent upgrades from conflicting with other active installations.

### 2026-05-13

- Initial version of the document
