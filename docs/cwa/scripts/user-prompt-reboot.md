---
id: '1789b867-61db-436d-ac0b-07d5aac3f4b8'
slug: /1789b867-61db-436d-ac0b-07d5aac3f4b8
title: 'User Prompt - Reboot'
title_meta: 'User Prompt - Reboot'
keywords: ['reboot', 'prompt', 'edf', 'monitor', 'windows', 'configuration']
description: 'This document outlines the Reboot Prompt Script for Windows Configuration, detailing its functionality, dependencies, system properties, and process flow. The script prompts users to reboot their machines when a reboot is pending while also managing user interactions and logging the number of prompts. It is designed to run only when triggered by a specific monitor, ensuring automated management of reboot requests in a controlled manner.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This script is triggered from the monitor [Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4). The script prompts the user to reboot with a simple yes or no prompt. There are three EDFs that get imported with the script:

- **Pending Reboot** [Checkbox - Manually Editable]  
  ![](../../../static/img/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8/image_1.webp)

- **Last Prompted** [Text Field - Non Editable]  
  ![](../../../static/img/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8/image_2.webp)

- **Times Prompted** [Text Field - Non Editable]  
  ![](../../../static/img/docs/1789b867-61db-436d-ac0b-07d5aac3f4b8/image_3.webp)

If the user chooses to suppress the prompt by hitting no, it will update the Last Prompted and Times Prompted EDFs with new information. The Last Prompted EDF outlines the date and time when the script recorded that the user was prompted and the script was run. The Times Prompted EDF is increased by one every time the script runs.

**Note:** If the `proval_RebootPromptWhenPendingReboot` system property is set to `1` and the computer has a reboot pending flag, but the `Suppress Reboot` policy is applied by the patch manager and the pending reboot flag was set due to a patch job, the machine will be excluded from the script's functionality. Instead, the prompts and reboot will be managed by Automate's built-in `Suppress Reboot` policy. This may result in inconsistently connected machines not getting a proper reboot.

## Script is Monitor Driven Only

This script is designed to run only when triggered by [Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4). Manual running of this script will output a log entry into the Scripts tab stating, "This script is designed to run only when triggered by a monitor and should not be run manually. Exiting."

## Dependencies

The following items depend on this script to function correctly:

- [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](/docs/8163996f-f8b6-4b7d-b5b1-6b965a9408d4)
- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](/docs/e188d9ff-44e7-40e5-a255-d7d2bf0e2f7c)
- [CWM - Automate - Script - Prompter](/docs/d8a124df-ea81-4194-82fc-a082c7a036d8)

### System Properties

| Name                                    | Example | Required | Description                                                                                                                                           |
|-----------------------------------------|---------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| proval_RebootPromptCount                | 4       | True     | How many times the user will be prompted before being forced to reboot. (If it is 4, the user will be forced to reboot on the 5th prompt)          |
| proval_RebootPromptDurBetweenPrompt     | 4       | True     | How long the monitor should wait in between prompts (Hours)                                                                                          |
| proval_RebootPromptMSG                  | Your computer is currently in need of a reboot. | True     | The message that will be seen by the user when prompting. Keep the message short; 'Would you like to restart now...' will be added to the message you set. |
| proval_RebootPromptUptimeDays           | 0       | True     | This indicates how many days a machine's uptime needs to be before this monitor automatically triggers to prompt for a reboot. (Setting to 0 disables this feature) |
| proval_RebootPromptWhenPendingReboot    | 0       | True     | This indicates if you would like the monitor set to automatically prompt users when Windows flags the machine to reboot. (Setting to 0 disables this feature) |
| proval_RebootForceTimeDelayMin          | 5       | True     | This indicates how many minutes you would like to delay the forced reboot from when the user gets the prompt.                                       |
| Proval_RebootPromptUsePrompter          | 1       | True     | Set it to 0 to use Automate-generated prompts and popup messages. The script will use prompter by default.                                          |

## Script States

| Name                       | Example | Description                                                                                       |
|----------------------------|---------|---------------------------------------------------------------------------------------------------|
| Reboot Prompt Login Bug    | 1       | Displays the number of times the script attempted to fix the login bug error and has been rescheduled |

## Process

1. Check how many times the user has been prompted
   1. If it is over the 'proval_RebootPromptCount' System Property --> Reboot now with a short warning
2. Prompt user - Yes to reboot or No
   1. If No, update EDFs with new information

## Output

The EDFs outlined above get updated as the script gets triggered. The monitor looks at the EDFs to confirm it is following the 'proval_RebootPromptDurBetweenPrompt' System Property.