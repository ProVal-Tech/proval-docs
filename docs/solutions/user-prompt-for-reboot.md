---
id: '32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a'
slug: /32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a
title: 'User Prompt for Reboot'
title_meta: 'User Prompt for Reboot'
keywords: ['automate', 'reboot', 'prompt', 'user', 'monitor', 'script']
description: 'This document outlines the implementation of a solution that prompts end users to reboot their machines through Automate, ensuring that the machines are rebooted either voluntarily or forcefully. It includes update notices, associated content, implementation steps, configuration details, and customization options.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to provide the client with the ability to have Automate prompt the end user to reboot the machine and ensure that the machine eventually gets rebooted (either forcefully or voluntarily by the end user).

## Update Notice: 16-December-2024

A new Client, Location, and Computer-Level Exclusion EDF `Disable Reboot Prompt` has been introduced. Flagging the EDF will exclude the machines at the respective level.

### Steps to import the updates:
- Update the [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8) script from the Prosync plugin.
- Update the [Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4) internal monitor from the Prosync plugin.
- Run the script [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8) **once** on any machine with the user parameter `SetEnvironment` set to 1.

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_1.webp)

## Update Notice: 06-June-2024

If the `proval_RebootPromptWhenPendingReboot` system property is set to `1` and the computer has a reboot pending flag, but the `Suppress Reboot` policy is applied by the patch manager, and the pending reboot flag was set due to a patch job, the machine will be excluded from the script's functionality. Instead, the prompts and reboot will be managed by Automate's built-in `Suppress Reboot` policy. This may result in inconsistently connected machines not getting a proper reboot.

## Associated Content

| Content | Type | Function |
|---------|------|----------|
| [Monitor - Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4) | Internal Monitor | To monitor for machines the client decides need to be rebooted and issue a script to prompt the user. |
| [Script - User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8) | Script | To physically handle the reboot prompting and execution. |
| [Script - Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c) | Script | To clear all flags indicating the machine needs a reboot so they can be set again later. |
| [Monitor - Reset Reboot Pending EDFs](/docs/79256871-2745-4096-8892-c4554926ed18) | Internal Monitor | This internal monitor is designed to detect the agents whose reboot was done by the script [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8). It detects the agents and triggers the script [Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c) to clear the EDFs so they can be re-triggered at another time. |
| [Monitor - Machines with Login Bug Issue](/docs/9c3ebf70-921b-46e4-bdab-409e06e17a5f) | Internal Monitor | This internal monitor detects the agents with Login Bug Issues that have not been rebooted for more than 7 days since detection. |
| △ Custom - Autofix - Prompt for Reboot with Forced Reboot | Alert Template | This template is used with the monitor [Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4) to schedule the autofix script [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8). |
| △ Custom - Autofix - Reset Reboot Pending EDFs | Alert Template | This template is used with the monitor [Reset Reboot Pending EDFs](/docs/79256871-2745-4096-8892-c4554926ed18) to schedule the autofix script [Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c). |
| △ Custom - Ticket Creation - Computer | Alert Template | This template is used with the monitor [Machines with Login Bug Issue](/docs/9c3ebf70-921b-46e4-bdab-409e06e17a5f). |
| [Dataview - User Prompt - Reboot [Audit]](/docs/4ad38519-386a-4645-8cea-a498e0cd0e25) | Dataview | This dataview is designed to track the workings of the [User Prompt for the Reboot](/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a) solution. |

## Implementation

### Updating Process:
- Remove the monitor 'ProVal - Production - Reboot Pending [Prompt]' (if it exists)
  - Take note of any exclusions made to this monitor; however, there will likely be no customizations to it.
- Remove the monitor [Reset Reboot Pending EDFs](/docs/79256871-2745-4096-8892-c4554926ed18) (if it exists)
- Remove the Alert Template '~Autofix - Prompt for Reboot and Force' (or whatever is assigned to the monitor presently; we will be importing a new alert template with this solution).
  - If you cannot find any alert templates configured, skip over this step.
- Update the script [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8)
- Update the script [Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c)
- Import both alert templates '△ Custom - Autofix - Reset Reboot Pending EDFs' and '△ Custom - Autofix - Prompt for Reboot with Forced Reboot'
- Delete the Reset Reboot Pending EDFs Script Schedule on the All Agents group

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_2.webp)

- Proceed through the Fresh Install Process steps.

### Fresh Install Process:
1. Import both scripts outlined in this document (ProSync Plugin)
2. Import all the monitors outlined in this document (ProSync Plugin)
3. Import all the alert templates outlined in this document (ProSync Plugin)
4. Import the dataview outlined in this document (ProSync Plugin)

### Configuration Steps:
1. Set the correct alert templates to the **Disabled** monitors

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_3.webp)

2. Run the script [User Prompt - Reboot](/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8) **once** on any machine with the user parameter `SetEnvironment` set to 1:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_1.webp)

   Running the script with this parameter will import the properties below with default values and also import the EDFs as mentioned below:
   - proval_RebootForceTimeDelayMin - Default Setting [5]
   - proval_RebootPromptWhenPendingReboot - Default Setting [0]
   - proval_RebootPromptUptimeDays - Default Setting [0]
   - proval_RebootPromptMSG - Default Setting [Your computer is currently in need of a reboot.]
   - proval_RebootPromptDurBetweenPrompt - Default Setting [4]
   - proval_RebootPromptCount - Default Setting [4]
   - Proval_RebootPromptUsePrompter - Default Setting [0]

   The EDFs imported are:
   1. Last Prompted - Text Box
   2. Times Prompted - Text Box
   3. Pending Reboot - Checkbox

3. Before enabling the monitors, validate that the monitor will return results when checking the 'Pending Reboot' EDF. Simply pick a random workstation that is online, check the 'Pending Reboot' EDF, and save it:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_4.webp)

4. Then open the Disabled Monitor 'ProVal - Production - Reboot Pending [Prompt]' and validate that the new machine appears in the results:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_5.webp)

   **NOTE:** If the count is more than 1, then settings are changed from their defaults, and the consultant should weigh in on whether we should enable the monitors or not.

5. After confirming that, you can uncheck the pending reboot box from that machine and fully enable all the monitors.
   - It is recommended to keep the monitor targeting globally to ensure the EDFs, when checked, always prompt the user; however, the client may request for the monitor to be more limited, and in this case, you can enable the monitor specifically for certain groups.

## Prompter Prompt Examples

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_6.webp)

Icon and header images can be set by [https://redirhostname/WCC2/Utilities/HeaderImage](https://redirhostname/WCC2/Utilities/HeaderImage)

At the final prompt, you will receive this popup through Windows FIRST:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_7.webp)

Then this will pop up, explaining the reboot:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_8.webp)

## Automate Prompt Examples

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_9.webp)

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_10.webp)

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_11.webp)

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_12.webp)

At the final prompt, you will receive this popup through Windows FIRST:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_13.webp)

Then this will pop up, explaining the reboot:

![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_14.webp)

## EDF Examples

- Pending Reboot [Checkbox - Manually Editable]
  - ![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_15.webp)
- Last Prompted [Text Field - Non Editable]
  - ![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_16.webp)
- Times Prompted [Text Field - Non Editable]
  - ![Image](../../static/img/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a/image_17.webp)

## Customizations

| Property | Description | Default Setting |
|----------|-------------|-----------------|
| System Property: proval_RebootPromptCount | How many times the user will be prompted | 4 |
| System Property: proval_RebootPromptDurBetweenPrompt | Amount of time in hours between prompts | 4 |
| System Property: proval_RebootPromptMSG | The default message for the reboot prompt | 'Your computer is currently in need of a reboot.' |
| System Property: proval_RebootPromptUptimeDays | Automatically sets the reboot prompt flag after X days of machine uptime | 0 (Disabled) |
| System Property: proval_RebootPromptWhenPendingReboot | Toggles this solution on the Windows embedded reboot flag | 0 (Disabled) |
| System Property: proval_RebootForceTimeDelayMin | Adjusts the time delay on the forced reboot in minutes | 5 |
| System Property: Proval_RebootPromptUsePrompter | Use [Prompter](/docs/d8a124df-ea81-4194-82fc-a082c7a036d8) instead of Automate's default prompts/messages | 0 (Disabled) |

## Exclusion EDFs

| Name | Type | Section | Level | Description |
|------|------|---------|-------|-------------|
| Disable Reboot Prompt | Checkbox | Exclusions | Client | Flag this EDF to exclude the client from the solution. |
| Disable Reboot Prompt | Checkbox | Exclusions | Location | Flag this EDF to exclude the location from the solution. |
| Disable Reboot Prompt | Checkbox | Exclusions | Computer | Flag this EDF to exclude the computer from the solution. |