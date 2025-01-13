---
id: 'cwa-windows-10-feature-update-install'
title: 'Windows 10 Feature Update Installation'
title_meta: 'Windows 10 Feature Update Installation'
keywords: ['windows', 'update', 'installation', 'report', 'alert', 'monitoring']
description: 'This document outlines a solution for updating Windows 10 machines to the latest Feature Update from Microsoft. It includes features such as reporting successes and failures, user prompts for installation, reboot scheduling, and integration with custom tables for tracking update statuses.'
tags: ['windows', 'update', 'installation', 'report', 'alert', 'monitoring']
draft: false
unlisted: false
---
## Purpose

This solution handles the process of updating a Windows 10 machine to the latest Feature Update available from Microsoft. It includes the following features:

- Reporting of successes and failures to a custom table.
- Prompting users with pre and post installation messages.
- Updating the machine to the newest feature update.
- Allowing users to select a reboot time for the update.

## Associated Content

| Content                                                                                                                                              | Type              | Function                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|---------------------------------------------------------------------------------------------------|
| [CWM - Automate - Custom Table - plugin_proval_windows10_upgradestats](https://proval.itglue.com/DOC-5078775-9746809)                             | Custom Table      | For reporting on update statuses.                                                                  |
| [EPM - Agnostic - Prompt-User](https://proval.itglue.com/DOC-5078775-9580402)                                                                    | Agnostic Script    | For producing pop up messages.                                                                     |
| [EPM - Data Collection - Script - User-Show-PromptMessage](https://proval.itglue.com/DOC-5078775-9739032)                                        | CWA Script        | For implementing Prompt-User agnostic script.                                                    |
| [SEC - Windows Patching - Agnostic - Update-Windows10](https://proval.itglue.com/DOC-5078775-9447713)                                            | Agnostic Script    | For updating windows.                                                                              |
| [SEC - Windows Patching - Script - Windows 10 - Feature Update - Install Latest](https://proval.itglue.com/DOC-5078775-9744053)                 | CWA Script        | For implementing the update-windows10 agnostic script, setting up tables, creating groups, adding machines to that group, and implementing the CWA user-show-promptmessage script. |
| [EPM - Data Collection - Script - Remote Event Log Monitor - Create](https://proval.itglue.com/DOC-5078775-9742626)                               | CWA Script        | For setting up a monitor on a group of computers who have received the update-windows10 script.   |
| [EPM - Data Collection - Script - Windows 10 Update Stats - Retrieve](https://proval.itglue.com/DOC-5078775-9747193)                             | CWA Autofix Action Script | For importing data to the custom table and removing machines from created group.                  |
| [CWM - Automate - Script - Prompter](https://proval.itglue.com/DOC-5078775-10243074)                                                             | CWA Script        | Used when using Prompter prompting option.                                                         |
| [Prompter](https://proval.itglue.com/DOC-5078775-10224100)                                                                                       | Agnostic application | Prompter application.                                                                              |
| - Alert Template:<ul><li>Name : △ Autofix - Start Windows 10 Build upgrade</li></ul>                                                            | Alert Template    | Created to call Windows 10 - Feature Update - Install Latest between 1 and 3 am daily            |

## Implementation

For autofix action:

1. Import the Windows 10 - Feature Update - Install Latest script
2. Import the △ Autofix - Start Windows 10 Build upgrade Alert template.
3. Configure autofix as desired.

**NOTE:** Steps 2 and 3 will be removed and replaced with an alert template import in the plugin in the next version.

For a manual run:

1. Import the Windows 10 - Feature Update - Install Latest script 
2. Run the script when ready.

## FAQ

1. I have been running the Windows10 - Feature Update - Install Latest script but the table is not receiving any data.
   - Please go to the "Windows 10 - Upgrade Pending Reports" group and ensure that an alert template to run the Windows 10 Update Stats - Retrieve script on alert is assigned to the monitor.

2. I am not receiving the Pre or Post installation Pop-Up.
   - Please ensure that the Prompt-User agnostic script is populating into the `programdata/_automation/script/Prompt-User` folder.
   - Please ensure that the automate script User-Show-PromptMessage is present in automate.

3. The user was prompted for the reboot, but the computer never rebooted.
   - Please review the update logs to verify that the update was not a failed attempt.
   - Check the script logs and verify that the user did not click ok without selecting a date; the script log will exit with failure if this is the case. A log will be created for this reason.
     - If this situation happens, the update will stall out on the reboot portion, and the next manual reboot will trigger the completion of the update. The computer will still be placed in the appropriate group and still be monitored for the populated event log to trigger reporting.

4. The Windows 10 - Feature Update - Install Latest script is failing at line 13.
   - Please add the Windows 10 - Update Stats - Retrieve script to your automate implementation.



