---
id: '611414aa-ae0b-46f3-92e4-4a99a42e6719'
slug: /611414aa-ae0b-46f3-92e4-4a99a42e6719
title: 'Visual Studio Auto Update'
title_meta: 'Visual Studio Auto Update'
keywords: ['visualstudio', 'updates', 'script', 'automation', 'enterprise', 'community']
description: 'This document details a script designed to perform auto updates for various versions of Visual Studio, including 2017, 2019, and 2022 editions. It outlines compatible applications, dependencies, variables used within the script, and provides a sample run for reference.'
tags: ['installation', 'logging', 'windows']
draft: false
unlisted: false
---

## Summary

This script performs auto updates for Visual Studio.  
It is compatible with the following applications:  
- VS 2022 Enterprise  
- VS 2022 Community  
- VS 2019 Enterprise  
- VS 2019 Community  
- VS 2017 Enterprise  
- VS 2017 Community  

## Sample Run

![Sample Run](../../../static/img/Visual-Studio-Auto-Update/image_1.png)  

## Dependencies

[Agnostic - Visual Studio Auto Update](/docs/ef41c491-27c6-41d4-a478-eb66ca809399)  

## Variables

Document the various variables in the script. Delete any section that is not relevant to your script.

| Name               | Description                                                                                                                                                          |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| @ProjectName@      | This contains the agnostic PowerShell script name and sets that as a project and working directory to `C:/ProgramData/_Automation/Script/@ProjectName@`.         |
| @WorkingDirectory@  | This is a directory where the agnostic script downloads and its logging is stored. The directory path is `C:/ProgramData/_Automation/Script/@ProjectName@`.       |
| @PS1Log@           | This stores the PowerShell informational logs for validation and saves them in the @WorkingDirectory@ folder with the name: `@ProjectName@-log.txt`.                |
| @PS1ErrorLog@      | This contains the PowerShell error logs for validation and saves them in the @WorkingDirectory@ folder with the name: `@ProjectName@-error.txt`.                   |
| @ErrorLog@         | This contains the content of the error log file, i.e., `@ProjectName@-error.txt`.                                                                                 |

## Output

- Script log


