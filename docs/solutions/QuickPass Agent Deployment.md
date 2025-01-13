---
id: 'cwa-install-quickpass-agent'
title: 'Installing the QuickPass Agent on Windows Machines'
title_meta: 'Installing the QuickPass Agent on Windows Machines'
keywords: ['quickpass', 'agent', 'windows', 'install', 'monitor']
description: 'This document outlines the procedure to install the QuickPass agent on Windows machines where it is not already installed. It includes associated content, implementation steps, and configuration details necessary for successful deployment.'
tags: ['installation', 'monitoring', 'configuration', 'windows', 'software']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to install the QuickPass agent on Windows machines where it's not already installed.

## Associated Content

| Content                                                                                               | Type           | Function                                                                                                                   |
|-------------------------------------------------------------------------------------------------------|----------------|---------------------------------------------------------------------------------------------------------------------------|
| [SWM - Software Install - Script - Deploy QuickPass Agent](https://proval.itglue.com/DOC-5078775-14875677) | Script         | This script installs QuickPass Agent on Windows machines where it's not already installed.                               |
| [SWM - Software Install - Internal Monitor - Agents Missing QuickPass](https://proval.itglue.com/DOC-7339781-14875676) | Internal Monitor | This is a remote PowerShell monitor that detects whether the AD Recycle Bin is enabled or disabled on the Windows Infrastructure master. |
| `△ Custom - Execute Script - Deploy QuickPass Agent`                                               | Alert Template | Executes the script [SWM - Software Install - Script - Deploy QuickPass Agent](https://proval.itglue.com/DOC-5078775-14875677) against the computers detected in the monitor set [SWM - Software Install - Internal Monitor - Agents Missing QuickPass](https://proval.itglue.com/DOC-7339781-14875676) |

## Implementation

1. Import the following script using the ProSync plugin:
   - [SWM - Software Install - Script - Deploy QuickPass Agent](https://proval.itglue.com/DOC-5078775-14875677)

2. Import the following monitor using the ProSync plugin:
   - [SWM - Software Install - Internal Monitor - Agents Missing QuickPass](https://proval.itglue.com/DOC-7339781-14875676)

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - Deploy QuickPass Agent`

4. Reload the System Cache  
   ![System Cache](..\..\static\img\QuickPass-Agent-Deployment\image_1.png)

5. Configure the solution as follows:
   - Navigate to Automation → Scripts within the CWA Control Center.
     - Debug Script [SWM - Software Install - Script - Deploy QuickPass Agent](https://proval.itglue.com/DOC-5078775-14875677) on any online machine with User Parameter 'Set_environment' = 1
     - It will create the System property required for the script.
   - Navigate to Automation → Monitors within the CWA Control Center.
     - [SWM - Software Install - Internal Monitor - Agents Missing QuickPass](https://proval.itglue.com/DOC-7339781-14875676)
       - Configure with the alert template: `△ Custom - Execute Script - Deploy QuickPass Agent`
       - Right-click and Run Now to start the monitor.
   - Below EDFs and System Property should be populated by the client to make the solution work. For more details on these follow the document [SWM - Software Install - Script - Deploy QuickPass Agent](https://proval.itglue.com/DOC-5078775-14875677)
     - Client EDF - QuicPass
     - Client EDF - QuickPass Agent ID
     - System Property - QuickpassInstallToken


