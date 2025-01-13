---
id: 'ps-check-system-restore'
title: 'Check System Restore Status and Create Restore Points'
title_meta: 'Check System Restore Status and Create Restore Points'
keywords: ['system', 'restore', 'storage', 'point', 'ticket']
description: 'This script checks if system restore is enabled on the system drive and enables it if not. It sets the maximum storage space for system restore to 5% and verifies if a restore point has been created within the last 30 days. If no restore point exists, it creates one and can generate a ticket if the creation fails, based on the global parameters.'
tags: ['backup', 'windows', 'security', 'configuration', 'performance']
draft: true
unlisted: true
---
## Summary

This script will check if system restore is enabled on the system drive or not, if not it will enable system restore and set maximum storage space used by system restore to 5%.

Later checks if a system has a restore point created within 30 days (by default set to 30 in global parameters) And if not then it will create a manual restore point. The script will also create a ticket when it fails to create a manual restore point, if the global parameter "Createticket" is set to 1 (By default ticket creation is disabled).

Time Saved by Automation: 10 Minutes

## Sample Run

![Sample Run](../../static/img/Restore-Point---Enable-and-Create-Restore-Point/image_1.png)

## Dependencies

- Windows Workstation OS

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

#### Global Parameters

| Name          | Example | Required | Description                   |
|---------------|---------|----------|-------------------------------|
| daystocheck   | 30      | True     | What the parameter represents  |

#### User Parameters

| Name                           | Example                        | Required     | Description                   |
|--------------------------------|--------------------------------|--------------|-------------------------------|
| The name of the parameter      | An example value of the parameter | True or False | What the parameter represents  |

#### System Properties

| Name                           | Example                        | Required     | Description                   |
|--------------------------------|--------------------------------|--------------|-------------------------------|
| The name of the property       | An example value of the property | True or False | What the property represents   |

#### Script States

| Name                           | Example                        | Description                   |
|--------------------------------|--------------------------------|-------------------------------|
| The name of the Script State   | An example of the Script State | What the script state represents |

## Process

Describe the steps the script performs to accomplish the desired task. Note that if this script is just a front-end for a piece of Agnostic Content, then you can insert a link to the documentation for that content here instead.

## Output

The location and method by which this script returns data.

Ex:

- Script log
- Script state
- Local file on computer
- Dataview
- etc.




