---
id: '7064a8be-8470-4ca4-a1a6-13f70a242b8c'
slug: /7064a8be-8470-4ca4-a1a6-13f70a242b8c
title: 'Get - .Net Framework Version'
title_meta: 'Get - .Net Framework Version'
keywords: ['.net','Framework','version','Detection']
description: 'Runs the `Get - .Net Framework Version [CF]` automation weekly against `cPVAL Windows Machines` group to get .Net Framework Version and updates the `cPVALnetFrameWorkVersion` custom field with the retrieved information.'
tags: ['dotnet','windows']
draft: False
unlisted: false
---

## Summary
Runs the `Get - .Net Framework Version [CF]` automation weekly against `cPVAL Windows Machines` group to get .Net Framework Version and updates the `cPVALnetFrameWorkVersion` custom field with the retrieved information.

## Dependencies
[Automation - Get - .Net Framework Version [CF]](/docs/da0dccbe-ef31-4627-ac10-e242828102e0)  
[ Group - cPVAL Windows Servers](/docs/c73e004e-6a9c-40e4-8e74-babb4b729256)  
[Custom Field - cPVAL .NET FrameWork Version](/docs/06ee57e9-a6cf-4ee0-9430-8e548fac15fb/)

## Details

| Name       | Description | Allow Groups | Repeats | Recur every | Start At | Ends | Targets | Automations |
| ---------- | ----------- | ------------ | ------- | ----------- | -------- | ---- | ------- | ----------- |
| Get - .Net Framework Version | Retrieves .net Framework Version and stores it in `cPVALnetFrameWorkVersion` custom field.| True | Weekly | 1 week | Current Time | Never | `cPVAL Windows Machines` Group | `Get - .Net Framework Version [CF]` |

## Task Creation

### Step 1

Navigate to `Administration` > `Tasks`  
![Step1](../../../static/img/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042/step1.webp)

### Step 2

Locate the `New Task` button on the right-hand side of the screen, click on it.  
![NewTask](../../../static/img/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042/newtask.webp)

The `New Scheduled Task` window will appear on the screen.  
![NewTask](../../../static/img/docs/8bbf34f6-8c05-4776-9f8c-c589944b4042/newscheduledtask.webp)

### Step 3
Set the following details in the General section.

- `Enabled:` True  
- `Name:` Get - .Net Framework Version 
- `Description:` Retrieves .net Framework Version and stores it in 'cPVALnetFrameWorkVersion' custom field.  
- `Allow Groups:` True  
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image1.webp)

### Step 4
Set the following details in the Schedule section:

- `Repeats:` Weekly  
- `Recur every:` 1 Week 
- `Start At:` \<Current Time\>  
- `Ends:` Never  
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image2.webp)

### Step 5

Click the `Add` button in the `Automations` section to add the `Get - .Net Framework Version [CF]` automation.
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image3.webp)

Search and select the `Get - .Net Framework Version [CF]` automation in the Automation Library, that will appear after clicking the `Add` button.
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image4.webp)

### Step 6
Click the `Apply` button on the script's parameter window without making any changes.
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image5.webp) 

### Step 7
- Navigate to the  `Targets` section by clicking the `Targets` button.
- Click the `Add` button located on the right-hand side of the screen.
- In the `Targets` window that appears, select the `Group` option from the dropdown menu.
- Search for cPVAL and select the `cPVAL Windows Machines` group.
- Click the `Apply` button at the bottom of the screen to save the selected target.

![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image6.webp) 

## Completed Task
### Details Section

The `Details` section will display the configured task details.

![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image7.webp) 

### Targets Section
The `Targets` section will show the selected target group.
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image8.webp) 

## Saving the Task
Click the `Save` button at the top of the screen to save the scheduled task.

You will be prompted to verify your MFA code after clicking the `Save` button. Enter your MFA code and click the `Continue` button to finalize the task creation.  
![TaskCreation](../../../static/img/docs/7064a8be-8470-4ca4-a1a6-13f70a242b8c/image9.webp) 