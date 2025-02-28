---
id: '42e9ec1d-84df-11ef-8a0f-8600008a66b7'
title: 'Copilot - Enable/Disable'
title_meta: 'Copilot - Enable/Disable'
keywords: ['Copilot', 'Edge', 'Microsoft', 'Windows', 'Browser']
description: 'This script will uninstall and disable the Windows Copilot application as well as its functionality in the Edge browser. It has the revert option available too.'
tags: ['Copilot', 'Edge', 'Microsoft', 'Browser', 'pilot']
draft: false
unlisted: false
---

## Summary
This script will uninstall and disable the Windows Copilot application as well as its functionality in the Edge browser.
It has the revert option available too to revert the changes to its original state.
The Copilot changes stores to the computer-EDF from where the data populates to the DV.
The revert and disable can be scheduled using Autofix monitors.

## Sample Run

![Set_Environment](<../../../static/img/docs/Copilot - Enable-Disable/image.png>)
![Copilot_Revert](<../../../static/img/docs/Copilot - Enable-Disable/image-1.png>)
![Normal_Execution](<../../../static/img/docs/Copilot - Enable-Disable/image-2.png>)

## Dependencies

[Monitor_Copilot_Disable_&_Uninstall](<../monitors/Copilot Disable and Uninstall.md>)

[Monitor_Copilot_Revert_Deployment](<../monitors/Copilot Revert Deployment.md>)

[DV_Copilot_Enable_Disable](<../dataviews/Copilot Enable_Disable.md>)


#### User Parameters

| Name           | Example | Required | Description                                                                                                         |
|----------------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| Revert         | 1       | False    | Revert the Copilot changes to enable and install it on the agents where script has disabled and uninstalled it in the past. |
| Set_Envrionment| 1       | False    | This is required to be run during import with value 1 so that the EDFs got imported for the solution to run properly. |

## EDFs

| Name                    | Level    | Type     | Example                       | Description                                                                                                      |
|-------------------------|----------|----------|-------------------------------|------------------------------------------------------------------------------------------------------------------|
| Copilot_Status          | Client   | Text     | Disabled -- 2025-02-28 00:00:00 | This stores the Copilot status after script completion with the script ran date and time                         |
| Exclude Copilot Revert  | Computer | Checkbox | 1 or 0                         | This excludes the copilot revert action for the computer where it is checked                                     |
| Exclude Copilot Revert  | Location | Checkbox | 1 or 0                         | This excludes the agents of the location where it is checked                                                     |
| Exclude Copilot Disable | Computer | Checkbox | 1 or 0                         | This excludes the agent from getting its copilot disabled and uninstalled                                        |
| Exclude Copilot Disable | Location | Checkbox | 1 or 0                         | This excludes the agents of the location from getting its copilot disabled and uninstalled                       |
| Copilot Revert Enable   | Client   | Checkbox | 1 or 0                         | This check box allows the agents of clients to revert the Copilot disabling and uninstallation                   |
| Copilot Disable and Uninstall | Client | Checkbox | 1 or 0                         | This checkbox sets the agents of the client to disable its copilot and uninstall it completely                   |

## Output

- Script log
- Computer EDF
- Local file directory
- Dataview
