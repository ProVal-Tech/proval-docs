---
id: 'cwa-network-glue-deployment'
title: 'Network Glue Deployment and Uninstallation'
title_meta: 'Network Glue Deployment and Uninstallation'
keywords: ['network', 'glue', 'deployment', 'uninstallation', 'monitor', 'script']
description: 'This document provides detailed instructions for the deployment and uninstallation of the Network Glue Collector, including associated scripts and monitors. It outlines the necessary steps for implementation and configuration within the ConnectWise Automate environment.'
tags: ['deployment', 'uninstallation', 'monitor', 'script', 'configuration']
draft: false
unlisted: false
---
## Purpose

This solution contains the Network Glue Deployment/uninstallation articles.

## Associated Content

| Content                                                                                                  | Type    | Function                                                                                                                                                                                                                     |
|----------------------------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Network Glue Collector - Install](https://proval.itglue.com/DOC-5078775-9360868)              | Script  | Installs NetworkGlue Collector and applies a client-specific token. An Activation Key is Necessary and it can be found on the Clients' IT Glue page under the networks section.                                             |
| [Internal Monitor - ProVal Production - Network Glue - Deployment](https://proval.itglue.com/DOC-5078775-17492944) | Monitor | This monitor performs the auto-deployment of the Network Glue Collector. It depends on the EDFs mentioned in the document for the deployment.                                                                               |
| [Script - Remove Application - Network Glue Collector](https://proval.itglue.com/DOC-5078775-17492943)  | Script  | This script is built to perform the Network Glue Collector uninstallation on demand or in conjunction with the offboarding script.                                                                                         |
| △ Custom - Execute Script - Network Glue Collector - install                                              | Alert Template | This alert template schedules with the [Internal Monitor - ProVal Production - Network Glue - Deployment](https://proval.itglue.com/DOC-5078775-17492944) and runs the script [SWM - Software Install - Script - Network Glue Collector - Install](https://proval.itglue.com/DOC-5078775-9360868) on the detected endpoints for the deployment. |

## Implementation

1. **Import the following content using the ProSync Plugin:**
   - [Script - Network Glue Collector - Install](https://proval.itglue.com/DOC-5078775-9360868)  
   - [Internal Monitor - ProVal Production - Network Glue - Deployment](https://proval.itglue.com/DOC-5078775-17492944)  
   - [Script - Remove Application - Network Glue Collector](https://proval.itglue.com/DOC-5078775-17492943)  
   - △ Custom - Execute Script - Network Glue Collector - install  

2. **Reload the system cache:**
   ![Reload Cache](../../static/img/Application---Network-Glue-Collector/image_1.png)

3. **Configure the solution as outlined below:**
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Internal Monitor - ProVal Production - Network Glue - Deployment](https://proval.itglue.com/DOC-5078775-17492944)  
       - Setup with "△ Custom - Execute Script - Network Glue Collector - install" Alert Template
       - Right-click and Run Now to start the monitor.



