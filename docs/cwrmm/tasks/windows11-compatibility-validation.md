---
id: '676de0c3-b6a2-4a82-bf87-6d00395a7dff'
slug: /676de0c3-b6a2-4a82-bf87-6d00395a7dff
title: 'Windows 11 Compatibility Validation'
title_meta: 'Windows 11 Compatibility Validation'
keywords: ['windows', 'compatibility', 'validation', 'upgrade', 'task']
description: 'This document provides a comprehensive guide to verify if a Windows 10/11 PC is compatible with Windows 11, including sample runs, dependencies, task creation steps, and deployment instructions.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2025-08-26
---

## Summary

Verify if a Windows 10/11 PC is compatible with Windows 11 upgrade.

## Sample Run

![Sample Run 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_1.webp)  
![Sample Run 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_2.webp)

## Dependencies

- [Device Group - Upgrade Enabled Windows 11 Compatible Machines](/docs/9c422249-e949-4bcd-83ea-2c91b8365a96)  
- [Custom Field - Endpoint - Windows 11 incompatible](/docs/7894870c-b7e8-44e0-806c-c948f151fc49)  
- [Device Group - Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a)  
- [Device Group - Windows 11 machines](/docs/a3cdc948-d650-413e-8c02-3b549403f88f)



## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_3.webp)  
![Task Creation Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_4.webp)  

- **Name:** Windows 11 Compatibility Validation  
- **Description:** Verify if a Windows 10/11 PC is compatible with Windows 11.  
- **Category:** Patching  
![Task Creation Image 3](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image33.webp)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Navigation Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_6.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![PowerShell Script Selection Image 1](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_8.webp)  
![PowerShell Script Selection Image 2](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_9.webp)  

The following function will pop up on the screen:  
![PowerShell Script Popup Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_10.webp)  

Paste in the following PowerShell script and set the expected time of script execution to `600` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/windows11-compatibility-validation/script.ps1)



![PowerShell Script Execution Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_11.webp)  

Mark the `Continue on Failure` checkbox for the function.  
![Continue on Failure Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_12.webp)  

### Row 2 Function: Set Custom Field

- Add a new row with the `Add Row` button.  
- A blank function will appear.   

![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  

![Set Custom Field Image 8](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp)  

Search and select `Windows 11 incompatible Base` in the `Search Custom Field`. Set `%Output%` in the `Value` field, and click the `Save` button.  

![Set Custom Field Image 9](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_34.webp)  

![Set Custom Field Image 10](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_35.webp)


### Row 3 Function: Script Log

- Add a new row with the `Add Row` button.  
- A blank function will appear.  

![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp) 

Search and select `Script Log` Function. 

![Image](../../../static/img/docs/windows11-compatibility-validation/image.png)

Paste the following lines in the `Error Message` field and click the `Save` button.

```plaintext
%Output%
```

![Image](../../../static/img/docs/windows11-compatibility-validation/image-1.png)


### Row 4 Logic: If/Then/Else

Add a new `If/Then/Else` logic.  
![Image](../../../static/img/docs/windows11-compatibility-validation/image-2.png)

An empty logic will appear.  
![Image](../../../static/img/docs/windows11-compatibility-validation/image-3.png)

#### Row 4a Condition: Output Contains

Type `Result=CAPABLE` in the `Input Value or Variable` field and press `Enter`.
![Image](../../../static/img/docs/windows11-compatibility-validation/image-4.png)

##### Row 4a(i) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the `If` section.

![Image](../../../static/img/docs/windows11-compatibility-validation/image-5.png)

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp) 

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  

![Set Custom Field Image 8](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp) 

Search and select `Windows 11 Compatible` in the `Search Custom Field` field, set `Yes` in the `Value` field, and click the `Save` button.
![Image](../../../static/img/docs/windows11-compatibility-validation/image-6.png)

![Image](../../../static/img/docs/windows11-compatibility-validation/image-7.png)

##### Row 4a(ii) Function: Set Custom Field

Add a new row by clicking the `Add Row` button inside the inner `Else` section.  
![Set Custom Field Image 6](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_33.webp)  

A blank function will appear.  
![Blank Function Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_7.webp)  

Search and select `Set Custom Field` Function.  
![Set Custom Field Image 7](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_17.webp)  
![Set Custom Field Image 8](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_18.webp)  

Search and select `Windows 11 Compatible` in the `Search Custom Field` field and set `No` in the `Value` field and click the `Save` button.
![Set Custom Field Image 9](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_47.webp)  

![Set Custom Field Image 10](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_48.webp)   

---

Click the `Save` button at the top-right corner of the screen to save the script.  
![Save Script Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_36.webp)  

## Completed Task

![Image](../../../static/img/docs/windows11-compatibility-validation/image-8.png)
![Image](../../../static/img/docs/windows11-compatibility-validation/image-9.png)

## Deployment

It is suggested to run the Task once per month against [Windows 10 Machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) and [Windows 11 machines](/docs/a3cdc948-d650-413e-8c02-3b549403f88f).

- Go to `Automation` > `Tasks.`
- Search for `Windows 11 Compatibility Validation`.
- Select the concerned task.
- Click on the `Schedule` button to schedule the task/script.  
![Schedule Task Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_39.webp)  
- This screen will appear.  
![Schedule Screen Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image34.webp)
- Select the `Schedule` button and click the calendar icon present in front of the `Recurrence` option.  
![Recurrence Option Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_41.webp)  
- Select the `Month(s)` for the `Repeat`, set `1` for `Dates`, and click the `OK` button to save the schedule.  
![Save Schedule Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_42.webp)  
- Click the `Select Targets` button to select the concerned target.  
![Select Targets Image](../../../static/img/docs/007d88ec-68b1-45fa-8d95-9c279218ac3c/image_43.webp)  
- Search and select the [Windows 10 machines](/docs/8d5c2d6a-5bb8-4720-bd11-4fa7396fbf7a) and [Windows 11 machines](/docs/a3cdc948-d650-413e-8c02-3b549403f88f)

![Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image22.webp)   
- Click the `Run` button to initiate the schedule.  
![Run Task Image](../../../static/img/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5/image35.webp)  

## Output

- Script Log
- Custom Field

## Changelog

### 2025-06-30

- The Windows 11 compatibility validation script has been updated to check for 64GB of free space. This will run in addition to the existing total space check, and they can pass/fail independently of each other.

### 2025-05-02

- Initial version of the document

