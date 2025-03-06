---
id: '00a48929-36d7-4435-8113-deb3b05b5bc2'
title: 'CWA Solution - Copilot Disable/Uninstall & Revert'
title_meta: 'CWA Solution - Copilot Disable/Uninstall & Revert'
keywords: ['Copilot', 'Pilot', 'Microsoft', 'Edge', 'Browser']
description: 'This solution contains Copilot disabling/uninstall and revert optional addition to revert the copilot back if required'
tags: ['Copilot', 'Pilot', 'Microsoft', 'Edge', 'Browser']
draft: false
unlisted: false
---

## Purpose
This solution contains Copilot disabling/uninstall and revert optional addition to revert the copilot back if required

## Associated Content

| Content                                                                 | Type               | Function                                                                                      |
|-------------------------------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------|
| [Script_Copilot_Enable_Disable](<../scripts/Copilot - Enable-Disable.md>)                                   | Script             | This script will uninstall and disable the Windows Copilot application as well as its functionality in the Edge browser. It has the revert option available too to revert the changes to its original state. The Copilot changes stores to the computer-EDF from where the data populates to the DV. The revert and disable can be scheduled using Autofix monitors. |
| [Monitor_Copilot_Disable_&_Uninstall](<../monitors/Copilot Disable and Uninstall.md>)                    | Internal Monitor   | This monitor disables the copilot and uninstall it from the detected agents.                  |
| [Monitor_Copilot_Revert_Deployment](<../monitors/Copilot Revert Deployment.md>)                        | Internal Monitor   | This monitor reverts the copilot changes and ensures to enable and install the copilot on the agents where the script has disabled and uninstalled it. |
| [Dataview_Copilot_Enable_Disable](<../dataviews/Copilot Enable_Disable.md>)                                   | Dataview           | This dataview contains the detail of action taken on the agent by the script at Copilot.      |
| **△ Custom - Execute Script - Copilot - Enable/Disable**                  | Alert Template     | This alert template is used in both monitors [Monitor_Copilot_Disable_&_Uninstall](<../monitors/Copilot Disable and Uninstall.md>) and [Monitor_Copilot_Revert_Deployment](<../monitors/Copilot Revert Deployment.md>) to execute the [Script_Copilot_Enable_Disable](<../scripts/Copilot - Enable-Disable.md>) for performing the disable/uninstall or revert action based on the `TestValue` result of the monitor. |

## Implementation

1. Import the following content from the `ProSync` plugin:
   - [Script_Copilot_Enable_Disable](<../scripts/Copilot - Enable-Disable.md>)
   - [Monitor_Copilot_Disable_&_Uninstall](<../monitors/Copilot Disable and Uninstall.md>)
   - [Monitor_Copilot_Revert_Deployment](<../monitors/Copilot Revert Deployment.md>)
   - [Dataview_Copilot_Enable_Disable](<../dataviews/Copilot Enable_Disable.md>)
   - Alert Template - `△ Custom - Execute Script - Copilot - Enable/Disable`

2. Execute the script [Script_Copilot_Enable_Disable](<../scripts/Copilot - Enable-Disable.md>) against any online Windows machine with the `Set_Environment` parameter set to `1` to create the EDFs used by the solution.
   
![Set_Envrionment](<../../static/img/docs/CWA Solution - Copilot Disable-Uninstall & Revert/image.png>)

3. Reload the system cache:

   ![Image](../../static/img/C2R-Update-Channel/image_2.png)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
   - [Monitor_Copilot_Disable_&_Uninstall](<../monitors/Copilot Disable and Uninstall.md>)
   - [Monitor_Copilot_Revert_Deployment](<../monitors/Copilot Revert Deployment.md>)
   - Right-click and Run Now to start the monitor
   - Set up with `△ Custom - Execute Script - Copilot - Enable/Disable` Alert Template