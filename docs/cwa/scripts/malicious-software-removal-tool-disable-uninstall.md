---
id: '21c23057-f81d-11ef-87d3-8600008a66b7'
slug: /21c23057-f81d-11ef-87d3-8600008a66b7
title: 'Malicious Software Removal Tool Disable/Uninstall'
title_meta: 'Malicious Software Removal Tool Disable/Uninstall'
keywords: ['MSRT', 'Scanner', 'Malicious', 'MRT', 'Software' , 'Tool']
description: 'This script will block the MSRT patches to be enrolled to the Windows and also provides feature to Uninstall it completely.'
tags: ['security']
draft: false
unlisted: false
---

## Summary
This script will block the MSRT patches to be enrolled to the Windows and also provides feature to Uninstall it completely.
It can run on demand and also be scheduled as an autofix with the monitor.

## Sample Run

![Sample Run](<../../../static/img/docs/MSRT Disable-Uninstall/image.png>)

![Sample Run](<../../../static/img/docs/MSRT Disable-Uninstall/image-1.png>)

## Dependencies



#### User Parameters

| Name                      | Example                           | Required | Description                                                                                      |
|---------------------------|-----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Set_Environment                 | 1 | False     | It is needed to run with value 1 with the script import to create all the necessary EDFs.                                        |

#### Global Parameters

| Name                      | Example                           | Required | Description                                                                                      |
|---------------------------|-----------------------------------|----------|--------------------------------------------------------------------------------------------------|
| Uninstall                 | 1 | False     | It is set to 1 by default, to ensure to uninstall the MSRT KB as well with the MSRT disabling.                                        |

## Process

This script will block the MSRT patches to be enrolled to the Windows and also provides feature to Uninstall it completely.
By default it is set to uninstall the MSRT KB, if the only requirement is to disable the MSRT update the Global parameter can be set to 0.
The script can run with the monitor to perform the auto MSRT disabling/uninstallation.

## Output

- Script log
- Local file on the computer
- EDF
- Dataview
