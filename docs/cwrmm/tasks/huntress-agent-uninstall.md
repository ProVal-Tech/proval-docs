---
id: '12b83efc-afab-463a-a26e-d94e9e963d96'
slug: /12b83efc-afab-463a-a26e-d94e9e963d96
title: 'Huntress Agent (UNINSTALL)'
title_meta: 'Huntress Agent (UNINSTALL)'
keywords: ['uninstall', 'huntress', 'windows', 'agent', 'script']
description: 'This document provides a detailed guide on how to uninstall the Huntress agent from a Windows machine using a PowerShell script. It includes dependencies, script creation steps, and deployment instructions.'
tags: ['software', 'uninstallation', 'windows']
draft: false
unlisted: false
last_update:
  date: 2025-11-27
---

## Summary

This document outlines the steps to uninstall the Huntress agent from a Windows machine if it is installed.

## Dependencies

- None. This script can be run on any Windows device.

## Create Script

To implement this script, please create a new PowerShell script.

![Image 1](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_1.webp)  
![Image 2](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_2.webp)  

**Name:** Huntress Agent (UNINSTALL)  
**Description:** This task will uninstall the Huntress agent if it is installed on the machine.  
**Category:** Custom  

![Image 3](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_3.webp)  

## Script

## Row 1 Function: PowerShell Script

Click on "Add Row" and select the PowerShell Script function.

![Image 4](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_4.webp)  

Paste in the following PowerShell script and set the expected script execution time to 900 seconds.

[PowerShell Script](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/huntress-agent-uninstall/script.ps1)



![Image 5](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_5.webp)  

## Step 2 Logic: If Then Else

### IF Condition

- Add a new `If/Then/Else` logic from the "Add Logic" dropdown menu.

![Image 6](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_6.webp)  

### ROW 2a Condition: Output Contains

- Type `Huntress agent is not installed` in the Value box.
- Select another condition with OR operation and type `Huntress agent successfully uninstalled` in the value box.

![Image 7](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_7.webp)  

### ROW 2b Function: Script Log

- Add a new row in the If Section of the If/Else part by clicking the "Add Row" button.
- Search and select the `Script Log` function.
- Input the following:

[Bash Script 1](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/huntress-agent-uninstall/script1.sh)



![Image 8](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_8.webp)  

### Step 2c Function: Script Exit

- Add another row by selecting the "ADD ROW" button.
- Search and select the `Script Exit` function.
- Leave it blank.

![Image 9](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_9.webp)  
![Image 10](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_10.webp)  

### Step 2d Function: Script Exit

- Add another row by selecting the "ADD ROW" button in the `Else` section.
- Search and select the `Script Exit` function.
- Input the following:

[Bash Script 2](https://github.com/ProVal-Tech/cw-rmm/blob/main/tasks/huntress-agent-uninstall/script2.sh)



![Image 11](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_11.webp)  
![Image 12](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_12.webp)  

The final task should look like the screenshot below.

![Final Task Image](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_13.webp)  

## Script Deployment

For now, the task has been created to run manually on the machines.

Go to Automations > Tasks.  
Search for "Huntress Agent Install."  
Then click on "Schedule" and provide the parameters details as necessary for the script completion.

![Image 13](../../../static/img/docs/d21f56f3-43d8-4080-a7f0-ae57c27465e2/image_14.webp)  

## Output

- Script log

## Changelog

### 2025-04-10

- Initial version of the document

