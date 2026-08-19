---
id: 'a616e505-d119-4fbd-90eb-6fcd9ebea41e'
slug: /a616e505-d119-4fbd-90eb-6fcd9ebea41e
title: 'Set - Chromium Homepage'
title_meta: 'Set - Chromium Homepage'
keywords: ['homepage', 'browsers', 'settings', 'enforcement', 'chromium']
description: 'This document provides a detailed guide on how to set an enforced homepage in popular browsers such as Brave, Chrome, and Edge. It includes implementation steps, user parameters, and sample runs to ensure proper configuration.'
tags: ['software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This document outlines how to set an enforced homepage in popular browsers like Brave, Chrome, and Edge.

## Sample Run

![Sample Run Image 1](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_1.webp)

To add [https://www.google.com/](https://www.google.com/) to the homepage for Edge:

![Sample Run Image 2](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_2.webp)

Select `Run Now` and click on `Run Task`:

![Sample Run Image 3](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_3.webp)

## Dependencies

[Set-ChromeHomepage](/docs/f07dd124-b64e-4906-8f33-5a2109ac73ab)

## User Parameters

| Name                     | Example                          | Required | Description                                                                                               |
|--------------------------|----------------------------------|----------|-----------------------------------------------------------------------------------------------------------|
| Homepage                 | [https://www.google.com/](https://www.google.com/) | True     | String value of the homepage to set in the browser.                                                      |
| EnforceOnNewTab         | --                               | False    | Include this switch to force the homepage on each new tab instead of the new tab page.                  |
| EnforceHomepageStartup    | --                               | False    | Include this switch to force the homepage to be the only open tab at startup of the browser.             |
| Target                   | Brave, Chrome, Edge              | False    | This designates the targeted Chromium-based browser to apply the setting to. You can leave the field blank if you want to set the same homepage for all the Chromium browsers available. |

![User Parameters Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_4.webp)

## Implementation

Create a new `Script Editor` style script in the system to implement this task.

![Implementation Image 1](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_5.webp)

![Implementation Image 2](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_6.webp)

**Name:** Set - Chromium Homepage  
**Description:** Sets an enforced homepage in certain popular browsers like Brave, Chrome, and Edge.  
**Category:** Management

![Implementation Image 3](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_7.webp)

## Parameters

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.

![Add Parameter Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_8.webp)

This screen will appear.

![Parameter Screen Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_9.webp)

### Homepage

- Set `Homepage` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Toggle ON the `Required Field` button.
- Click the `Save` button.

![Homepage Parameter Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_10.webp)

Click the `Confirm` button to save the parameter.

![Confirm Parameter Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_11.webp)

### EnforceOnNewTab

- Set `EnforceOnNewTab` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![EnforceOnNewTab Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_12.webp)

Click the `Confirm` button to save the parameter.

![Confirm EnforceOnNewTab Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_13.webp)

### EnforceHomepageStartup

- Set `EnforceHomepageStartup` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![EnforceHomepageStartup Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_14.webp)

Click the `Confirm` button to save the parameter.

![Confirm EnforceHomepageStartup Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_15.webp)

### Target

- Set `Target` in the `Parameter Name` field.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.

![Target Parameter Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_16.webp)

Click the `Confirm` button to save the parameter.

![Confirm Target Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_17.webp)

Once all the parameters are created, it should look like this:

![Parameters Created Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_18.webp)

Proceed with the steps below to create a task.

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.

![Add Row Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_19.webp)

A blank function will appear.

![Blank Function Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_20.webp)

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.

![PowerShell Script Image 1](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_21.webp)

![PowerShell Script Image 2](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_22.webp)

The following function will pop up on the screen:

![PowerShell Script Function Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_23.webp)

Copy the below PowerShell commands and paste them in the `PowerShell Script Editor` box:

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/set-chromium-homepage/script.ps1)



![PowerShell Script Image 3](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_24.webp)

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.

![Add Row Image 2](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_25.webp)

A blank function will appear.

![Blank Function Image 2](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_20.webp)

Search and select the `Script Log` function.

![Script Log Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_26.webp)

The following function will pop up on the screen:

![Script Log Function Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_27.webp)

In the script log message, simply type `%output%` and click the `Save` button.

![Script Log Save Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_28.webp)

Click the `Save` button at the top-right corner of the screen to save the script.

![Script Log Save Confirmation Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_29.webp)

## Completed Task

The Script Editor should look like this:

![Completed Task Image](../../../static/img/docs/a616e505-d119-4fbd-90eb-6fcd9ebea41e/image_30.webp)

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

