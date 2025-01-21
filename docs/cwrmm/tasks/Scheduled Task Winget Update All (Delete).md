---
id: 'aca364ec-208f-47e8-a838-11b8ee0c9f95'
title: 'Scheduled Task Winget Update All (Delete)'
title_meta: 'Scheduled Task Winget Update All (Delete)'
keywords: ['scheduled', 'winget', 'update', 'delete', 'task', 'rmm']
description: 'This document provides a detailed guide on how to create and deploy a task to remove scheduled tasks related to the Winget Update All feature in ConnectWise RMM. It includes sample runs, dependencies, variables, task creation steps, and deployment instructions.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The ultimate objective of the task is to remove the scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]) created by the [CW RMM - Task - Scheduled Task Winget Update All (Create)](<./Scheduled Task Winget Update All (Create).md>) task.

## Sample Run

![Sample Run 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_1.png)

![Sample Run 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_2.png)

## Dependencies

- [CW RMM - Custom Field - Company - WingetUpdateAll_Task_Delete](<../custom-fields/Company - WingetUpdateAll_Task_Delete.md>)
- [CW RMM - Custom Field - EndPoint - WingetUpdateAll_Task_Result](<../custom-fields/EndPoint - WingetUpdateAll_Task_Result.md>)
- [CW RMM - Device Group - Winget Update All (Task Delete)](<../groups/Winget Update All (Task Delete).md>)

## Variables

| Name   | Description                                               |
|--------|-----------------------------------------------------------|
| Output | Output of the command removing the scheduled tasks       |

### Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_3.png)

![Task Creation 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_4.png)

**Name:** Scheduled Task Winget Update All (Delete)

**Description:** The ultimate objective of the task is to remove the scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]).

**Category:** Patching

![Task Creation 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_5.png)

## Task

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Step 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_6.png)

This function will appear.

![Task Step 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_7.png)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Step 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_8.png)

![Row 1 Step 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_9.png)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
if ( (get-ciminstance -classname Win32_OperatingSystem).caption -match 'Windows 1[01]' ) { 'Supported' } else { 'Unsupported' }
```

![Row 1 Step 3](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_10.png)

### Row 2 Logic: If Then

![Row 2 Step 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_11.png)

![Row 2 Step 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_12.png)

### Row 2a Condition: Output Contains

Type `Unsupported` in the `Input Value or Variable` field and press `Enter`.

![Row 2a Step 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_13.png)

### Row 2b Function: Script Log

Add a new row by clicking on the `Add row` button.

![Row 2b Step 1](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_14.png)

Search and select the `Script Log` function.

![Row 2b Step 2](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_15.png)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Unsupported Operating System.
```

```plaintext
Supported OS are Windows 10 and Windows 11
```

### Row 2c Function: Script Exit

Add a new row by clicking on the `Add row` button.

Search and select the `Script Exit` function.

### Note:
Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

## Completed Script

![Completed Script](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_16.png)

Click the `Save` button at the top right corner of the screen to save the script.

![Save Script](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_17.png)

## Deployment

It is suggested to run the task once per day against the [Winget Update All (Task Delete)](<../groups/Winget Update All (Task Delete).md>) device group.

- Go to `Automation` > `Tasks.`
- Search for `Scheduled Task Winget Update All (Delete) Task.`
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.

![Schedule Task](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_18.png)

This screen will appear.

![Schedule Screen](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_19.png)

Click the `Does not repeat` button.

![Does Not Repeat](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_20.png)

This pop-up box will appear.

![Pop-Up Box](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_21.png)

Click the `OK` button to save the schedule. Recurrence will be changed to `Every day`.

![Recurrence](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_22.png)

Select the `Device Groups` option in the `Targeted Resources` section.

![Device Groups](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_23.png)

Search and select the [Winget Update All (Task Delete)](<../groups/Winget Update All (Task Delete).md>) device group.

![Device Group Selection](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_24.png)

Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_25.png)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/Scheduled-Task-Winget-Update-All-(Delete)/image_26.png)

## Output

- Custom Field
- Script Log

