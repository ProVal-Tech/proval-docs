---
id: '42e9ec1d-84df-11ef-8a0f-8600008a66b7'
slug: /42e9ec1d-84df-11ef-8a0f-8600008a66b7
title: 'Copilot - Enable/Disable'
title_meta: 'Copilot - Enable/Disable'
keywords: ['Copilot', 'Edge', 'Microsoft', 'Windows', 'Browser']
description: 'This script will uninstall and disable the Windows Copilot application as well as its functionality in the Edge browser. It has the revert option available too.'
tags: ['Copilot', 'Edge', 'Microsoft', 'Browser', 'pilot']
draft: false
unlisted: false
---

## Summary
This script will uninstall and disable the Microsoft Copilot and Microsoft 365 copilot as well as its functionality in the Edge browser.
It has the revert option available too to revert the changes to its original state.
The Copilot changes stores to the computer-EDF from where the data populates to the DV.
The revert and disable can be scheduled using Autofix monitors.

**Note: please make sure to get the below hash whitelisted if there is any blocking security application:

F02B553A62B90CE5720647FDADB568E8

EEE454AAB028DE1528935E8962FBD775

## Sample Run

![Set_Environment](<../../../static/img/docs/Copilot - Enable-Disable/image.png>)
![Copilot_Revert](<../../../static/img/docs/Copilot - Enable-Disable/image-1.png>)
![Normal_Execution](<../../../static/img/docs/Copilot - Enable-Disable/image-2.png>)

## Dependencies

[Monitor_Copilot_Disable_&_Uninstall](/docs/d87e16ae-34f2-43ba-a84d-061abc69d716)

[Monitor_Copilot_Revert_Deployment](/docs/5dc486d6-d03e-4a76-a1b9-b5cd68c5b2a2)

[DV_Copilot_Enable_Disable](/docs/eaa46853-c09b-439a-a06b-6388c0a758b6)


#### User Parameters

| Name           | Example | Required | Description                                                                                                         |
|----------------|---------|----------|---------------------------------------------------------------------------------------------------------------------|
| Revert         | 1       | False    | Revert the Copilot changes to enable and install it on the agents where script has disabled and uninstalled it in the past. |
| Set_Envrionment| 1       | False    | This is required to be run during import with value 1 so that the EDFs got imported for the solution to run properly. |

## EDFs

| Name                    | Level    | Type     | Section    |Example                       | Description                                                                                                      |
|-------------------------|----------|----------|----------|------------------------------|------------------------------------------------------------------------------------------------------------------|
| Copilot_Status          | Computer | Text     | Copilot    |Disabled -- 2025-02-28 00:00:00 | This stores the Copilot status after script completion with the script ran date and time                         |
| Exclude Copilot Revert  | Computer | Checkbox | Exclusions     |1 or 0                         | This excludes the copilot revert action for the computer where it is checked                                     |
| Exclude Copilot Revert  | Location | Checkbox | Exclusions     |1 or 0                         | This excludes the agents of the location where it is checked                                                     |
| Exclude Copilot Disable | Computer | Checkbox | Exclusions    |1 or 0                         | This excludes the agent from getting its copilot disabled and uninstalled                                        |
| Exclude Copilot Disable | Location | Checkbox | Exclusions     |1 or 0                         | This excludes the agents of the location from getting its copilot disabled and uninstalled                       |
| Copilot Revert Enable   | Client   | Checkbox | Copilot    | 1 or 0                         | This check box allows the agents of clients to revert the Copilot disabling and uninstallation                   |
| Copilot Disable and Uninstall | Client | Checkbox | Copilot | 1 or 0                         | This checkbox sets the agents of the client to disable its copilot and uninstall it completely                   |

## Output

- Script log
- Computer EDF
- Local file directory
- Dataview
