---
id: 'bd8800e7-9e78-4b98-b4f6-4fc9610a9c36'
slug: /bd8800e7-9e78-4b98-b4f6-4fc9610a9c36
title: 'SnapAgent Deployment'
title_meta: 'SnapAgent Deployment'
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
| [Script - BlackPoint - SnapAgent Installer](/docs/202e2dde-5865-4035-8410-37dc6cb92a60) | Script          | This script is designed to install the SnapAgent on the machine.                                          |
| [Monitor - BlackPoint SnapAgent Deployment](/docs/8dad86ab-7d59-43ef-b148-f4ab7df0b8f0) | Internal Monitor | This monitor detects online Windows agents where the SnapAgent is not installed.                           |
| △ Custom - Execute Script - BlackPoint SnapAgent Install                | Alert Template   | This alert template schedules the script [Script - BlackPoint - SnapAgent Installer](/docs/202e2dde-5865-4035-8410-37dc6cb92a60) on the detected agents of the monitor [Monitor - BlackPoint SnapAgent Deployment](/docs/8dad86ab-7d59-43ef-b148-f4ab7df0b8f0) for SnapAgent deployment. |

## Agnostic Content

| Content                                                                | Type          | Function                                         |
|------------------------------------------------------------------------|---------------|-------------------------------------------------|
| [Install-SnapAgent](/docs/0cf14533-c145-4a77-8ea7-8c70476768a9) | Agnostic Ps1 | Installs SnapAgent on Windows computers.        |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - BlackPoint - SnapAgent Installer](/docs/202e2dde-5865-4035-8410-37dc6cb92a60)
   - [Monitor - BlackPoint SnapAgent Deployment](/docs/8dad86ab-7d59-43ef-b148-f4ab7df0b8f0)
   - **Alert Template - △ Custom - Execute Script - BlackPoint SnapAgent Install**

2. Reload the system cache:
   - ![Reload Cache](../../static/img/docs/bd8800e7-9e78-4b98-b4f6-4fc9610a9c36/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation --> Monitors within the CWA Control Center and set up the following:
     - [Monitor - BlackPoint SnapAgent Deployment](/docs/8dad86ab-7d59-43ef-b148-f4ab7df0b8f0)
       - Set up with the "△ Custom - Execute Script - BlackPoint SnapAgent Install" alert template.
       - Right-click and select "Run Now" to start the monitor.

4. Whitelisting  
   Make sure to get the hashes below whitelisted for the environment where the security software is installed:  
   - 9E7043C03F84F49B34AA4C0D86687705 --> Hash of script Install-SnapAgentAI.ps1  
   - D6A7CA1C9B7A71648470B189831FA276 --> Hash of script Install-SnapAgent.ps1  
