---
id: '77126d0b-4467-42da-9a4e-92b8aeda91e4'
title: 'Deploy Rapid Fire Compliance Management Software'
title_meta: 'Deploy Rapid Fire Compliance Management Software'
keywords: ['deployment', 'compliance', 'monitoring', 'software', 'management']
description: 'This document outlines the process to deploy the Rapid Fire Compliance Management software using client level EDFs with specific location and computer level exclusions. It includes associated scripts, monitors, and implementation steps to ensure a successful deployment.'
tags: ['compliance', 'software', 'monitoring', 'deployment', 'configuration']
draft: false
unlisted: false
---
## Purpose

This solution is built to deploy the Rapid Fire Compliance Management software, controlled by client level EDFs with location and computer level exclusions.

## Associated Content

| Content                                                                                               | Type          | Function                                                                                                                                                                                                                   |
|-------------------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Deploy Rapid Fire Compliance Management](https://proval.itglue.com/DOC-5078775-17700231)   | Script        | This script deploys the Rapid Fire compliance management application. It first validates the .NET Framework 4.8 is installed; if installed, then only the deployment is possible.                                        |
| [Internal Monitor - Agents Missing Rapid Fire Compliance Manager](https://proval.itglue.com/DOC-5078775-17069435) | Internal Monitor | This monitor detects the agent where the location of the agent contains the "Compliance Management Installer Key" and the deployment is enabled. Excluded computers and locations will not show up in the monitor. |
| **△ Custom - Execute Script - Deploy Rapid Fire**                                                   | Alert Template | It runs as an autofix with the [Internal Monitor - Agents Missing Rapid Fire Compliance Manager](https://proval.itglue.com/DOC-5078775-17069435) and schedules the [Script - Deploy Rapid Fire Compliance Management](https://proval.itglue.com/DOC-5078775-17700231) to the detected endpoints where deployment is set based on the EDFs. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Deploy Rapid Fire Compliance Management](https://proval.itglue.com/DOC-5078775-17700231)
   - [Internal Monitor - Agents Missing Rapid Fire Compliance Manager](https://proval.itglue.com/DOC-5078775-17069435)
   - **Alert Template -** `△ Custom - Execute Script - Deploy Rapid Fire`

2. Reload the system cache:
   - ![Reload Cache](../../static/img/Deploy-Rapid-Fire-Compliance-Management/image_3.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - Agents Missing Rapid Fire Compliance Manager](https://proval.itglue.com/DOC-5078775-17069435)
       - Setup with "`△ Custom - Execute Script - Deploy Rapid Fire`" alert template.
       - Right-click and Run Now to start the monitor.






