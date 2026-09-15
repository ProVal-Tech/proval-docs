---
id: '6c133406-ba21-476d-baab-32acb772acaa'
slug: /6c133406-ba21-476d-baab-32acb772acaa
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

This is a Ninja implementation of the agnostic [Invoke-OEMUpdateWithPrompt](/docs/52c50165-38d5-4793-b751-97260ab31f72)

The script prompts logged-in users before BIOS and firmware updates, allows postponement for a configured number of cycles, and then enforces the update. It is designed for a single deployment from Ninja RMM, then continues through scheduled task re-runs on the endpoint.

## Sample Run

![SampleRun1](../../../static/img/docs/6c133406-ba21-476d-baab-32acb772acaa/sample-run.webp)

## Dependencies

- [Invoke-OEMUpdateWithPrompt](/docs/52c50165-38d5-4793-b751-97260ab31f72)

## Examples

### Scenario 1: OEMScriptParametersOverride

Custom parameter string passed to the vendor update script, replacing the default parameter set for the detected manufacturer.

- For PSWindowsUpdate, set `OEMScriptParametersOverride` = `-Category 'Drivers' -Description '(?i)(BIOS|Firmware|UEFI)' -AllowReboot`
- For Dell DCU, set `OEMScriptParametersOverride` = `'/applyUpdates -updateType=bios -silent'`

### Scenario 2: UsePsWindowsUpdate

Run with user parameter `UsePsWindowsUpdate = True`. Please ensure that the corresponding checkbox is selected before executing the script.

Expected output:

- Update execution path uses Install-WindowsUpdates flow.
- This runs Windows update instead of vendor-specific updates

### Scenario 3: IfNotLoggedIn

Run with user parameter `IfNotLoggedIn = True`. Please ensure that the corresponding checkbox is selected before executing the script.

Expected output:

- If no user session is active, update starts without prompting.
- If a user is logged in, normal prompt workflow continues.

### Scenario 4: HandleBitLocker

Run with user parameter `HandleBitLocker = True`. Please ensure that the corresponding checkbox is selected before executing the script.

Expected output:

- BitLocker is suspended before update execution for one reboot cycle.
- If no reboot is needed, BitLocker is resumed at completion.

### Scenario 5: Force

Run with user parameter `Force = True`. Please ensure that the corresponding checkbox is selected before executing the script.

Expected output:

- Existing OEM prompt scheduled tasks are removed.
- Stored prompt state is reset.
- Prompt workflow starts again from the beginning.

### Scenario 6: SkipWeekends

Run with user parameter `SkipWeekends = True`. Please ensure that the corresponding checkbox is selected before executing the script.

Expected output:

- There will be no popup get generated on the users machine during weekend.
- Will is useful as user will not miss any popup during weekends.

## Customize the Prompt Text

Leave the message variables empty and users see the built-in wording in their own language (English or Dutch). Enter your own text and it is used instead, exactly as written.

| Variable | Replaces |
| --- | --- |
| `RegularPromptMessage` | Body of the postponable prompts |
| `FinalPromptMessage` | Body of the final scheduling prompt |
| `ReminderPromptMessage` | Body of the 10-minute warning |
| `Theme` | Prompt window appearance (`Dark` or `Light`) |

### Default messages

These are the messages users see when the message variables are left empty. Dutch equivalents are used automatically when the logged-in user runs Windows in Dutch.

Names such as `PromptsLeft` and `ScheduledUpdateTime` are replaced with live values before the prompt appears. `\n` produces a line break.

#### Titles

| Parameter | Default |
| --- | --- |
| `Title` | BIOS / Firmware Update |
| `ReminderPromptTitle` | BIOS / Firmware Update - Starting Soon |
| `CompletionPromptTitle` | BIOS / Firmware Update - Complete |

#### Messages

**Regular prompt** — `RegularPromptMessage`

```text
A BIOS/Firmware update is available for your computer. Please save your work as the update requires a restart. You will receive PromptsLeft more prompt(s) with an interval of PromptIntervalMinutes minutes. After the last prompt the update will proceed automatically.\n\nPlease save your work and click Update Now to proceed.
```

**Final prompt** — `FinalPromptMessage`

```text
A BIOS/Firmware update is required on your computer. This is the final prompt. Please select a time within the next 48 hours for the update to begin. If no action is taken within FinalTimeoutMinutes minutes the update will proceed automatically in DelayAfterFinalMinutes minutes.\n\nChoose a time and click Schedule Update.
```

**Reminder prompt** — `ReminderPromptMessage`

```text
Your BIOS/Firmware update is scheduled to begin at ScheduledUpdateTime.\n\nPlease save all your work now. The update will start in MinutesUntilUpdate minute(s).\n\nClick OK to acknowledge.
```

**Completion prompt** — `CompletionPromptMessage`

```text
The BIOS/Firmware update has completed successfully. A reboot was not required to install today's updates.\n\nYour computer is ready to use.\n\nClick OK to acknowledge.
```

#### Extra line on laptops

On laptops, notebooks, and tablets the following line is added before the closing sentence of these three prompts. Desktops do not see it.

| Prompt | Added line |
| --- | --- |
| Regular prompt | Please connect your laptop to power before the update begins. Do not run the update on battery. |
| Final prompt | Please make sure your laptop is connected to power at the time you select. |
| Reminder prompt | Please make sure your laptop is connected to power now. |

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

### Prompt titles

Titles are not Ninja variables, because a script is capped at 20 variables and titles change far less often than message bodies. To change a title, edit the `prompt titles` section near the top of the script and re-sign it. Leave them blank and the built-in titles are used.

### Things to know

* These names are reserved words. If a message needs the literal word `ComputerName`, reword it.
* Button labels always follow the user's language and cannot be changed.
* Custom text is not translated and does not receive the automatic connect-to-power line shown on laptops. Include that wording yourself if your fleet has laptops.

## Sample Prompts

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

## Parameters

| Name | Calculated Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | --------------- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| MaxPostpone | maxpostpone | -- | 0-5 | True | 5 | string/text | Maximum number of times the upgrade can be postponed before the final prompt is shown. Total prompts = MaxPostpone + 1 (final). |
| IntervalMinutes | intervalminutes | -- | 0-240 | True | 240 | string/text | Minutes between each prompt. After postpone or miss, a SYSTEM scheduled task re-runs the script at this interval. |
| RegularPromptTimeout | RegularPromptTimeout | -- | 0-600 | True | 600 | string/text | Seconds before a regular prompt auto-closes and counts as missed. |
| FinalPromptTimeout | finalprompttimeout | -- | 0-900 | True | 900 | string/text | Seconds before the final prompt times out and the upgrade is forced. |
| SkipWeekends | skipweekends | -- | `True/False` | False | False | Checkbox | Prevents prompts on Saturdays and Sundays. |
| IfNotLoggedIn | ifnotloggedin | -- | `True/False` | False | False | Checkbox | Runs the upgrade immediately without prompting if no user is logged in. |
| Force | force | -- | `True/False` | False | False | Checkbox | Clears all scheduled tasks and stored state, restarting the prompt cycle from 0. |
| UsePsWindowsUpdate | usepswindowsupdate | -- | `True/False` | False | False | Checkbox | Uses the PSWindowsUpdate module instead of OEM-specific scripts (Dell/HP/Lenovo). |
| HandleBitLocker | handlebitlocker | -- | `True/False` | False | False | Checkbox | Suspends BitLocker protection on the OS drive for one reboot cycle before OEM updates run. If no reboot is required after the update, BitLocker protection is automatically resumed. |
| SuppressPopupTimeWindows | suppresspopuptimewindows | `1800-0900` | --- | False | -- | string/text | MTime window (24-hour format, e.g., 1800-0900) during which prompts are suppressed. |
| Icon | icon | `https://example.com/icon.png` | -- | --- | --- | string/text | URL or local file path for the icon displayed in the prompt dialog (e.g., https://example.com/icon.png or C:\Icons\icon.png). |
| HeaderImage | headerimage | `https://example.com/header.png or C:\Images\header.png` | -- | -- | -- | string/text | URL or local file path for the header image displayed at the top of the prompt dialog (e.g., https://example.com/header.png or C:\Images\header.png). |
| OEMScriptParametersOverride | oemscriptparametersoverride | <ul><li>for Dell DCU `'/applyUpdates -updateType=bios -silent'`</li><li> for PSWindowsUpdate `-Category 'Drivers','Tools' -AllowReboot`</li></ul> | -- | -- | -- | string/text | Custom parameter string passed to the vendor update script, replacing the default parameter set for the detected manufacturer |
| RegularPromptMessage | regularpromptmessage | `A firmware update is pending on ComputerName. You have PromptsLeft reminder(s) left.` | -- | False | -- | string/text | Body of the postponable prompts. Leave blank to use the built-in wording. |
| FinalPromptMessage | finalpromptmessage | `This is the last reminder. Pick a time in the next 48 hours.` | -- | False | -- | string/text | Body of the final scheduling prompt. Leave blank to use the built-in wording. |
| ReminderPromptMessage | reminderpromptmessage | `Your update begins at ScheduledUpdateTime. Save your work now.` | -- | False | -- | string/text | Body of the 10-minute warning. Leave blank to use the built-in wording. |
| Theme | theme | -- | `Dark/Light` | False | Dark | Dropdown | Prompt window theme. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/oem-update-with-prompt.ps1)

## Output

- Activity Details  

## Changelog

### 2026-09-14

- Added `RegularPromptMessage`, `FinalPromptMessage`, and `ReminderPromptMessage` variables so prompt wording can be set per organization or per run.
- Added a `Theme` variable to switch the prompt window between dark and light.
- Prompt titles can now be set in the `prompt titles` section of the script.
- Picks up the agnostic script fixes for missed prompts and prompt counting. See the [agnostic script changelog](/docs/52c50165-38d5-4793-b751-97260ab31f72#changelog).

### 2026-09-09

- Updated Script to use our new template for signature verification

### 2026-07-14

- **Bug Fix:** Added missing `iconLocalPath` and `headerImageLocalPath` variable definitions required for loading prompt images correctly.

### 2026-06-19

- Initial version of the document.
