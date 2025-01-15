---
id: '60cf67bf-fc28-4461-a2ad-7a32b2461652'
title: 'Disable Internet Explorer on Windows'
title_meta: 'Disable Internet Explorer on Windows'
keywords: ['internet', 'explorer', 'disable', 'windows', 'script']
description: 'This document outlines a script that disables Internet Explorer on a Windows machine, detailing the process, dependencies, and variables involved in the execution. It includes information on user prompts, reboot options, and the expected outcomes of the script.'
tags: ['windows', 'configuration', 'setup', 'security', 'uninstallation']
draft: false
unlisted: false
---
## Summary

This script disables Internet Explorer from a Windows machine.

## Sample Run

![Sample Run](../../../static/img/Internet-Explorer---Disable-Global,-DV,-Autofix/image_1.png)

## Dependencies

[CWM - Automate - Internal Monitor - ProVal - Development - Internet Explorer Detected [Role]](https://proval.itglue.com/DOC-5078775-10731230)

## Variables

| Name        | Description                                                         |
|-------------|---------------------------------------------------------------------|
| STATUS      | Status Returned from the Monitor set.                               |
| IEDisabled  | Outcome of the PowerShell script executing to disable Internet Explorer |

#### Global Parameters

| Name        | Example     | Required | Description                                                                                      |
|-------------|-------------|----------|--------------------------------------------------------------------------------------------------|
| Reboot      | 0 or 1     | False    | 0 - Reboot Immediately<br>1 - No Reboot                                                         |
| PromptUser  | 0, 1 or 2  | True     | 0 - Never Prompt<br>1 - Always Prompt when user click IE (Default)<br>2 - Once per user prompt<br> ![Prompt Screenshot](../../../static/img/Internet-Explorer---Disable-Global,-DV,-Autofix/image_2.png) |

## Process

Step 1: Executes a PowerShell script to disable Internet Explorer feature. The script is setting the user prompt registry key, so that user gets a prompt after clicking/trying to access Internet Explorer. However, that prompt might never be needed as IE will be completely vanished post reboot.  

Step 2: Verify the Outcome of the PowerShell script.  

Step 3: Mark "IE Disabled" registry Key.  

Step 4: If PowerShell script returned an error/failure, script will terminate with a log.  

Step 5: For success, it will check whether reboot is enabled or not within the Global and Parameters. It will reboot the computer if the value of Reboot parameter is set to 1. Default is 0.

## Output

- Script log
- EDF
- Dataview







