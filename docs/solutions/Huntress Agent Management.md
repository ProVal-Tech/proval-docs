---
id: 'ec2b3583-4c06-40c2-8f2d-55f46f7aeed1'
title: 'Huntress Agent Management'
title_meta: 'Huntress Agent Management'
keywords: ['huntress', 'agent', 'deployment', 'management', 'windows', 'macos']
description: 'This document provides a comprehensive guide for deploying and managing the Huntress Agent on both Windows and macOS machines, including installation, uninstallation, and repair processes, along with associated content for effective monitoring and management.'
tags: ['deployment', 'macos', 'uninstallation', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution aims to deploy and manage the Huntress Agent on both Windows and macOS machines.

## Associated Content 

#### Deployment 

| Content                                                                 | Type            | Function                                   |
|-------------------------------------------------------------------------|-----------------|--------------------------------------------|
| [Deploy Huntress Agent [Windows, Mac]](<../cwa/scripts/Deploy Huntress Agent Windows, Mac.md>) | Script          | Install Huntress Agent.                   |
| [Deploy Huntress Agent](<../cwa/monitors/Deploy Huntress Agent.md>) | Internal Monitor | Detects the computers missing Huntress Agent. |
| △ Custom - Deploy Huntress Agent                                         | Alert Template   | Execute the script against the computer detected by the internal monitor. |

#### Management (Optional) 

| Content                                                                  | Type   | Function                                   |
|--------------------------------------------------------------------------|--------|--------------------------------------------|
| [Uninstall Huntress Agent [Windows, Mac]](<../cwa/scripts/Uninstall Huntress Agent Windows, Mac.md>) | Script | Uninstall Huntress Agent.                 |
| [Reinstall Huntress Agent [Windows]](<../cwa/scripts/Reinstall Huntress Agent Windows.md>) | Script | Reinstall Huntress Agent.                 |
| [Repair Huntress Agent [Windows]](<../cwa/scripts/Repair Huntress Agent Windows.md>) | Script | Repair Huntress Agent.                    |
| [Re-Register Huntress Agent [Windows]](<../cwa/scripts/Re-Register Huntress Agent Windows.md>) | Script | Re-Register Huntress Agent.               |

## Implementation 

### 1.
Import the following content using the ProSync Plugin:
- [Script - Deploy Huntress Agent [Windows, Mac]](<../cwa/scripts/Deploy Huntress Agent Windows, Mac.md>) 
- [Internal Monitor - Deploy Huntress Agent](<../cwa/monitors/Deploy Huntress Agent.md>) 
- Alert Template - △ Custom - Deploy Huntress Agent

### 2.
Import the optional content using the ProSync Plugin if needed: 
- [Script - Uninstall Huntress Agent [Windows, Mac]](<../cwa/scripts/Uninstall Huntress Agent Windows, Mac.md>) 
- [Script - Reinstall Huntress Agent [Windows]](<../cwa/scripts/Reinstall Huntress Agent Windows.md>) 
- [Script - Repair Huntress Agent [Windows]](<../cwa/scripts/Repair Huntress Agent Windows.md>) 
- [Script - Re-Register Huntress Agent [Windows]](<../cwa/scripts/Re-Register Huntress Agent Windows.md>) 

### 3.
Execute the [Deploy Huntress Agent [Windows, Mac]](<../cwa/scripts/Deploy Huntress Agent Windows, Mac.md>) script against any online machine with the `Set_Environment` parameter set to `1` to create the EDFs used by the solution.  
![Image](../../static/img/Huntress-Agent-Management/image_1.png)

### 4.
Reload the system cache:  
![Image](../../static/img/Huntress-Agent-Management/image_2.png)

### 5.
Configure the solution as outlined below:
- Navigate to Automation → Monitors within the CWA Control Center and set up the following:
  - [Internal Monitor - Deploy Huntress Agent](<../cwa/monitors/Deploy Huntress Agent.md>) 
    - `Alert Template - △ Custom - Deploy Huntress Agent`
    - Right-click and Run Now to start the monitor

### 6.
Confirm with the consultant before enabling ticketing by setting a ticket category for the [Deploy Huntress Agent](<../cwa/monitors/Deploy Huntress Agent.md>) internal monitor.  
![Image](../../static/img/Huntress-Agent-Management/image_3.png)



