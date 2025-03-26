---
id: '3918a9ca-7721-40d6-9b8b-97a5737d6af6'
slug: /3918a9ca-7721-40d6-9b8b-97a5737d6af6
title: 'Script - Uninstall N-Able'
title_meta: 'Script - Uninstall N-Able'
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

[Uninstall-N-Able](/docs/a6048dd1-3c62-4607-86db-d74826c89109)

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
