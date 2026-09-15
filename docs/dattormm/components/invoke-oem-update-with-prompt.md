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
  date: 2026-09-14
---

## Overview

This is a Datto implementation of the agnostic [Invoke-OEMUpdateWithPrompt](/docs/52c50165-38d5-4793-b751-97260ab31f72)

The script prompts logged-in users before BIOS and firmware updates, allows postponement for a configured number of cycles, and then enforces the update. It is designed for a single deployment from Datto RMM, then continues through scheduled task re-runs on the endpoint.

## Dependencies

- [Invoke-OEMUpdateWithPrompt](/docs/52c50165-38d5-4793-b751-97260ab31f72)

## Implementation

1. Download the component [OEM Update With Prompt](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/oem-update-with-prompt.cpt) from the attachments.  
2. After downloading the attached file, click on the `Import` button.  
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)

## Sample Run

![Image 4](../../../static/img/docs/caaa861f-9e69-4449-810b-4f602426624d/sample-run.webp)

## Examples

### Scenario 1: OEMScriptParametersOverride

Custom parameter string passed to the vendor update script, replacing the default parameter set for the detected manufacturer.

- For PSWindowsUpdate, set `OEMScriptParametersOverride` = `-Category 'Drivers' -Description '(?i)(BIOS|Firmware|UEFI)' -AllowReboot`
- For Dell DCU, set `OEMScriptParametersOverride` = `/applyUpdates -updateType=bios -silent`

### Scenario 2: UsePsWindowsUpdate

Run with user parameter `UsePsWindowsUpdate = True`.

Expected output:

- Update execution path uses Install-WindowsUpdates flow.
- This runs Windows update instead of vendor-specific updates

### Scenario 3: IfNotLoggedIn

Run with user parameter `IfNotLoggedIn = True`.

Expected output:

- If no user session is active, update starts without prompting.
- If a user is logged in, normal prompt workflow continues.

### Scenario 4: HandleBitLocker

Run with user parameter `HandleBitLocker = True`.

Expected output:

- BitLocker is suspended before update execution for one reboot cycle.
- If no reboot is needed, BitLocker is resumed at completion.

### Scenario 5: Force

Run with user parameter `Force = True`.

Expected output:

- Existing OEM prompt scheduled tasks are removed.
- Stored prompt state is reset.
- Prompt workflow starts again from the beginning.

### Scenario 6: SkipWeekends

Run with user parameter `SkipWeekends = True`.

Expected output:

- There will be no popup get generated on the users machine during weekend.
- Will is useful as user will not miss any popup during weekends.

## Customize the Prompt Text

Leave the message variables empty and users see the built-in wording in their own language (English or Dutch). Enter your own text and it is used instead, exactly as written.

Titles and messages both have Datto variables, so no change to the component is needed to reword a prompt.

### Default messages

These are the messages users see when the text parameters are left empty. Wording follows the display language of the logged-in user.

Names such as `PromptsLeft` and `ScheduledUpdateTime` are replaced with live values before the prompt appears. `\n` produces a line break.

#### Titles

| Parameter | English | Dutch |
| --- | --- | --- |
| `Title` | BIOS / Firmware Update | BIOS / Firmware Update |
| `ReminderPromptTitle` | BIOS / Firmware Update - Starting Soon | BIOS / Firmware Update - Start binnenkort |
| `CompletionPromptTitle` | BIOS / Firmware Update - Complete | BIOS / Firmware Update - Voltooid |

#### Messages

**Regular prompt** — `RegularPromptMessage`

*English*

```text
A BIOS/Firmware update is available for your computer. Please save your work as the update requires a restart. You will receive PromptsLeft more prompt(s) with an interval of PromptIntervalMinutes minutes. After the last prompt the update will proceed automatically.\n\nPlease save your work and click Update Now to proceed.
```

*Dutch*

```text
Er is een BIOS/Firmware-update beschikbaar voor uw computer. Sla uw werk op, want de update vereist een herstart. U ontvangt nog PromptsLeft herinnering(en) met een interval van PromptIntervalMinutes minuten. Na de laatste herinnering wordt de update automatisch uitgevoerd.\n\nSla uw werk op en klik op Nu bijwerken om door te gaan.
```

**Final prompt** — `FinalPromptMessage`

*English*

```text
A BIOS/Firmware update is required on your computer. This is the final prompt. Please select a time within the next 48 hours for the update to begin. If no action is taken within FinalTimeoutMinutes minutes the update will proceed automatically in DelayAfterFinalMinutes minutes.\n\nChoose a time and click Schedule Update.
```

*Dutch*

```text
Er is een BIOS/Firmware-update vereist op uw computer. Dit is de laatste herinnering. Selecteer een tijdstip binnen de komende 48 uur voor de update. Als er geen actie wordt ondernomen binnen FinalTimeoutMinutes minuten, wordt de update automatisch uitgevoerd na DelayAfterFinalMinutes minuten.\n\nKies een tijdstip en klik op Update plannen.
```

**Reminder prompt** — `ReminderPromptMessage`

*English*

```text
Your BIOS/Firmware update is scheduled to begin at ScheduledUpdateTime.\n\nPlease save all your work now. The update will start in MinutesUntilUpdate minute(s).\n\nClick OK to acknowledge.
```

*Dutch*

```text
Uw BIOS/Firmware-update staat gepland om te beginnen om ScheduledUpdateTime.\n\nSla al uw werk nu op. De update begint over MinutesUntilUpdate minuten.\n\nKlik op OK om te bevestigen.
```

**Completion prompt** — `CompletionPromptMessage`

*English*

```text
The BIOS/Firmware update has completed successfully. A reboot was not required to install today's updates.\n\nYour computer is ready to use.\n\nClick OK to acknowledge.
```

*Dutch*

```text
De BIOS/Firmware-update is succesvol voltooid. Er was geen herstart nodig om de updates van vandaag te installeren.\n\nUw computer is klaar voor gebruik.\n\nKlik op OK om te bevestigen.
```

#### Extra line on laptops

On laptops, notebooks, and tablets the following line is added before the closing sentence of these three prompts. Desktops do not see it.

| Prompt | English | Dutch |
| --- | --- | --- |
| Regular prompt | Please connect your laptop to power before the update begins. Do not run the update on battery. | Sluit uw laptop aan op de netstroom voordat de update begint. Voer de update niet uit op accustroom. |
| Final prompt | Please make sure your laptop is connected to power at the time you select. | Zorg ervoor dat uw laptop op het gekozen tijdstip op de netstroom is aangesloten. |
| Reminder prompt | Please make sure your laptop is connected to power now. | Zorg ervoor dat uw laptop nu op de netstroom is aangesloten. |

### Insert live values

Type any of these names into your message as a plain word. The real value is filled in before the prompt appears.

| Name | Shows |
| --- | --- |
| `PromptsToSend` | Total prompts the user will receive |
| `PromptsSent` | Prompts shown so far, including this one |
| `PromptsLeft` | Prompts still to come after this one |
| `PromptIntervalMinutes` / `PromptIntervalHours` | Time between prompts |
| `RegularTimeoutSeconds` / `RegularTimeoutMinutes` | Regular prompt timeout |
| `FinalTimeoutSeconds` / `FinalTimeoutMinutes` | Final prompt timeout |
| `DelayAfterFinalSeconds` / `DelayAfterFinalMinutes` | Grace period after the final prompt |
| `ScheduledUpdateTime` | Time the user picked (reminder prompt only) |
| `MinutesUntilUpdate` | Minutes until the update starts (reminder prompt only) |
| `ComputerName` | Machine name |
| `UserName` | Logged-in username |

Use `\n` for a line break.

**Example:**

```text
A firmware update is pending on ComputerName. You have PromptsLeft reminder(s) left, one every PromptIntervalHours hour(s).\n\nSave your work and click Update Now.
```

### Things to know

* These names are reserved words. If a message needs the literal word `ComputerName`, reword it.
* Button labels always follow the user's language and cannot be changed.
* Custom text is not translated and does not receive the automatic connect-to-power line shown on laptops. Include that wording yourself if your fleet has laptops.

### Sample Prompts - English

**Desktops:**

![Image1](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image1.webp)  
![Image2](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image2.webp)  
![Image3](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image3.webp)  

**Laptops:**

![Image9](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image9.webp)  
![Image10](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image10.webp)  
![Image11](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image11.webp)  
![Image12](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image12.webp)

### Completion Acknowledgement Prompt (No Reboot Pending) - English

![Image7](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image7.webp)  

### Sample Prompts - Dutch

![Image4](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image4.webp)  
![Image5](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image5.webp)  
![Image6](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image6.webp)  

#### Completion Acknowledgement Prompt (No Reboot Pending) - Dutch

![Image8](../../../static/img/docs/52c50165-38d5-4793-b751-97260ab31f72/image8.webp)  

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
| `MaxMissedPromptsBeforeForce` | `0` | String | Consecutive missed prompts (locked screen, or nobody logged in) before the update is forced without prompting. `0` disables forcing. |
| `UpdateDuringSuppress` | `False` | Boolean | Allows a forced or unattended update to run inside a suppress window or on a weekend. Prompts are still never shown during those times. |
| `Theme` | `Dark` | Selection | Prompt window theme. `Dark` or `Light`. |
| `Title` |  | String | Title for the regular and final prompts. Blank uses the built-in title. |
| `RegularPromptMessage` |  | String | Body of the postponable prompts. Blank uses the built-in wording. |
| `FinalPromptMessage` |  | String | Body of the final scheduling prompt. Blank uses the built-in wording. |
| `ReminderPromptTitle` |  | String | Title of the 10-minute warning. Blank uses the built-in title. |
| `ReminderPromptMessage` |  | String | Body of the 10-minute warning. Blank uses the built-in wording. |
| `CompletionPromptTitle` |  | String | Title of the completion confirmation. Blank uses the built-in title. |
| `CompletionPromptMessage` |  | String | Body of the completion confirmation. Blank uses the built-in wording. |

## Output

Activity Log

## Attachments  

- [OEM Update With Prompt](https://github.com/ProVal-Tech/datto-rmm/blob/main/components/oem-update-with-prompt.cpt)

## Changelog

### 2026-09-14

- Every prompt title and message is now a Datto variable, so wording can be changed per job without editing the component.
- Added a `Theme` variable to switch the prompt window between dark and light.
- Added `MaxMissedPromptsBeforeForce` and `UpdateDuringSuppress` variables, which the component did not previously expose.
- Picks up the agnostic script fixes for missed prompts and prompt counting. See the [agnostic script changelog](/docs/52c50165-38d5-4793-b751-97260ab31f72#changelog).

### 2026-08-17

- Documentation

### 2026-06-01

- Initial version of the document
