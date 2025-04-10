---
id: '1c1eacb7-dd9c-410e-b68a-604622260d6b'
slug: /1c1eacb7-dd9c-410e-b68a-604622260d6b
title: 'Disable Fast Boot'
title_meta: 'Disable Fast Boot'
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

| Content                                                                  | Type | Level    | Function                                                                                         |
| ------------------------------------------------------------------------ | ---- | -------- | ------------------------------------------------------------------------------------------------ |
| [Disable_FastBoot](/docs/9c1d0f0a-7ae4-46bd-a9a7-ae15df2ca633)           | Flag | Company  | Check this box to enable the solution to disable Fast Boot on the client's Windows workstations. |
| [Disable_Fastboot_Exclusion](/docs/693eeb66-9fb2-4653-8cf3-e23fb53c0f56) | Flag | Site     | Check this box to exclude the site from the solution that disables Fast Boot.                    |
| [Disable_Fastboot_Exclusion](/docs/b17237cc-d3cf-42a9-84fe-eda8d00bdd19) | Flag | Endpoint | Check this box to exclude the computer from the solution that disables Fast Boot.                |
| [FastBoot_Disabled](/docs/3c87c303-e892-4f6b-889f-acde66928978)          | Flag | Endpoint | Indicates that Fast Boot has been disabled on the computer.                                      |

### Device Group

| Content                                                        | Type    | Function                                                                                                        |
| -------------------------------------------------------------- | ------- | --------------------------------------------------------------------------------------------------------------- |
| [Disable FastBoot](/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a) | Dynamic | This group contains the computers where the solution to disable Fast Boot is enabled through the Custom Fields. |

### Task

| Content                                                        | Type          | Function                                                                                                                            |
| -------------------------------------------------------------- | ------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| [Disable FastBoot](/docs/f52aada4-6207-4766-9b7c-24d022812e3c) | Script Editor | The script will attempt to modify the registry keys to disable Fast Boot on the Windows workstations if it is not already disabled. |

## Implementation

1. Create the following custom fields:  
   - [Disable_FastBoot](/docs/9c1d0f0a-7ae4-46bd-a9a7-ae15df2ca633)  
   - [Disable_Fastboot_Exclusion](/docs/693eeb66-9fb2-4653-8cf3-e23fb53c0f56)  
   - [Disable_Fastboot_Exclusion](/docs/b17237cc-d3cf-42a9-84fe-eda8d00bdd19)  
   - [FastBoot_Disabled](/docs/3c87c303-e892-4f6b-889f-acde66928978)  

2. Create the Device Group:  
   - [Disable FastBoot](/docs/df5b7a85-683f-4fd6-9a24-4fc836ccfd8a)  

3. Create the Task and deploy it against the device group:  
   - [Disable FastBoot](/docs/f52aada4-6207-4766-9b7c-24d022812e3c)  



