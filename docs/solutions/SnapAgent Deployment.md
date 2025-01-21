---
id: 'bd8800e7-9e78-4b98-b4f6-4fc9610a9c36'
title: 'Deploying the SnapAgent on Windows Machines'
title_meta: 'Deploying the SnapAgent on Windows Machines'
keywords: ['snapagent', 'windows', 'deployment', 'monitor', 'installation']
description: 'This document outlines the steps required to deploy the SnapAgent on Windows machines using the Agnostic SnapAgent installer. It includes associated scripts, monitors, and alert templates necessary for successful installation and monitoring of the SnapAgent.'
tags: ['installation', 'software', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution is created to deploy the SnapAgent on Windows machines using the Agnostic SnapAgent installer (ps1).

## Associated Content

| Content                                                                 | Type            | Function                                                                                                    |
|-------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------|
| [Script - BlackPoint - SnapAgent Installer](<../cwa/scripts/BlackPoint - SnapAgent Installer.md>) | Script          | This script is designed to install the SnapAgent on the machine.                                          |
| [Monitor - BlackPoint SnapAgent Deployment](<../cwa/monitors/BlackPoint SnapAgent Deployment.md>) | Internal Monitor | This monitor detects online Windows agents where the SnapAgent is not installed.                           |
| △ Custom - Execute Script - BlackPoint SnapAgent Install                | Alert Template   | This alert template schedules the script [Script - BlackPoint - SnapAgent Installer](<../cwa/scripts/BlackPoint - SnapAgent Installer.md>) on the detected agents of the monitor [Monitor - BlackPoint SnapAgent Deployment](<../cwa/monitors/BlackPoint SnapAgent Deployment.md>) for SnapAgent deployment. |

## Agnostic Content

| Content                                                                | Type          | Function                                         |
|------------------------------------------------------------------------|---------------|-------------------------------------------------|
| [Agnostic - Install-SnapAgent](<../unsorted/Agnostic - Install-SnapAgent.md>) | Agnostic Ps1 | Installs SnapAgent on Windows computers.        |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - BlackPoint - SnapAgent Installer](<../cwa/scripts/BlackPoint - SnapAgent Installer.md>)
   - [Monitor - BlackPoint SnapAgent Deployment](<../cwa/monitors/BlackPoint SnapAgent Deployment.md>)
   - **Alert Template - △ Custom - Execute Script - BlackPoint SnapAgent Install**

2. Reload the system cache:
   - ![Reload Cache](../../static/img/SnapAgent-Deployment/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation --> Monitors within the CWA Control Center and set up the following:
     - [Monitor - BlackPoint SnapAgent Deployment](<../cwa/monitors/BlackPoint SnapAgent Deployment.md>)
       - Set up with the "△ Custom - Execute Script - BlackPoint SnapAgent Install" alert template.
       - Right-click and select "Run Now" to start the monitor.

4. Whitelisting  
   Make sure to get the hashes below whitelisted for the environment where the security software is installed:  
   - 9E7043C03F84F49B34AA4C0D86687705 --> Hash of script Install-SnapAgentAI.ps1  
   - D6A7CA1C9B7A71648470B189831FA276 --> Hash of script Install-SnapAgent.ps1  

