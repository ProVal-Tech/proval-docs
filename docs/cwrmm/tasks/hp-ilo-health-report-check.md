---
id: 'e5e4ea6b-1d75-49c9-9569-26a213006bc7'
slug: /e5e4ea6b-1d75-49c9-9569-26a213006bc7
title: 'HP iLO - Health Report - Check'
title_meta: 'HP iLO - Health Report - Check'
keywords: ['hp', 'ilo', 'health', 'report', 'check', 'rmm']
description: 'This document provides a comprehensive guide on implementing a script to check the health status of HP iLO devices using ConnectWise RMM. It includes user parameters, task creation steps, and a sample PowerShell script for execution.'
tags: ['connectwise']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

The script will check and return the health status of the HP iLO devices, writing the output in a script log. It is a CW RMM implementation of [Get-HPiLOHealthReport](/docs/71faa943-e504-4e87-b8d1-39471af44780), an agnostic script.

## Sample Run

![Sample Run 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_1.webp)

![Sample Run 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_2.webp)

![Sample Run 3](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_3.webp)

## Dependencies

[Get-HPiLOHealthReport](/docs/71faa943-e504-4e87-b8d1-39471af44780)

## User Parameters

| Name        | Example                     | Required | Type        | Description                                                                                     |
|-------------|-----------------------------|----------|-------------|-------------------------------------------------------------------------------------------------|
| `Address`   | 192.168.2.16, 192.168.7.13:54 | True     | Text String | IP address of the iLO device. Port number must be added if a custom port is being used.       |
| `Username`  | Administrator               | True     | Text String | Admin username to connect with the iLO device.                                               |
| `Password`  | @!#f2GW@f2!$                | True     | Text String | Password for the admin user.                                                                    |

![User Parameters Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_4.webp)

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Task Creation Image 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_5.webp)

![Task Creation Image 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_6.webp)

**Name:** `HP iLO - Health Report - Check`  
**Description:** `The script will check and return the health status of the HP iLO devices, writing the output in a script log.`  
**Category:** Custom

![Task Creation Image 3](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_7.webp)

## Parameters

### Address

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_8.webp)

This screen will appear.

![Add Parameter Image 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_9.webp)

- Set `Address` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_10.webp)

### Username

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_8.webp)

This screen will appear.

![Add Parameter Image 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_9.webp)

- Set `Username` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_11.webp)

### Password

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_8.webp)

This screen will appear.

![Add Parameter Image 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_9.webp)

- Set `Password` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Enable the `Required Field` button.
- Click the `Save` button.

![Add Parameter Image 3](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_12.webp)

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_13.webp)

A blank function will appear.

![Blank Function Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_14.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Selection Image 1](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_15.webp)

![PowerShell Script Selection Image 2](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_16.webp)

The following function will pop up on the screen:

![PowerShell Script Function Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_17.webp)

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `900` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/hp-ilo-health-report-check/script.ps1)



![Row 1 Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_18.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_19.webp)

A blank function will appear.

![Blank Function Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_20.webp)

Search and select the `Script Log` function.

![Script Log Selection Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_21.webp)

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_22.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Save Script Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_23.webp)

## Completed Script

![Completed Script Image](../../../static/img/docs/e5e4ea6b-1d75-49c9-9569-26a213006bc7/image_24.webp)

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

