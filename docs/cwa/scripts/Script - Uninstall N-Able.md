---
id: 'n-able-uninstallation'
title: 'Uninstalling N-Able (Windows Agent) Application'
title_meta: 'Uninstalling N-Able (Windows Agent) Application'
keywords: ['uninstallation', 'n-able', 'windows', 'agent', 'script']
description: 'This document provides a comprehensive guide on uninstalling the N-Able (Windows Agent) application, including the script to perform the uninstallation and clean up all traces of the application from the system.'
tags: ['uninstallation', 'windows', 'software', 'cleanup', 'script']
draft: false
unlisted: false
---
## Summary

This script performs the uninstallation of the N-Able (Windows Agent) application and deletes all its traces.

## Sample Run

![Sample Run](..\..\..\static\img\Script---Uninstall-N-Able\image_1.png)

## Dependencies

[Agnostic - Uninstall N-Able](https://proval.itglue.com/DOC-5078775-17069437)

## Variables

| Name             | Description                                                                                                                                                      |
|------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ProjectName      | This contains the agnostic ps1 name and sets that as a project and working directory to C:\ProgramData\_Automation\Script\@ProjectName@.                     |
| WorkingDirectory  | This is a directory where the agnostic script download and its logging is stored. The directory path is "C:\ProgramData\_Automation\Script\@ProjectName@".   |
| PS1Log           | This stores the PowerShell informational logs for validation and stores them in the @WorkingDirectory@ folder with the name: @ProjectName@-log.txt.           |
| PS1ErrorLog      | This contains the PowerShell Error logs for the validation and stores them in the @WorkingDirectory@ folder with the name: @ProjectName@-error.txt.          |
| ErrorLog         | This contains the content of the error log file i.e. @ProjectName@-error.txt.                                                                                 |

## Output

- Script log
- Local file on the computer


