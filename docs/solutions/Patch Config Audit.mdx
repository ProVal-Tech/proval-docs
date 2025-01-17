---
id: '6d50548e-014d-4bca-aab6-2941f36045e2'
title: 'Patch Configuration for Windows Computers'
title_meta: 'Patch Configuration for Windows Computers'
keywords: ['patch', 'configuration', 'windows', 'audit', 'monitor']
description: 'This document details the patch configuration for Windows computers, showcasing how to use the WUA Settings Validation script to alter configuration information. It includes upgrade notices, implementation steps, and associated content for auditing and automation.'
tags: ['windows']
draft: false
unlisted: false
---
## Purpose

The solution's purpose is to showcase the patch configuration of a Windows computer. It exhibits the configuration information altered by the [WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620) script.

## Upgrade Notice: 29-Oct-2024

The solution has been updated to indicate whether Windows upgrades or feature updates are restricted from the registry key for Windows 10 and 11.

Reference: [https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::TargetReleaseVersion](https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::TargetReleaseVersion)

Execute the [Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976) script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will add the newly introduced column `upgradeRestricted` to the [pvl_patch_config](https://proval.itglue.com/DOC-5078775-16399975) table which is necessary for the solution.

![Image](../../static/img/Patch-Config-Audit/image_1.png)

## Associated Content

#### Auditing

| Content                                                                              | Type           | Function            |
|--------------------------------------------------------------------------------------|----------------|---------------------|
| [Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976)                 | Script         | Gathers Data        |
| [pvl_patch_config](https://proval.itglue.com/DOC-5078775-16399975)                 | Custom Table   | Stores Data         |
| [Patch Config Audit](https://proval.itglue.com/DOC-5078775-16399971)               | Dataview       | Displays Data       |
| [Execute Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399979) | Internal Monitor| Detects Windows Machines |
| △ Custom - Execute Script - Get Patch Config                                          | Alert Template  | Executes the Script  |

#### Automation

| Content                                                                                              | Type           | Function                                                        |
|------------------------------------------------------------------------------------------------------|----------------|-----------------------------------------------------------------|
| [Patch Manager - WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620)            | Script         | Validate and set the appropriate values for the patching registries. |
| [Internal Monitor - Patch Config Mismatch](https://proval.itglue.com/DOC-5078775-16479351)         | Internal Monitor| Detect computers with mismatched configurations.                |
| △ Custom - Patch Config Mismatch                                                                  | Alert Template  | Executes [Patch Manager - WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620) script. |

## Implementation

### 1.
Import the following auditing content using the ProSync Plugin:
- [Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976)
- [Dataview - Patch Config Audit](https://proval.itglue.com/DOC-5078775-16399971)
- [Internal Monitor - Execute Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399979)
- Alert Template - △ Custom - Execute Script - Get Patch Config

### 2.
Import the following automation content using the ProSync Plugin:
- [Script - Patch Manager - WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620)
- [Internal Monitor - Patch Config Mismatch](https://proval.itglue.com/DOC-5078775-16479351)
- Alert Template: △ Custom - Patch Config Mismatch

### 3.
Reload the system cache:  
![Image](../../static/img/Patch-Config-Audit/image_2.png)

### 4.
Execute the [Get Patch Config](https://proval.itglue.com/DOC-5078775-16399976) script against any online Windows computer with the `Set_Environment` parameter set to `1`. This will create the [pvl_patch_config](https://proval.itglue.com/DOC-5078775-16399975) table which is necessary for the solution.  
![Image](../../static/img/Patch-Config-Audit/image_3.png)

### 5.
Configure the auditing solution as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Execute Script - Get Patch Config](https://proval.itglue.com/DOC-5078775-16399979)  
    - Setup with the `△ Custom - Execute Script - Get Patch Config` alert template
    - Right-click and Run Now to start the monitor

#### Only if Requested

### 6.
Configure the automation as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Patch Config Mismatch](https://proval.itglue.com/DOC-5078775-16479351)  
    - Setup with the `△ Custom - Patch Config Mismatch` alert template
    - Right-click and Run Now to start the monitor

## FAQ

**Q:** Can this solution be used in environments without configuring the [WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620) script?  
**A:** The auditing section of the solution is independent of the [WUA Settings Validation](https://proval.itglue.com/DOC-5078775-9135620) script.











