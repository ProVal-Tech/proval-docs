---
id: '16c09937-d57e-4d56-8367-fb5551d1c386'
slug: /16c09937-d57e-4d56-8367-fb5551d1c386
title: 'Windows 10 Update'
title_meta: 'Windows 10 Update'
keywords: ['windows', 'update', 'installation', 'report', 'alert', 'monitoring']
description: 'This document outlines a solution for updating Windows 10 machines to the latest Feature Update from Microsoft. It includes features such as reporting successes and failures, user prompts for installation, reboot scheduling, and integration with custom tables for tracking update statuses.'
tags: ['installation', 'report', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution handles the process of updating a Windows 10 machine to the latest Feature Update available from Microsoft. It includes the following features:

- Reporting of successes and failures to a custom table.
- Prompting users with pre- and post-installation messages.
- Updating the machine to the newest feature update.
- Allowing users to select a reboot time for the update.

## Associated Content

| Content                                                                                                                                              | Type              | Function                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------|---------------------------------------------------------------------------------------------------|
| [CWM - Automate - Custom Table - plugin_proval_windows10_upgradestats](/docs/75c18bf0-9ebc-43c7-a5a3-03510d131af5)                             | Custom Table      | For reporting on update statuses.                                                                  |
| [EPM - Agnostic - Prompt-User](/docs/9fc4a21d-6ba4-4f20-90fd-b9c148259195)                                                                    | Agnostic Script    | For producing pop-up messages.                                                                     |
| [EPM - Data Collection - Script - User-Show-PromptMessage](/docs/d4406d51-fc3a-46e1-8e25-31a5f43b05e2)                                        | CWA Script        | For implementing the Prompt-User agnostic script.                                                |
| [SEC - Windows Patching - Agnostic - Update-Windows10](/docs/7fdd2a3b-2dca-43db-8a1d-f350967f1055)                                            | Agnostic Script    | For updating Windows.                                                                              |
| [SEC - Windows Patching - Script - Windows 10 - Feature Update - Install Latest](/docs/5a4a9091-269e-4921-a7ba-bc87c209a43c)                 | CWA Script        | For implementing the Update-Windows10 agnostic script, setting up tables, creating groups, adding machines to that group, and implementing the CWA User-Show-PromptMessage script. |
| [EPM - Data Collection - Script - Remote Event Log Monitor - Create](/docs/144d7d52-8764-4aa4-bcce-205c756f6203)                               | CWA Script        | For setting up a monitor on a group of computers that have received the Update-Windows10 script.   |
| [EPM - Data Collection - Script - Windows 10 Update Stats - Retrieve](/docs/65815475-a61d-4f0d-b2ba-c7b8368285c9)                             | CWA Autofix Action Script | For importing data to the custom table and removing machines from the created group.              |
| [CWM - Automate - Script - Prompter](/docs/d8a124df-ea81-4194-82fc-a082c7a036d8)                                                             | CWA Script        | Used when using the Prompter prompting option.                                                     |
| [Prompter](/docs/d8a124df-ea81-4194-82fc-a082c7a036d8)                                                                                       | Agnostic Application | Prompter application.                                                                              |
| - Alert Template:<br/><ul><li>Name: △ Autofix - Start Windows 10 Build upgrade</li></ul>                                                            | Alert Template    | Created to call Windows 10 - Feature Update - Install Latest between 1 and 3 AM daily            |

## Implementation

For autofix action:

1. Import the Windows 10 - Feature Update - Install Latest script.
2. Import the △ Autofix - Start Windows 10 Build upgrade alert template.
3. Configure autofix as desired.

**NOTE:** Steps 2 and 3 will be removed and replaced with an alert template import in the plugin in the next version.

For a manual run:

1. Import the Windows 10 - Feature Update - Install Latest script.
2. Run the script when ready.

## FAQ

1. **I have been running the Windows 10 - Feature Update - Install Latest script, but the table is not receiving any data.**
   - Please go to the "Windows 10 - Upgrade Pending Reports" group and ensure that an alert template to run the Windows 10 Update Stats - Retrieve script on alert is assigned to the monitor.

2. **I am not receiving the Pre or Post installation pop-up.**
   - Please ensure that the Prompt-User agnostic script is populating into the `programdata/_automation/script/Prompt-User` folder.
   - Please ensure that the automate script User-Show-PromptMessage is present in automate.

3. **The user was prompted for the reboot, but the computer never rebooted.**
   - Please review the update logs to verify that the update was not a failed attempt.
   - Check the script logs and verify that the user did not click OK without selecting a date; the script log will exit with failure if this is the case. A log will be created for this reason.
     - If this situation occurs, the update will stall out on the reboot portion, and the next manual reboot will trigger the completion of the update. The computer will still be placed in the appropriate group and will continue to be monitored for the populated event log to trigger reporting.

4. **The Windows 10 - Feature Update - Install Latest script is failing at line 13.**
   - Please add the Windows 10 - Update Stats - Retrieve script to your automate implementation.