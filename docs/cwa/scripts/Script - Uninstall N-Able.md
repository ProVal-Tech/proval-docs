---
id: '3918a9ca-7721-40d6-9b8b-97a5737d6af6'
title: 'Uninstalling N-Able (Windows Agent) Application'
title_meta: 'Uninstalling N-Able (Windows Agent) Application'
keywords: ['uninstallation', 'n-able', 'windows', 'agent', 'script']
description: 'This document provides a comprehensive guide on uninstalling the N-Able (Windows Agent) application, including the script to perform the uninstallation and clean up all traces of the application from the system.'
tags: ['cleanup', 'software', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Summary

This script performs the uninstallation of the N-Able (Windows Agent) application and deletes all its traces.

## Sample Run

![Sample Run](../../../static/img/Script---Uninstall-N-Able/image_1.png)

## Dependencies

[Agnostic - Uninstall N-Able](<../../unsorted/Agnostic - Uninstall N-Able.md>)

## Variables

| Name             | Description                                                                                                                                                      |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProjectName      | This contains the agnostic PowerShell script name and sets it as a project, with the working directory at `C:/ProgramData/_Automation/Script/@ProjectName@`. |
| WorkingDirectory  | This is the directory where the agnostic script downloads and its logs are stored. The directory path is `C:/ProgramData/_Automation/Script/@ProjectName@`.   |
| PS1Log           | This stores the PowerShell informational logs for validation and saves them in the `@WorkingDirectory@` folder with the name: `@ProjectName@-log.txt`.        |
| PS1ErrorLog      | This contains the PowerShell error logs for validation and saves them in the `@WorkingDirectory@` folder with the name: `@ProjectName@-error.txt`.           |
| ErrorLog         | This contains the content of the error log file, i.e., `@ProjectName@-error.txt`.                                                                             |

## Output

- Script log
- Local file on the computer

