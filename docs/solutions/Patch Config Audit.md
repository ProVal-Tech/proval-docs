---
id: '6d50548e-014d-4bca-aab6-2941f36045e2'
slug: /6d50548e-014d-4bca-aab6-2941f36045e2
title: 'Patch Config Audit'
title_meta: 'Patch Config Audit'
keywords: ['patch', 'configuration', 'windows', 'audit', 'monitor']
description: 'This document details the patch configuration for Windows computers, showcasing how to use the WUA Settings Validation script to alter configuration information. It includes upgrade notices, implementation steps, and associated content for auditing and automation.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to showcase the patch configuration of a Windows computer. It exhibits the configuration information altered by the [WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>) script.

## Upgrade Notice: 29-Oct-2024

The solution has been updated to indicate whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.

Reference: [https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::TargetReleaseVersion](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::TargetReleaseVersion)

Execute the [Get Patch Config](<../cwa/scripts/Get Patch Config.md>) script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will add the newly introduced column `upgradeRestricted` to the [pvl_patch_config](<../cwa/tables/pvl_patch_config.md>) table, which is necessary for the solution.

![Image](../../static/img/Patch-Config-Audit/image_1.png)

## Associated Content

#### Auditing

| Content                                                                              | Type           | Function            |
|--------------------------------------------------------------------------------------|----------------|---------------------|
| [Get Patch Config](<../cwa/scripts/Get Patch Config.md>)                            | Script         | Gathers Data        |
| [pvl_patch_config](<../cwa/tables/pvl_patch_config.md>)                            | Custom Table   | Stores Data         |
| [Patch Config Audit](<../cwa/dataviews/Patch Config Audit.md>)               | Dataview       | Displays Data       |
| [Execute Script - Get Patch Config](<../cwa/monitors/Execute Script - Get Patch Config.md>) | Internal Monitor| Detects Windows Machines |
| △ Custom - Execute Script - Get Patch Config                                          | Alert Template  | Executes the Script  |

#### Automation

| Content                                                                                              | Type           | Function                                                        |
|------------------------------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------|
| [Patch Manager - WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>) | Script         | Validate and set the appropriate values for the patching registries. |
| [Internal Monitor - Patch Config Mismatch](<../cwa/monitors/Patch Config Mismatch.md>)             | Internal Monitor| Detect computers with mismatched configurations.                |
| △ Custom - Patch Config Mismatch                                                                      | Alert Template  | Executes [Patch Manager - WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>) script. |

## Implementation

### 1.
Import the following auditing content using the ProSync Plugin:
- [Script - Get Patch Config](<../cwa/scripts/Get Patch Config.md>)
- [Dataview - Patch Config Audit](<../cwa/dataviews/Patch Config Audit.md>)
- [Internal Monitor - Execute Script - Get Patch Config](<../cwa/monitors/Execute Script - Get Patch Config.md>)
- Alert Template - △ Custom - Execute Script - Get Patch Config

### 2.
Import the following automation content using the ProSync Plugin:
- [Script - Patch Manager - WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>)
- [Internal Monitor - Patch Config Mismatch](<../cwa/monitors/Patch Config Mismatch.md>)
- Alert Template: △ Custom - Patch Config Mismatch

### 3.
Reload the system cache:  
![Image](../../static/img/Patch-Config-Audit/image_2.png)

### 4.
Execute the [Get Patch Config](<../cwa/scripts/Get Patch Config.md>) script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will create the [pvl_patch_config](<../cwa/tables/pvl_patch_config.md>) table, which is necessary for the solution.  
![Image](../../static/img/Patch-Config-Audit/image_3.png)

### 5.
Configure the auditing solution as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and set up the following:
  - [Internal Monitor - Execute Script - Get Patch Config](<../cwa/monitors/Execute Script - Get Patch Config.md>)  
    - Set up with the `△ Custom - Execute Script - Get Patch Config` alert template
    - Right-click and Run Now to start the monitor

#### Only if Requested

### 6.
Configure the automation as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and set up the following:
  - [Internal Monitor - Patch Config Mismatch](<../cwa/monitors/Patch Config Mismatch.md>)  
    - Set up with the `△ Custom - Patch Config Mismatch` alert template
    - Right-click and Run Now to start the monitor

## FAQ

**Q:** Can this solution be used in environments without configuring the [WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>) script?  
**A:** The auditing section of the solution is independent of the [WUA Settings Validation](<../cwa/scripts/Patch Manager - WUA Settings Validation.md>) script.



