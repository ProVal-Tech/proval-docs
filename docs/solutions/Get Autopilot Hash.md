---
id: 'cwa-hardware-hash-autopilot-registration'
title: 'Collecting Hardware Hash for Autopilot Device Registration'
title_meta: 'Collecting Hardware Hash for Autopilot Device Registration'
keywords: ['hardware', 'autopilot', 'registration', 'device', 'monitor', 'script', 'dataview']
description: 'This document provides a comprehensive guide on how to collect the Hardware Hash for autopilot device registration, including associated scripts, internal monitors, and implementation steps for successful integration.'
tags: ['monitor', 'script', 'dataview', 'windows', 'configuration']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to collect the Hardware Hash for autopilot device registration.

## Associated Content

| Content                                                                                                               | Type           | Function                                           |
|-----------------------------------------------------------------------------------------------------------------------|----------------|----------------------------------------------------|
| [CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317)                                 | Script         | Gather Agents Hardware Hash.                       |
| [CWA - Internal Monitor - ProVal - Production - Get - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245349) | Internal Monitor | Detects Windows agents missing Hardware Hash       |
| `△ Custom - Execute Script - Get-AutopilotHash`                                                                     | Alert Template | Execute the script [CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317) against the machines detected by the internal monitor. |
| [CWA - Automate - Dataview - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245306)                       | Dataview       | Displays the Hardware Hash details of Windows agents. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [CWA - Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317)
   - [CWA - Internal Monitor - ProVal - Production - Get - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245349)
   - [CWA - Automate - Dataview - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245306)
   - `△ Custom - Execute Script - Get-AutopilotHash`

2. Reload the system cache:
   ![Image](..\..\static\img\Get-Autopilot-Hash\image_1.png)

3. Run the [Script - Get-AutopilotHash](https://proval.itglue.com/DOC-5078775-17245317) against any machine with the Set_Environment parameter set to '1':
   ![Image](..\..\static\img\Get-Autopilot-Hash\image_2.png)

4. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [CWA - Internal Monitor - ProVal - Production - Get - Autopilot Hash](https://proval.itglue.com/DOC-5078775-17245349)
       - `△ Custom - Execute Script - Get-AutopilotHash`
       - Right-click and Run Now to start the monitor.


