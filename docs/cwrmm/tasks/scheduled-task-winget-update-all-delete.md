---
id: 'aca364ec-208f-47e8-a838-11b8ee0c9f95'
slug: /aca364ec-208f-47e8-a838-11b8ee0c9f95
title: 'Scheduled Task Winget Update All (Delete)'
title_meta: 'Scheduled Task Winget Update All (Delete)'
keywords: ['scheduled', 'winget', 'update', 'delete', 'task', 'rmm']
description: 'This document provides a detailed guide on how to create and deploy a task to remove scheduled tasks related to the Winget Update All feature in ConnectWise RMM. It includes sample runs, dependencies, variables, task creation steps, and deployment instructions.'
tags: ['setup', 'windows']
draft: false
unlisted: false
---

## Summary

The ultimate objective of the task is to remove the scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]) created by the [Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e) task.

## Sample Run

![Sample Run 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_1.webp)

![Sample Run 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_2.webp)

## Dependencies

- [Custom Field - Company - WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a)
- [Custom Field - EndPoint - WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f)
- [Device Group - Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808)

## Variables

| Name   | Description                                               |
|--------|-----------------------------------------------------------|
| Output | Output of the command removing the scheduled tasks       |

### Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_3.webp)

![Task Creation 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_4.webp)

**Name:** Scheduled Task Winget Update All (Delete)

**Description:** The ultimate objective of the task is to remove the scheduled tasks (Winget Update All [System] and Winget Update All [Logged on User]).

**Category:** Patching

![Task Creation 3](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_5.webp)

## Task

Start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Task Step 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_6.webp)

This function will appear.

![Task Step 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_7.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![Row 1 Step 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_8.webp)

![Row 1 Step 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_9.webp)

Paste in the following PowerShell script and set the expected time of script execution to `300` seconds. Click the `Save` button.

```powershell
if ( (get-ciminstance -classname Win32_OperatingSystem).caption -match 'Windows 1[01]' ) { 'Supported' } else { 'Unsupported' }
```

![Row 1 Step 3](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_10.webp)

### Row 2 Logic: If Then

![Row 2 Step 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_11.webp)

![Row 2 Step 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_12.webp)

### Row 2a Condition: Output Contains

Type `Unsupported` in the `Input Value or Variable` field and press `Enter`.

![Row 2a Step 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_13.webp)

### Row 2b Function: Script Log

Add a new row by clicking on the `Add row` button.

![Row 2b Step 1](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_14.webp)

Search and select the `Script Log` function.

![Row 2b Step 2](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_15.webp)

Add the following log in the `Script Log Message` field and click the `Save` button:

```plaintext
Unsupported Operating System.

Supported OS are Windows 10 and Windows 11
```

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image.png)

### Row 2c Function: Script Exit

Add a new row by clicking on the `Add row` button.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-1.png)

Search and select the `Script Exit` function.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-2.png)

**Note:** Do not add any message or words in the `Error Message` field. Leave it blank and click the `Save` button.

### Row 3 Function: Command Prompt Script

Add a new row by clicking on `Add row` button outside the If/Then logic.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-3.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-4.png)

Search and select the `Command Prompt (CMD) Script` function.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-5.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-6.png)

Copy and paste the following command in the `Command Prompt Script Editor` and leave the `Expected time of script execution in seconds` to `300`. Click the `Save` button.

```shell
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -Command "foreach ( $task in ( 'Winget Update All [Logged on User]','Winget Update All [System]' ) ) { try { Get-ScheduledTask | Where-Object { $_.TaskName -eq $task } | Unregister-ScheduledTask -Confirm:$False -ErrorAction Stop } catch { return \"Failed to remove the task '$($task)'. Reason: $($Error[0].Exception.Message)\" } }"
```

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-7.png)

Enable the `Continue on Failure` flag.  

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-8.png)


### Row 4 Function: Script Log

Add a new row by clicking on `Add row` button.

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-9.png)

Search and select `Script Log` Function.

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-11.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-10.png)

Add the following log in the `Script Log Message` field and click the `Save` button:
Output of command to remove scheduled tasks: %Output%

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-12.png)

### Row 5 Logic: If Then Else

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-13.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-14.png)

### Row 5a Condition: Output Contains

Type `Failed to` in the `Input Value or Variable` field and press `Enter`.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-15.png)

### Row 5b Function: Set Custom Field

Add a new row by clicking on `Add row` button.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-16.png)

Search and select `Set Custom Field` Function.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-17.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-18.png)

Search and select `WingetUpdateAll_Task_Result` in the `Search Custom Field` field and set `Task Deletion Failed` in the `Value` field and click the `Save` button.  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-19.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-20.png)

### Row 5c Function: Set Custom Field

Add a new row by clicking on `Add row` button in the `Else` section.

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-21.png)

Search and select `Set Custom Field` Function.

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-22.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-23.png)

Search and select `WingetUpdateAll_Task_Result` in the `Search Custom Field` field and set `Task deleted` in the `Value` field and click the `Save` button.

![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-24.png)  
![alt text](../../../static/img/docs/scheduled-task-winget-update-all-delete/image-25.png)

## Completed Script

![Completed Script](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_16.webp)

Click the `Save` button at the top right corner of the screen to save the script.

![Save Script](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_17.webp)

## Deployment

It is suggested to run the task once per day against the [Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808) device group.

- Go to `Automation` > `Tasks.`
- Search for `Scheduled Task Winget Update All (Delete) Task.`
- Select the concerned task.
- Click on the `Schedule` button to schedule the task.

![Schedule Task](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_18.webp)

This screen will appear.

![Schedule Screen](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_19.webp)

Click the `Does not repeat` button.

![Does Not Repeat](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_20.webp)

This pop-up box will appear.

![Pop-Up Box](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_21.webp)

Click the `OK` button to save the schedule. Recurrence will be changed to `Every day`.

![Recurrence](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_22.webp)

Select the `Device Groups` option in the `Targeted Resources` section.

![Device Groups](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_23.webp)

Search and select the [Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808) device group.

![Device Group Selection](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_24.webp)

Now click the `Run` button to initiate the task.

![Run Task](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_25.webp)

The task will start appearing in the Scheduled Tasks.

![Scheduled Tasks](../../../static/img/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95/image_26.webp)

## Output

- Custom Field
- Script Log
