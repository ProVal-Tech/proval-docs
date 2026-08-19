---
id: 'cad2f0a6-69fb-41df-9fdf-8014b31f7b47'
slug: /cad2f0a6-69fb-41df-9fdf-8014b31f7b47
title: 'Update Microsoft 365 Apps'
title_meta: 'Update Microsoft 365 Apps'
keywords: ['update', 'microsoft', '365', 'apps', 'office', 'click-to-run']
description: 'This document provides a detailed guide on how to run the Office Click-to-Run client to update Microsoft 365 Apps using ConnectWise RMM. It includes sample runs, task creation steps, and necessary dependencies for successful implementation.'
tags: ['application', 'setup', 'software', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This document describes how to run the Office Click-to-Run client to update Microsoft 365 Apps using the ConnectWise RMM implementation of the agnostic script [Update-Office](/docs/498075f7-623c-4b92-9fbc-fe0f5e7113a4  ).

## Sample Run

![Image 1](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_1.webp)  
![Image 2](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_2.webp)  

## Dependencies

- [Update-Office](/docs/498075f7-623c-4b92-9fbc-fe0f5e7113a4  )

## Task Creation

Create a new `Script Editor` style script in the system to implement this task.

![Image 3](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_3.webp)  
![Image 4](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_4.webp)  

**Name:** `Update Microsoft 365 Apps`  
**Description:** `Runs the Office Click-to-Run client to update Microsoft 365 Apps.`  
**Category:** `Application`  
![Image 5](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_5.webp)  

## Task

Navigate to the Script Editor section and start by adding a row. You can do this by clicking the `Add Row` button at the bottom of the script page.  
![Image 6](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_6.webp)  

A blank function will appear.  
![Image 7](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_7.webp)  

### Row 1 Function: PowerShell Script

Search and select the `PowerShell Script` function.  

![Image 8](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_8.webp)  
![Image 9](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_9.webp)  

The following function will pop up on the screen:  
![Image 10](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_10.webp)  

Paste in the following PowerShell script and set the `Expected time of script execution in seconds` to `300` seconds. Click the `Save` button.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/update-microsoft-365-apps/script.ps1)



![Image 11](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_11.webp)  

### Row 2 Function: Script Log

Add a new row by clicking the `Add Row` button.  
![Image 12](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_12.webp)  

A blank function will appear.  
![Image 13](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_13.webp)  

Search and select the `Script Log` function.  
![Image 14](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_14.webp)  

The following function will pop up on the screen:  
![Image 15](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_15.webp)  

In the script log message, simply type `%Output%` and click the `Save` button.  
![Image 16](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_16.webp)  

Click the `Save` button at the top-right corner of the screen to save the script.  
![Image 17](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_17.webp)  

## Completed Task

![Image 18](../../../static/img/docs/cad2f0a6-69fb-41df-9fdf-8014b31f7b47/image_18.webp)  

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

