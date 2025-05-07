---
id: '6b28c2d7-01b5-4d5d-aefa-0df7fa1b5718'
slug: /6b28c2d7-01b5-4d5d-aefa-0df7fa1b5718
title: 'Disable Virtualization based security'
title_meta: 'Disable Virtualization based security'
keywords: ['registry', 'windows', 'defender', 'credential', 'guard', 'reboot']
description: 'This document provides a script to disable Windows Defender Credential Guard by modifying the registry settings as outlined in a referenced article. It includes a sample run, dependencies, and variable descriptions, ensuring a comprehensive understanding of the script operation and its output.'
tags: ['reboot', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

This script will set the registry based on the following article:  
[Disable Windows Defender Credential Guard on Windows 11](https://windowsreport.com/disable-windows-defender-credential-guard-windows-11/).  
Once the registry is set, it will prompt the machine to reboot.

## Sample Run

![Sample Run](../../../static/img/docs/6b28c2d7-01b5-4d5d-aefa-0df7fa1b5718/image_1.png)

## Dependencies

[EPM - Windows Configuration - Solution - User Prompt for Reboot](/docs/32d2254e-c2a4-4f2d-a029-b74f6d3c8b1a)

## Variables

| Name  | Description                                    |
|-------|------------------------------------------------|
| psout | Contains the status of whether the registry was set or not |

## Output

- Script log

