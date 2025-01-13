---
id: 'rmm-disable-fast-boot'
title: 'Disable Fast Boot for Windows Workstations'
title_meta: 'Disable Fast Boot for Windows Workstations'
keywords: ['disable', 'fastboot', 'windows', 'workstations', 'registry']
description: 'This document outlines the solution to disable the Fast Boot feature on Windows workstations, including the necessary custom fields, device group creation, and task implementation required to ensure the feature is turned off.'
tags: ['configuration', 'windows', 'setup', 'performance', 'recovery']
draft: false
unlisted: false
---
## Purpose

The purpose of the solution is to disable the Fast Boot feature for Windows Workstations.

## Associated Content

### Custom Field

| Content                                                                 | Type  | Level   | Function                                                                                                           |
|-------------------------------------------------------------------------|-------|---------|--------------------------------------------------------------------------------------------------------------------|
| [Disable_FastBoot](https://proval.itglue.com/DOC-5078775-16020399)    | Flag  | Company | Check this box to enable the solution to disable fastboot on the client's Windows workstations.                  |
| [Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020405) | Flag  | Site    | Check this box to exclude the site from the solution that disables fastboot.                                    |
| [Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020404) | Flag  | Endpoint | Check this box to exclude the computer from the solution that disables fastboot.                                 |
| [FastBoot_Disabled](https://proval.itglue.com/DOC-5078775-16020673)   | Flag  | Endpoint | Indicates that FastBoot has been disabled on the computer.                                                       |

### Device Group

| Content                                                                | Type     | Function                                                                                                                |
|------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------|
| [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416)   | Dynamic  | The group contains the computers where the solution to disable FastBoot is enabled through the Custom Fields.          |

### Task

| Content                                                                | Type           | Function                                                                                                                |
|------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------|
| [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020411)   | Script Editor  | The script will attempt to modify the registry keys to disable fastboot on the Windows workstations if it is not already disabled. |

## Implementation

1. Create the following custom Fields:  
   - [Disable_FastBoot](https://proval.itglue.com/DOC-5078775-16020399)  
   - [Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020405)  
   - [Disable_Fastboot_Exclusion](https://proval.itglue.com/DOC-5078775-16020404)  
   - [FastBoot_Disabled](https://proval.itglue.com/DOC-5078775-16020673)  

2. Create the Device Group:  
   - [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020416)  

3. Create the Task and deploy it against the device group:  
   - [Disable FastBoot](https://proval.itglue.com/DOC-5078775-16020411)  



