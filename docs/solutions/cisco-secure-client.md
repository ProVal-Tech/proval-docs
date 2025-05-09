---
id: 'f469f77e-cf0c-4967-b51a-41918567fa53'
slug: /f469f77e-cf0c-4967-b51a-41918567fa53
title: 'Cisco Secure Client'
title_meta: 'Cisco Secure Client'
keywords: ['cisco', 'client', 'installation', 'windows', 'mac']
description: 'This document outlines the process to install various Cisco Secure Client modules on Windows and MAC machines, including associated scripts and monitors for effective management.'
tags: ['cisco', 'installation', 'windows']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to provide an option to install different Cisco Secure Client modules on Windows and MAC machines.

## Associated Content

| Content                                                                                                      | Type            | Function                                                                                                                                                       |
|--------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [SWM - Software Install - Script - Cisco Secure Client - Package Installation](/docs/69ac0a53-e25a-4e16-b266-b174acf20b3f)     | Script          | This script provides an option to install different Cisco Secure Client modules on Windows and MAC machines.                                                 |
| [CWA - Internal Monitor - Missing Cisco Secure Client Modules](/docs/2936aa3a-b372-4681-8957-e23d5a2631db) | Internal Monitor | The internal monitor detects the online machines where Cisco Secure Client's EDFs (for Module Installation) are selected, but the selected modules are not installed on Windows and MAC machines. |
| △ Custom - Execute Script - Cisco Secure Client - Package Installation                                       | Alert Template   | It runs as an autofix with the [CWA - Internal Monitor - Missing Cisco Secure Client Modules](/docs/2936aa3a-b372-4681-8957-e23d5a2631db) and executes [SWM - Software Install - Script - Cisco Secure Client - Package Installation](/docs/69ac0a53-e25a-4e16-b266-b174acf20b3f) on the detected agents. |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [SWM - Software Install - Script - Cisco Secure Client - Package Installation](/docs/69ac0a53-e25a-4e16-b266-b174acf20b3f)
   - [CWA - Internal Monitor - Missing Cisco Secure Client Modules](/docs/2936aa3a-b372-4681-8957-e23d5a2631db)
   - Alert Template - `△ Custom - Execute Script - Cisco Secure Client - Package Installation`

2. Reload the system cache:
   ![Reload Cache](../../static/img/docs/69ac0a53-e25a-4e16-b266-b174acf20b3f/image_24.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [CWA - Internal Monitor - Missing Cisco Secure Client Modules](/docs/2936aa3a-b372-4681-8957-e23d5a2631db)
       - Set up with the alert template "`△ Custom - Execute Script - Cisco Secure Client - Package Installation`".
       - Right-click and select "Run Now" to start the monitor.