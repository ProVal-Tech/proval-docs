---
id: '6b28c2d7-01b5-4d5d-aefa-0df7fa1b5718'
title: 'Disable Windows Defender Credential Guard'
title_meta: 'Disable Windows Defender Credential Guard'
keywords: ['registry', 'windows', 'defender', 'credential', 'guard', 'reboot']
description: 'This document provides a script to disable Windows Defender Credential Guard by modifying the registry settings as outlined in a referenced article. It includes a sample run, dependencies, and variable descriptions, ensuring a comprehensive understanding of the script operation and its output.'
tags: ['reboot', 'security', 'windows']
draft: true
unlisted: false
---
## Summary

This script will set the registry based on the below article:  
[https://windowsreport.com/disable-windows-defender-credential-guard-windows-11/](https://windowsreport.com/disable-windows-defender-credential-guard-windows-11/).  
Once the registry is set, it will set the machine to reboot using the prompter solution.

## Sample Run

![Sample Run](../../static/img/Disable-Virtualization-based-security/image_1.png)

## Dependencies

[EPM - Windows Configuration - Solution - User Prompt for Reboot](<../solutions/User Prompt for Reboot.md>)

## Variables

| Name  | Description                                    |
|-------|------------------------------------------------|
| psout | It contains the status of the registry set or not |

## Output

- Script log














