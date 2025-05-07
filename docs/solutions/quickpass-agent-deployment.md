---
id: '65d0dbb6-29c1-4242-841c-1da9b92edab6'
slug: /65d0dbb6-29c1-4242-841c-1da9b92edab6
title: 'QuickPass Agent Deployment'
title_meta: 'QuickPass Agent Deployment'
keywords: ['quickpass', 'agent', 'windows', 'install', 'monitor']
description: 'This document outlines the procedure to install the QuickPass agent on Windows machines where it is not already installed. It includes associated content, implementation steps, and configuration details necessary for successful deployment.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to install the QuickPass agent on Windows machines where it is not already installed.

## Associated Content

| Content                                                                                                | Type             | Function                                                                                                                                                                                              |
| ------------------------------------------------------------------------------------------------------ | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [SWM - Software Install - Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) | Script           | This script installs the QuickPass Agent on Windows machines where it is not already installed.                                                                                                       |
| SWM - Software Install - Internal Monitor - Agents Missing QuickPass                                   | Internal Monitor | This is a remote PowerShell monitor that detects whether the AD Recycle Bin is enabled or disabled on the Windows Infrastructure master.                                                              |
| `△ Custom - Execute Script - Deploy QuickPass Agent`                                                   | Alert Template   | Executes the script [SWM - Software Install - Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) against the computers detected in the monitor set Agents Missing QuickPass |

## Implementation

1. Import the following script using the ProSync plugin:
   - [SWM - Software Install - Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198)

2. Import the following monitor using the ProSync plugin:
   - SWM - Software Install - Internal Monitor - Agents Missing QuickPass

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - Deploy QuickPass Agent`

4. Reload the System Cache  
   ![System Cache](../../static/img/docs/65d0dbb6-29c1-4242-841c-1da9b92edab6/image_1.png)

5. Configure the solution as follows:
   - Navigate to Automation → Scripts within the CWA Control Center.
     - Debug Script [SWM - Software Install - Script - Deploy QuickPass Agent](/docs/ab838395-dc94-4ceb-986e-99d00b005198) on any online machine with User Parameter 'Set_environment' = 1.
     - This will create the System property required for the script.
   - Navigate to Automation → Monitors within the CWA Control Center.
     - SWM - Software Install - Internal Monitor - Agents Missing QuickPass
       - Configure with the alert template: `△ Custom - Execute Script - Deploy QuickPass Agent`.
       - Right-click and Run Now to start the monitor.
   - The following EDFs and System Property should be populated by the client to ensure the solution works. For more details, refer to the document [SWM - Software Install - Script - Deploy QuickPass

