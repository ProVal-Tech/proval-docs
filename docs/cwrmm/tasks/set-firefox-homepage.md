---
id: '708255d7-3abc-4e10-b9f5-3f943f435695'
slug: /708255d7-3abc-4e10-b9f5-3f943f435695
title: 'Set Firefox Homepage'
title_meta: 'Set Firefox Homepage'
keywords: ['firefox', 'homepage', 'script', 'rmm', 'configuration']
description: 'This document provides a detailed guide on how to set a homepage in Firefox using ConnectWise RMM. It includes user parameters, task creation steps, sample runs, and the PowerShell script necessary for implementation.'
tags: ['application', 'firefox', 'setup']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

Applies a homepage to Firefox. CW RMM implementation of [Set-FirefoxHomepage](/docs/09a48350-5bd8-4d4a-8436-d1aa46bcd92e).

## Sample Run

![Sample Run 1](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_1.webp)  
![Sample Run 2](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_2.webp)  
![Sample Run 3](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_3.webp)  

## Dependencies

[Set-FirefoxHomepage](/docs/09a48350-5bd8-4d4a-8436-d1aa46bcd92e)  

## User Parameters

| Name                        | Example                               | Required | Type         | Description                           |
|-----------------------------|---------------------------------------|----------|--------------|---------------------------------------|
| `Homepage`                  | [https://www.provaltech.com](https://www.provaltech.com) | True     | Text String  | The URL to the desired homepage.      |
| `EnforceHomepageStartup`    | 0/1                                   | False    | Flag         | Sets the browser to display the homepage on startup. |

![User Parameters Image](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_4.webp)  

## Task Creation

Create a new `Script Editor` style script in the system to implement this Task.  
![Task Creation Image 1](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_5.webp)  
![Task Creation Image 2](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_6.webp)  

**Name:** `Set Firefox Homepage`  
**Description:** `Applies a homepage to Firefox.`  
**Category:** `Application`  
![Task Creation Image 3](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_7.webp)  

## Parameters

### Homepage

Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_8.webp)  

This screen will appear.  
![Parameter Image 2](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_9.webp)  

- Set `Homepage` in the `Parameter Name` field.
- Enable the `Required Field` button.
- Select `Text String` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Parameter Image 3](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_10.webp)  

### EnforceHomepageStartup:
Add a new parameter by clicking the `Add Parameter` button present at the top-right corner of the screen.  
![Parameter Image 1](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_8.webp)  

This screen will appear.  
![Parameter Image 2](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_9.webp)  

- Set `EnforceHomepageStartup` in the `Parameter Name` field.
- Select `Flag` from the `Parameter Type` dropdown menu.
- Click the `Save` button.  

![Parameter Image 4](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_11.webp)  

## Task

Navigate to the Script Editor Section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Task Image 1](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_12.webp)  

A blank function will appear.  
![Task Image 2](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_13.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  
![Task Image 3](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_14.webp)  
![Task Image 4](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_15.webp)  

The following function will pop up on the screen:  
![Task Image 5](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_16.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.  

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/set-firefox-homepage/script.ps1)



![Task Image 6](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_17.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Task Image 7](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_18.webp)  

A blank function will appear.  
![Task Image 8](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_19.webp)  

Search and select the `Script Log` function.  
![Task Image 9](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_20.webp)  

The following function will pop up on the screen:  
![Task Image 10](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_21.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Task Image 11](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_22.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Task Image 12](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_23.webp)  

## Completed Script

![Completed Script](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_24.webp)  

## Output

- Script Log  
![Output Log](../../../static/img/docs/708255d7-3abc-4e10-b9f5-3f943f435695/image_25.webp)

## Changelog

### 2025-04-10

- Initial version of the document

