---
id: '96cec9d2-d276-47a5-a1c5-d79d561c192a'
slug: /96cec9d2-d276-47a5-a1c5-d79d561c192a
title: 'Windows 11 Installer'
title_meta: 'Windows 11 Installer'
keywords: ['windows', 'upgrade', 'installer', 'script', 'deployment']
description: 'This document provides a comprehensive guide on installing Windows 11 on compatible Windows 10 computers using a script that includes options for reboot suppression. It covers requirements, dependencies, task creation, and detailed parameters for execution.'
tags: ['installation', 'setup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-07-22
---

## Summary

Install Windows 11 on a compatible Windows 10 computer. The default behavior of the script is to restart the computer to complete the upgrade. However, the `NoReboot` parameter provides an option to suppress the reboot. It is recommended that the computer be rebooted at the earliest convenience to complete the upgrade.

The OS drive should have 20 GB of free space to install the upgrade.

This task can be executed manually against the computers present in the [Windows 11 Compatible Machines](/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5) group.

## Sample Run

![Sample Run 1](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_3.webp)  
![Sample Run 2](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_4.webp)  
![Sample Run 3](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_5.webp)  

## Dependencies

- [CW RMM - Custom Field - Windows 11 Upgrade RunTime](/docs/ffce7cd6-7757-4918-bce0-461cf9dce0b4)
- [CW RMM - Device Group - Windows 11 Compatible Machines](/docs/9bfa70b2-a410-45d7-a8cc-a75c8e90c6f5)

## Variables

| Name   | Description                                       |
|--------|---------------------------------------------------|
| Output | Output of the previously executed PowerShell script. |

## User Parameters

| Name      | Type  | Required | Description                                                 | Default Value |
|-----------|-------|----------|-------------------------------------------------------------|---------------|
| NoReboot  | Flag  | No       | Provides an option to suppress the reboot while running the script. | False         |

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation 1](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_6.webp)  
![Task Creation 2](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_7.webp)  

**Name:** Windows 11 Installer  
**Description:** Install Windows 11 on a compatible Windows 10 computer.  
**Category:** Patching  

![Task Creation 3](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_8.webp)  

### Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_9.webp)  

This screen will appear.  
![Parameter Screen](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_10.webp)  

- Set `NoReboot` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Enable the `Default Value` option.
- Select `False` from the `Value` dropdown menu.
- Click the `Save` button.  
![Save Parameter](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_11.webp)  
- It will ask for confirmation to proceed. Click the `Confirm` button to create the parameter.  
![Confirm Parameter](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_12.webp)  

### Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Add Row](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_13.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_14.webp)  

#### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Select PowerShell Script](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_15.webp)  
![PowerShell Script Selected](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_16.webp)  

The following function will pop up on the screen:  
![PowerShell Function](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_17.webp)  

Paste in the following PowerShell script and leave the expected time of script execution set to `7200` seconds. Click the `Save` button.  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/windows-11-installer-beta/script.ps1)



![PowerShell Script Save](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_18.webp)  

#### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Add Row](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_19.webp)  

A blank function will appear.  
![Blank Function](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_14.webp)  

Search and select the `Script Log` function.  
![Select Script Log](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_20.webp)  
![Script Log](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_21.webp)  

The following function will pop up on the screen:  
![Script Log Blank](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_22.webp)  

In the script log message, simply type `%output%` and click the `Save` button  
![Script Log Set](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_25.webp)

Click the `Save` button at the top right corner of the screen to save the task.  
![Script Save](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_23.webp)  

Click the `Save` button at the top right corner of the screen to save the task.

## Completed Task

![Completed Task](../../../static/img/docs/a4668ce4-9788-47a9-bb3b-1997367803ad/image_24.webp)  

## Deployment

It is suggested to run this task manually for the time being.

## Output

- Script Log
- Custom Field

## Changelog

### 2025-07-23

- Fixed PowerShell Bug

### 2025-04-10

- Initial version of the document

### 2025-04-02

- Updated the document to remove deprecated custom fields.

