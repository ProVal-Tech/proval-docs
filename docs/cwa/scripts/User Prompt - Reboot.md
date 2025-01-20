---
id: '1789b867-61db-436d-ac0b-07d5aac3f4b8'
title: 'Reboot Prompt Script for Windows Configuration'
title_meta: 'Reboot Prompt Script for Windows Configuration'
keywords: ['reboot', 'prompt', 'edf', 'monitor', 'windows', 'configuration']
description: 'This document outlines the Reboot Prompt Script for Windows Configuration, detailing its functionality, dependencies, system properties, and process flow. The script prompts users to reboot their machines when a reboot is pending, while also managing user interactions and logging the number of prompts. It is designed to run only when triggered by a specific monitor, ensuring automated management of reboot requests in a controlled manner.'
tags: ['windows']
draft: false
unlisted: false
---
## Summary

This script is triggered from the monitor [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>). The script prompts the user to reboot with a simple yes or no prompt. There are 3 EDF's that get imported with the script:

- **Pending Reboot** [Checkbox - Manually Editable]
  ![](../../../static/img/User-Prompt---Reboot/image_1.png)
  
- **Last Prompted** [Text Field - Non Editable]
  ![](../../../static/img/User-Prompt---Reboot/image_2.png)

- **Times Prompted** [Text Field - Non Editable]
  ![](../../../static/img/User-Prompt---Reboot/image_3.png)

If the user chooses to suppress the prompt by hitting no, it will update the Last Prompted and Times Prompted EDF with new information. The Last Prompted EDF outlines the date and time when the script recorded the user was prompted and the script was run. The Times Prompted EDF gets increased by 1 every time the script runs.

**Note:** If the `proval_RebootPromptWhenPendingReboot` system property is set to `1` and the computer has a reboot pending flag, but the `Suppress Reboot` policy is applied by the patch manager and the pending reboot flag was set due to a patch job, the machine will be excluded from the script's functionality. Instead, the prompts and reboot will be managed by Automate's built-in `Suppress Reboot` policy. This may result in inconsistently connected machines not getting a proper reboot.

## Script is Monitor Driven Only

This script is designed to only run when triggered by [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>). Manual running of this script will output a log entry into the Scripts tab stating "This script is designed to run only when triggered by a monitor and should not be run manually. Exiting."

## Dependencies

The following items depend on this script to function correctly:

- [EPM - Windows Configuration - Monitor - Reboot Pending [Prompt]](<../monitors/Reboot Pending Prompt.md>)
- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421)
- [CWM - Automate - Script - Prompter](<./Prompter.md>)

### System Properties

| Name                                    | Example | Required | Description                                                                                                                                           |
|-----------------------------------------|---------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| proval_RebootPromptCount                | 4       | True     | How many times the user will be prompted before being forced to reboot. (If it is 4, the user will be forced to reboot on the 5th prompt)          |
| proval_RebootPromptDurBetweenPrompt     | 4       | True     | How long should the monitor wait in between prompts (Hours)                                                                                          |
| proval_RebootPromptMSG                  | Your computer is currently in need of a reboot. | True     | The message that will be seen by the user when prompting. Keep message short, 'Would you like to restart now...' will be added to the message you set. |
| proval_RebootPromptUptimeDays           | 0       | True     | This indicates how many days a machine's uptime needs to be before this monitor automatically triggers to prompt for a reboot. (Setting to 0 disables this feature) |
| proval_RebootPromptWhenPendingReboot    | 0       | True     | This indicates if you would like the monitor set to automatically prompt users when windows flags the machine to reboot. (Setting to 0 disables this feature) |
| proval_RebootForceTimeDelayMin          | 5       | True     | This indicates how many minutes you would like to delay the forced reboot from when the user gets the prompt.                                       |
| Proval_RebootPromptUsePrompter          | 1       | True     | Set it to 0 to use Automate generated Prompts and popup messages. The script will use prompter by default.                                          |

## Script States

| Name                       | Example | Description                                                                                       |
|----------------------------|---------|---------------------------------------------------------------------------------------------------|
| Reboot Prompt Login Bug    | 1       | Displays the Number of times Script attempted to fix the login bug Error and has been rescheduled |

## Process

1. Check how many times the user has been prompted
   1. If it is over the 'proval_RebootPromptCount' System Property --> Reboot now with short warning
2. Prompt user - Yes to reboot or no
   1. If no, update EDFs with new information

## Output

The EDF's outlined above get updated as the script gets triggered. The monitor looks at the EDFs to confirm it is following the 'proval_RebootPromptDurBetweenPrompt' System Property.












