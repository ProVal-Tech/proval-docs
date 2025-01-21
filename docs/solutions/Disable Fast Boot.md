---
id: '1c1eacb7-dd9c-410e-b68a-604622260d6b'
title: 'Disable Fast Boot for Windows Workstations'
title_meta: 'Disable Fast Boot for Windows Workstations'
keywords: ['disable', 'fastboot', 'windows', 'workstations', 'registry']
description: 'This document outlines the solution to disable the Fast Boot feature on Windows workstations, including the necessary custom fields, device group creation, and task implementation required to ensure the feature is turned off.'
tags: ['performance', 'recovery', 'setup', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to outline the solution to disable the Fast Boot feature for Windows workstations.

## Associated Content

### Custom Fields

| Content                                                                 | Type  | Level   | Function                                                                                                           |
|-------------------------------------------------------------------------|-------|---------|--------------------------------------------------------------------------------------------------------------------|
| [Disable_FastBoot](<../cwrmm/custom-fields/CW RMM - Custom Field - Company - Disable_FastBoot.md>)    | Flag  | Company | Check this box to enable the solution to disable Fast Boot on the client's Windows workstations.                  |
| [Disable_Fastboot_Exclusion](<../cwrmm/custom-fields/Site - Disable_Fastboot_Exclusion.md>) | Flag  | Site    | Check this box to exclude the site from the solution that disables Fast Boot.                                    |
| [Disable_Fastboot_Exclusion](<../cwrmm/custom-fields/Endpoint - Disable_Fastboot_Exclusion.md>) | Flag  | Endpoint | Check this box to exclude the computer from the solution that disables Fast Boot.                                 |
| [FastBoot_Disabled](<../cwrmm/custom-fields/Endpoint - FastBoot_Disabled.md>)   | Flag  | Endpoint | Indicates that Fast Boot has been disabled on the computer.                                                       |

### Device Group

| Content                                                                | Type     | Function                                                                                                                |
|------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------|
| [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416)   | Dynamic  | This group contains the computers where the solution to disable Fast Boot is enabled through the Custom Fields.       |

### Task

| Content                                                                | Type           | Function                                                                                                                |
|------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------|
| [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020411)   | Script Editor  | The script will attempt to modify the registry keys to disable Fast Boot on the Windows workstations if it is not already disabled. |

## Implementation

1. Create the following custom fields:  
   - [Disable_FastBoot](<../cwrmm/custom-fields/CW RMM - Custom Field - Company - Disable_FastBoot.md>)  
   - [Disable_Fastboot_Exclusion](<../cwrmm/custom-fields/Site - Disable_Fastboot_Exclusion.md>)  
   - [Disable_Fastboot_Exclusion](<../cwrmm/custom-fields/Endpoint - Disable_Fastboot_Exclusion.md>)  
   - [FastBoot_Disabled](<../cwrmm/custom-fields/Endpoint - FastBoot_Disabled.md>)  

2. Create the Device Group:  
   - [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416)  

3. Create the Task and deploy it against the device group:  
   - [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020411)  

