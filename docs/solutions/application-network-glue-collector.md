---
id: '2aceee46-2a96-465d-929d-85de69811a3a'
slug: /2aceee46-2a96-465d-929d-85de69811a3a
title: 'Application - Network Glue Collector'
title_meta: 'Application - Network Glue Collector'
keywords: ['network', 'glue', 'deployment', 'uninstallation', 'monitor', 'script']
description: 'This document provides detailed instructions for the deployment and uninstallation of the Network Glue Collector, including associated scripts and monitors. It outlines the necessary steps for implementation and configuration within the ConnectWise Automate environment.'
tags: ['deployment', 'uninstallation']
draft: false
unlisted: false
---

## Purpose

This solution contains the Network Glue deployment and uninstallation articles.

## Associated Content

| Content                                                                                                  | Type          | Function                                                                                                                                                                                                                     |
|----------------------------------------------------------------------------------------------------------|---------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Network Glue Collector - Install](/docs/11b30dcb-74c1-4736-a495-5908ce17117a)       | Script        | Installs the Network Glue Collector and applies a client-specific token. An Activation Key is necessary and can be found on the Clients' IT Glue page under the networks section.                                             |
| [Internal Monitor - ProVal Production - Network Glue - Deployment](/docs/4e0f7314-bf88-44de-a162-139c191e6e09) | Monitor       | This monitor performs the auto-deployment of the Network Glue Collector. It depends on the EDFs mentioned in the document for the deployment.                                                                               |
| [Script - Remove Application - Network Glue Collector](/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be)  | Script        | This script is designed to perform the uninstallation of the Network Glue Collector on demand or in conjunction with the offboarding script.                                                                                 |
| △ Custom - Execute Script - Network Glue Collector - Install                                              | Alert Template | This alert template is scheduled with the [Internal Monitor - ProVal Production - Network Glue - Deployment](/docs/4e0f7314-bf88-44de-a162-139c191e6e09) and runs the script [SWM - Software Install - Script - Network Glue Collector - Install](/docs/11b30dcb-74c1-4736-a495-5908ce17117a) on the detected endpoints for deployment. |

## Implementation

1. **Import the following content using the ProSync Plugin:**
   - [Script - Network Glue Collector - Install](/docs/11b30dcb-74c1-4736-a495-5908ce17117a)  
   - [Internal Monitor - ProVal Production - Network Glue - Deployment](/docs/4e0f7314-bf88-44de-a162-139c191e6e09)  
   - [Script - Remove Application - Network Glue Collector](/docs/201f46d7-6511-4e5f-a002-ff7f4b27c8be)  
   - △ Custom - Execute Script - Network Glue Collector - Install  

2. **Reload the system cache:**
   ![Reload Cache](../../static/img/Application---Network-Glue-Collector/image_1.png)

3. **Configure the solution as outlined below:**
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - ProVal Production - Network Glue - Deployment](/docs/4e0f7314-bf88-44de-a162-139c191e6e09)  
       - Set up with the "△ Custom - Execute Script - Network Glue Collector - Install" Alert Template
       - Right-click and select "Run Now" to start the monitor.


