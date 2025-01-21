---
id: 'f0bb3ffc-60cb-484c-b7fa-27a386ac664c'
title: 'Windows 11 Compatibility Check for Windows 10 Machines'
title_meta: 'Windows 11 Compatibility Check for Windows 10 Machines'
keywords: ['windows', 'compatibility', 'installation', 'upgrade', 'monitor']
description: 'This document outlines a solution to assess the compatibility of Windows 10 machines for Windows 11 installation. It also identifies Windows 11 computers that do not meet Microsoft’s requirements, detailing the implementation steps and associated content necessary for effective execution.'
tags: ['installation', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution aims to determine the compatibility of Windows 10 machines for the Windows 11 installation.

Additionally, it can be used to detect Windows 11 computers that do not meet Microsoft's requirements for Windows 11. While Windows 11 can be forcefully installed on incompatible computers, the feature pack cannot be updated for such machines using the Windows Update Assistant. The dataview in the solution can be filtered for Windows 11 to identify these machines.

## Associated Content

| Content                                                                                     | Type          | Function                          |
|---------------------------------------------------------------------------------------------|---------------|-----------------------------------|
| [Windows - Check Windows 11 Compatibility](<../cwa/scripts/Windows - Check Windows 11 Compatibility.md>) | Script        | Performs Audit                    |
| [plugin_proval_windows11_readiness](<../cwa/tables/plugin_proval_windows11_readiness.md>)        | Custom Table  | Stores Data                       |
| [Windows 11 Upgrade Compatibility](<../cwa/dataviews/Windows 11 Upgrade Compatibility.md>)         | Dataview      | Displays Data                     |
| [Execute Script - Windows - Check Windows 11 Compatibility](<../cwa/monitors/Execute Script - Windows - Check Windows 11 Compatibility.md>) | Internal Monitor | Detects the machines to execute the script |
| △ Custom - Execute Script - Windows 11 Compatibility Check                                   | Alert Template | Executes the script               |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Windows - Check Windows 11 Compatibility](<../cwa/scripts/Windows - Check Windows 11 Compatibility.md>)
   - [Monitor - Execute Script - Windows - Check Windows 11 Compatibility](<../cwa/monitors/Execute Script - Windows - Check Windows 11 Compatibility.md>)
   - [Dataview - Windows 11 Upgrade Compatibility](<../cwa/dataviews/Windows 11 Upgrade Compatibility.md>)
   - Alert Template - △ Custom - Execute Script - Windows 11 Compatibility Check

2. Reload the system cache:  
   ![System Cache Reload](../../static/img/Windows-11-Compatibility-Audit/image_1.png)

3. Execute the [Windows - Check Windows 11 Compatibility](<../cwa/scripts/Windows - Check Windows 11 Compatibility.md>) script against an online Windows 10 computer to create the [plugin_proval_windows11_readiness](<../cwa/tables/plugin_proval_windows11_readiness.md>) custom table.

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Monitor - Execute Script - Windows - Check Windows 11 Compatibility](<../cwa/monitors/Execute Script - Windows - Check Windows 11 Compatibility.md>)  
       - △ Custom - Execute Script - Windows 11 Compatibility Check  
       - Right-click and Run Now to start the monitor

