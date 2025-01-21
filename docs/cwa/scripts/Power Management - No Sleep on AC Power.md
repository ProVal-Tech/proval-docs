---
id: '150f9b38-2ff8-457d-9293-943a2d038d04'
title: 'Power Management - No Sleep on AC Power'
title_meta: 'Power Management - No Sleep on AC Power'
keywords: ['sleep', 'powercfg', 'never', 'exe', 'ac']
description: 'This document outlines a script that prevents a computer from sleeping while plugged in, detailing its dependencies, variables, and the process involved in executing the script. It includes a sample run and highlights the time saved by automation.'
tags: ['performance', 'software', 'windows']
draft: false
unlisted: false
---

## Summary

This script sets the computer to not sleep when plugged in.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Power-Management---No-Sleep-on-AC-Power/image_1.png)

## Dependencies

[Download NeverSleepAC.exe](https://file.provaltech.com/repo/app/NeverSleepAC.exe)

## Variables

| **Variable Name** | **Description**                                                                                       |
|--------------------|-------------------------------------------------------------------------------------------------------|
| ProjectName        | This represents the name of the executable, which in this case will be NeverSleepAC.               |
| BaseURL            | This represents the base URL, which will be [https://file.provaltech.com/repo](https://file.provaltech.com/repo) in this case. |
| WorkingDirectory    | C:/ProgramData/provaltech/app/@ProjectName@                                                          |
| EXEURL             | @BaseURL@/app/@ProjectName@.exe                                                                       |
| EXEPath            | @WorkingDirectory@/@ProjectName@.exe                                                                   |
| EXETempPath        | @WorkingDirectory@/@ProjectName@-temp.exe                                                              |
| EXELog             | @WorkingDirectory@/@ProjectName@-log.txt                                                               |
| EXEErrorLog        | @WorkingDirectory@/@ProjectName@-errors.txt                                                            |
| LogContent         | @EXELog@                                                                                               |

## Process

This script will download the NeverSleepAC.exe from [NeverSleepAC.exe](https://file.provaltech.com/repo/app/NeverSleepAC.exe). The script is a .NET wrapper that retrieves the three GUIDs required for powercfg: active scheme, subgroup, and setting. It gets the currently loaded power plan, which allows it to adjust user settings from the system account. The script modifies the values for only the AC settings (plugged in) of that current plan:

- Sleep after = Never
- Allow hybrid sleep = Off
- Hibernate after = Never
- Lid Close Action = Nothing (which is only present on mobile hardware).

The script will download the EXE file and execute it.

## Output

- Script log



