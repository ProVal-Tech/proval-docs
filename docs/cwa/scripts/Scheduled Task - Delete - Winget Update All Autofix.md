---
id: '23d4e4bf-1a80-4db0-983b-99da88e8ba34'
slug: /23d4e4bf-1a80-4db0-983b-99da88e8ba34
title: 'Scheduled Task - Delete - Winget Update All Autofix'
title_meta: 'Scheduled Task - Delete - Winget Update All Autofix'
keywords: ['winget', 'tasks', 'windows', 'script', 'scheduled', 'uninstall']
description: 'This document describes a script that removes the Winget Update All [System] and Winget Update All [Logged on User] tasks from Windows 10 and 11 machines. It details the dependencies, sample run output, and the associated Computer Level EDF.'
tags: ['uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

The script removes the `Winget Update All [System]` and `Winget Update All [Logged on User]` tasks created by the [Script - Scheduled Task - Create - Winget Update All [Autofix]](<./Scheduled Task - Create - Winget Update All Autofix.md>) script from Windows 10 and 11 machines.

## Sample Run

![Sample Run](../../../static/img/Scheduled-Task---Delete---Winget-Update-All-Autofix/image_1.png)

## Dependencies

- [Script - Scheduled Task - Create - Winget Update All [Autofix]](<./Scheduled Task - Create - Winget Update All Autofix.md>)
- [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](<../monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>)

## Computer Level EDF

| Name                          | Type      | Section | Description                                           |
|-------------------------------|-----------|---------|-------------------------------------------------------|
| Winget_update_all_task_created | Check-Box | Default | The script will unmark this EDF after removing the tasks. |

## Output

- Script log
- Extra Data Field


