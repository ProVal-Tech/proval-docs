---
id: 'f0bb3ffc-60cb-484c-b7fa-27a386ac664c'
slug: /f0bb3ffc-60cb-484c-b7fa-27a386ac664c
title: 'Windows 11 Compatibility Audit'
title_meta: 'Windows 11 Compatibility Audit'
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
| [Windows - Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c) | Script        | Performs Audit                    |
| [plugin_proval_windows11_readiness](/docs/74cca89e-effd-4af7-a73a-53a30b91c8a7)        | Custom Table  | Stores Data                       |
| [Windows 11 Upgrade Compatibility](/docs/36ca4c95-af9e-443b-8fe5-33e910107650)         | Dataview      | Displays Data                     |
| [Execute Script - Windows - Check Windows 11 Compatibility](/docs/8aa2542c-c61f-43b8-a7ec-ec33558319e4) | Internal Monitor | Detects the machines to execute the script |
| △ Custom - Execute Script - Windows 11 Compatibility Check                                   | Alert Template | Executes the script               |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Windows - Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c)
   - [Monitor - Execute Script - Windows - Check Windows 11 Compatibility](/docs/8aa2542c-c61f-43b8-a7ec-ec33558319e4)
   - [Dataview - Windows 11 Upgrade Compatibility](/docs/36ca4c95-af9e-443b-8fe5-33e910107650)
   - Alert Template - △ Custom - Execute Script - Windows 11 Compatibility Check

2. Reload the system cache:  
   ![System Cache Reload](../../static/img/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c/image_1.webp)

3. Execute the [Windows - Check Windows 11 Compatibility](/docs/318a9cfd-251b-4b47-8d18-aabc3af6b41c) script against an online Windows 10 computer to create the [plugin_proval_windows11_readiness](/docs/74cca89e-effd-4af7-a73a-53a30b91c8a7) custom table.

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Monitor - Execute Script - Windows - Check Windows 11 Compatibility](/docs/8aa2542c-c61f-43b8-a7ec-ec33558319e4)  
       - △ Custom - Execute Script - Windows 11 Compatibility Check  
       - Right-click and Run Now to start the monitor