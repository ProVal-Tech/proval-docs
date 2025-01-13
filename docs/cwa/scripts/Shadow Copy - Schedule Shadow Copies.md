---
id: 'cwa-enable-shadow-copies'
title: 'Enable Shadow Copies via PowerShell'
title_meta: 'Enable Shadow Copies via PowerShell'
keywords: ['shadow', 'copy', 'task', 'scheduler', 'windows', 'backup']
description: 'This document details a PowerShell script that enables shadow copies on the system drive by creating a scheduled task through Task Scheduler. It provides configuration parameters and outlines the process for setting up the script to automate shadow copy tasks at specified times.'
tags: ['backup', 'windows', 'configuration', 'scheduling', 'security']
draft: false
unlisted: false
---
## Summary

The script uses PowerShell to enable shadow copies (like the older solution "previous versions" feature in Windows 7). It will create a Shadow Copy task for the System Drive via Task Scheduler at the scheduled times in the Global Variables.

Time Saved by Automation: 20 Minutes

## Sample Run

![Sample Run](../../../static/img/Shadow-Copy---Schedule-Shadow-Copies/image_1.png)

## Dependencies

None

## Variables

`@ShadowCopies@` - The output from the PowerShell used to build the Shadow Copy configuration.

#### Global Parameters

| Name         | Example  | Required | Description                                                                                         |
|--------------|----------|----------|-----------------------------------------------------------------------------------------------------|
| AM-Time      | 6:00AM   | True     | This is the scheduled AM instance of the Shadow Copy (6:00AM is the default value)                |
| PM-Time      | 6:00PM   | True     | This is the scheduled PM instance of the Shadow Copy (6:00PM is the default value)                |
| Task-Prefix  | MSP-     | True     | The prefix added to the name of the scheduled task (MSP- is the default value)                    |

## Process

Once the global parameters are configured to the desired values, the script will use the values to run a PowerShell script that allocates space on the system drive for the Shadow Copies. It then proceeds to set up scheduled tasks for an AM and a PM Shadow Copy. The script will verify that there were no failures in the PowerShell script and will exit successfully as long as there are no errors returned from the PowerShell script. If the PowerShell does not run successfully, the Automate script will exit with an error and a log message.

## Output

Script log




