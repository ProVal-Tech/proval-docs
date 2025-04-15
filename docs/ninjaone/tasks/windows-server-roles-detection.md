---
id: '8bbf34f6-8c05-4776-9f8c-c589944b4042'
slug: /8bbf34f6-8c05-4776-9f8c-c589944b4042
title: 'Windows Server Roles Detection'
title_meta: 'Windows Server Roles Detection'
keywords: ['task', 'scheduled-task', 'roles']
description: 'Retrieves installed Windows Server roles and stores to the cPVAL Roles Detected custom field.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Runs the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation daily against [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group to identify the installed Windows Server roles and updates the [cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba) custom field with the retrieved information.

## Dependencies

[cPVAL Roles Detected](/docs/e9ec73dd-98b1-4436-a027-4ee8906f7cba)
[Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Windows Server Roles Detection | Retrieves installed Windows Server roles and stores to the cPVAL Roles Detected custom field. | True | Daily | 1 Days | Current Time | Never | [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group | [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation |

## Task Creation

### Step 1

Navigate to `Administration` > `Tasks`  
![Step1](../../../static/img/ninja-one-tasks-common-screenshots/step1.png)

### Step 2

Locate the `New Task` button on the right-hand side of the screen, click on it.  
![NewTask](../../../static/img/ninja-one-tasks-common-screenshots/newtask.png)

The `New Scheduled Task` window will appear on the screen.  
![NewTask](../../../static/img/ninja-one-tasks-common-screenshots/newscheduledtask.png)

### Step 3

Set the following details in the `General` section.  

**Enabled:** `True`  
**Name:** `Windows Server Roles Detection`  
**Description:** `Retrieves installed Windows Server roles and stores to the 'cPVAL Roles Detected' custom field.`  
**Allow Groups:** `True`

![Image1](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image1.png)

### Step 4

Set the following details in the `Schedule` section.

**Repeats:** `Daily`  
**Recur every:** `1 days(s)`  
**Start At:** `<Current Time>`  
**Ends:** `Never`

![Image2](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image2.png)

### Step 5

Click the `Add` button in the `Automations` section to add the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation.  
![Image3](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image3.png)

### Step 6

Search and select the [Windows Server Roles Detection](/docs/5cda8c79-bcd0-4226-b5a4-db846b9b35a9) automation in the `Automation Library`, that will appear after clicking the `Add` button.  
![Image4](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image4.png)

### Step 7

Click the `Apply` button on the script's parameter window without making any changes.  
![Image5](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image5.png)

### Step 8

Navigate to the `Targets` section by clicking the `Targets` button.  
![Image6](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image6.png)

### Step 9

Click the `Add` button located on the right-hand side of the screen.  
![Image7](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image7.png)

### Step 10

In the `Targets` window that appears, select the `Group` option from the dropdown menu.  
![Image8](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image8.png)

### Step 11

Search for `cPVAL` and select the [cPVAL - Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256) group.  
![Image9](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image9.png)

### Step 12

Click the `Apply` button at the bottom of the screen to save the selected target.  
![Image10](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image10.png)

## Completed Task

### Details Section

The `Details` section will display the configured task details.  
![Image11](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image11.png)

### Targets Section

The `Targets` section will show the selected target group.  
![Image12](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image12.png)

## Saving the Task

Click the `Save` button at the top of the screen to save the scheduled task.  
![Image13](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image13.png)

You will be prompted to verify your MFA code after clicking the `Save` button. Enter your MFA code and click the `Continue` button to finalize the task creation.  
![Image14](../../../static/img/ninja-one-tasks-windows-server-roles-detection/image14.png)