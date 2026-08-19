---
id: '904664df-741e-4c18-9667-6bf351b4754c'
slug: /904664df-741e-4c18-9667-6bf351b4754c
title: 'Unprotect Bitlocker Volume'
title_meta: 'Unprotect Bitlocker Volume'
keywords: ['bitlocker', 'protection', 'disable', 'volumes', 'security']
description: 'This document provides detailed instructions on how to disable Bitlocker protection on one or all volumes. It includes sample runs, dependencies, user parameters, task creation steps, and script execution details.'
tags: ['encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

Disable Bitlocker protection on one (or all) volumes.

## Sample Run

![Sample Run 1](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_1.webp)  
![Sample Run 2](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_2.webp)  
![Sample Run 3](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_3.webp)  

## Dependencies

[Unprotect-BitLockerVolume](/docs/22114d12-c60e-479e-93a5-50d3450b6631)

## User Parameters

| Name       | Example       | Required   | Description                                                        |
|------------|---------------|------------|--------------------------------------------------------------------|
| MountPoint | C:            | Partially  | The target volume to remove Bitlocker protection from.             |
| All        | True / False  | Partially  | Use this switch to remove Bitlocker protection from all volumes.   |

**Note:**

- The `All` parameter will take precedence if both parameters are specified.
- If no parameters are set, the script will attempt to disable BitLocker on the system drive.

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.  

![Task Creation 1](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_4.webp)  
![Task Creation 2](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_5.webp)  

**Name:** Unprotect Bitlocker Volume  
**Description:** Disable Bitlocker protection on one (or all) volumes.  
**Category:** Security  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_6.webp)  

This screen will appear.  

![Parameter Screen](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_7.webp)  

- Set `MountPoint` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_8.webp)  

Click the `Confirm` button to save the parameter.  

![Confirm Save](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_9.webp)  

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  

![Add Parameter Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_6.webp)  

This screen will appear.  

![Parameter Screen Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_7.webp)  

- Set `All` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Save Parameter Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_10.webp)  

Click the `Confirm` button to save the parameter.  

![Confirm Save Again](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_11.webp)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  

![Add Row](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_12.webp)  

A blank function will appear.  

![Blank Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_13.webp)  

Search and select the `PowerShell Script` function.  

![Select PowerShell Script](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_14.webp)  

![PowerShell Script Selected](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_15.webp)  

The following function will pop up on the screen:  

![PowerShell Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_16.webp)  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/unprotect-bitlocker-volume/script.ps1)



![Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_17.webp)  

## Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  

![Add Row for Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_18.webp)  

A blank function will appear.  

![Blank Function for Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_13.webp)  

Search and select the `Script Log` function.  

![Select Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_19.webp)  

![Script Log Selected](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_20.webp)  

The following function will pop up on the screen:  

![Script Log Function](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_21.webp)  

In the script log message, simply type `%output%` and click the `Save` button.  

![Save Script Log](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_22.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  

![Save Script](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_23.webp)  

## Completed Task

![Completed Task](../../../static/img/docs/904664df-741e-4c18-9667-6bf351b4754c/image_24.webp)  

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

