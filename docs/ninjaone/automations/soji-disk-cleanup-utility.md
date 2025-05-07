---
id: 'ef289b50-fe18-4114-93d0-680437f7c480'
slug: /ef289b50-fe18-4114-93d0-680437f7c480
title: 'Soji (Disk Cleanup Utility)'
title_meta: 'Soji (Disk Cleanup Utility)'
keywords: ['disk', 'cleanup', 'utility', 'windows', 'ninjaone']
description: 'This document provides a comprehensive guide on creating the Soji disk cleanup Task in ConnectWise RMM. Soji is a smart disk cleanup utility designed to enhance system cleanliness on Windows, utilizing native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.'
tags: ['cleanup', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

Soji is a smart yet straightforward disk cleanup utility designed to enhance system cleanliness on Windows. It utilizes both native System.IO file and directory management along with COM references to the deprecated cleanmgr tool.

This document provides a guide on creating the Soji disk cleanup Task in CW RMM. The task is versatile and can serve as an Autofix/Automation Task alongside `Monitors` or `Intelligent Alerts`. When employed as an Autofix, the task executes the tool with the `--All` argument.

Please reference [Soji](/docs/c762e174-5262-44b9-a3e9-97ca9ff94afc) for argument usage.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/ninja-one-automations-common-screenshots/samplerun1.png)

## Dependencies

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |

## Automation Setup/Import

### Step 1

Navigate to `Administration` > `Library` > `Automation`  
![Step1](../../../static/img/ninja-one-automations-common-screenshots/step1.png)

### Step 2

Locate the `Add` button on the right-hand side of the screen, click on it and click the `New Script` button.  
![Step2](../../../static/img/ninja-one-automations-common-screenshots/step2.png)

The scripting window will open.  
![ScriptingScreen](../../../static/img/ninja-one-automations-common-screenshots/scriptingscreen.png)

## Script Variables

Click the `Add` button next to `Script Variables`.  
![AddVariableButton](../../../static/img/ninja-one-automations-common-screenshots/addvariablebutton.png)

## Saving the Automation

Click the Save button in the top-right corner of the screen to save your automation.  
![SaveButton](../../../static/img/ninja-one-automations-common-screenshots/savebutton.png)

You will be prompted to enter your MFA code. Provide the code and press the Continue button to finalize the process.  
![MFA](../../../static/img/ninja-one-automations-common-screenshots/mfa.png)

## Completed Automation

## Output

- Activity Details  
- Custom Field
