---
id: 'caaa861f-9e69-4449-810b-4f602426624d'
slug: /caaa861f-9e69-4449-810b-4f602426624d
title: 'OEM Update With Prompt'
title_meta: 'OEM Update With Prompt'
keywords: ['oem', 'update', 'firmware', 'driver', 'bios', 'lenovo', 'dell', 'hp', 'pswindowsupdate', 'prompt', 'reboot']
description: 'Manages prompting end users before OEM BIOS and Firmware upgrades on Windows 10/11 devices.'
tags: ['windows', 'dell', 'lenovo', 'hp', 'notifications', 'drivers', 'bios', 'firmware']
draft: false
unlisted: false
last_update:
  date: 2026-05-26
---

## Overview

Manages prompting end users before OEM BIOS and Firmware upgrades on Windows 10/11 devices. Solves the problem of unattended BIOS/Firmware updates that restart a device without warning, causing data loss and user frustration. The script gives users the ability to postpone the upgrade up to a configurable number of times, then forces the upgrade after all postponements are exhausted.

Designed for RMM platforms (ConnectWise, NinjaRMM, Datto, etc.) that run scripts as SYSTEM. The RMM only needs to deploy and execute the script once; subsequent prompt cycles are handled automatically via self-rescheduling Windows Scheduled Tasks.

Prompt messages and button labels are automatically displayed in Dutch when the logged-in user's Windows display language is set to `nl-NL` or `nl-BE`. All other languages default to English.

## Dependencies

 - [Agnostic Script - Invoke-OEMUpdateWithPrompt](/docs/52c50165-38d5-4793-b751-97260ab31f72)

## Implementation  

1. Download the component `OEM Update With Prompt` from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/import.webp)  

## Sample Run

To execute the `component` over a specific machine, follow these steps:  

1. Select the machine you want to run the `component` on from the Datto RMM.  

2. Click on the `Quick Job` button.  
![Image 2](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/quickjob.webp)  

3. Search the component `<Name of the Component>` and click on `Select`
 ![Image 3](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/search.webp)

4.  ![Image 4](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/run.webp)

- For the Firmware/Bios/Driver update use the command.

  - **`-Category @('Drivers','Tools') -Description '(?i).*BIOS.*|.*Firmware.*|.*UEFI.*' -AllowReboot`**

5.  ![Image 5](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/run2.webp)

> **NOTE:** After the OEM update script completes successfully, a reboot pending check is performed by inspecting Windows registry keys (Component Based Servicing, Windows Update, Session Manager pending file renames, and computer name changes). If a pending reboot is detected, the machine is **forcefully restarted** via `Restart-Computer -Force` to complete the update installation. If no reboot is pending, the script shows a completion acknowledgement prompt only when a user is logged in and the machine is unlocked; otherwise it exits silently. If the vendor script already triggered a reboot, this check will not execute.
>
> If `-HandleBitLocker` is specified, BitLocker protection is suspended before the vendor script runs (using `Suspend-BitLocker -RebootCount 1`). If no reboot occurs after the update, BitLocker is automatically resumed via `Resume-BitLocker` before the completion prompt. If a reboot is triggered, BitLocker auto-resumes after that single reboot without requiring manual intervention.


## Datto Variables

| Variable Name | Default | Type | Description |
| --- | --- | --- | --- |
| `MaxPostpone` | `5` | String | Maximum number of times the upgrade can be postponed before the final prompt is shown. Total prompts = MaxPostpone + 1 (final). |
| `IntervalMinutes` | `240` | String | Minutes between each prompt. After postpone or miss, a SYSTEM scheduled task re-runs the script at this interval. |
| `RegularPromptTimeout` | `600` | String | Seconds before a regular prompt auto-closes and counts as missed. |
| `FinalPromptTimeout` | `900` | String | Seconds before the final prompt times out and the upgrade is forced. |
| `DelayAfterFinalPrompt` | `600` | String | Seconds to wait before forcing the upgrade after the final prompt times out or user picks a time < 15 min away. |
| `SkipWeekends` | `False` | Boolean | Prevents prompts on Saturdays and Sundays. |
| `IfNotLoggedIn` | `False` | Boolean | Runs the upgrade immediately without prompting if no user is logged in. |
| `Force` | `False` | Boolean | Clears all scheduled tasks and stored state, restarting the prompt cycle from 0. |
| `UsePsWindowsUpdate` | `False` | Boolean | Uses the PSWindowsUpdate module instead of OEM-specific scripts (Dell/HP/Lenovo). |
| `HandleBitLocker` | `False` | Boolean | Suspends BitLocker protection on the OS drive for one reboot cycle before OEM updates run. If no reboot is required after the update, BitLocker protection is automatically resumed. |
| `SuppressPopupTimeWindows` |  | String | Time window (24-hour format, e.g., `1800-0900`) during which prompts are suppressed. |
| `Icon` |  | String | URL or local file path for the icon displayed in the prompt dialog (e.g., `https://example.com/icon.png` or `C:\Icons\icon.png`). |
| `HeaderImage` |  | String | URL or local file path for the header image displayed at the top of the prompt dialog (e.g., `https://example.com/header.png` or `C:\Images\header.png`). |
| `OEMScriptParametersOverride` |  | String | Custom parameter string passed to the vendor update script, replacing the default parameter set for the detected manufacturer (e.g., `'/applyUpdates -updateType=bios -silent'` for Dell DCU or `-Category 'Drivers','Tools' -AllowReboot` for PSWindowsUpdate). |

## Output

Activity Log

## Attachments  

[OEM Update With Prompt](../../../static/attachments/OEM%20Update%20With%20Prompt.cpt)
## Changelog
 
### 2026-05-26
 
- Initial version of the document
