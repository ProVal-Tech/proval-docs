---
id: 'cb9ba98d-9a64-4003-b7d5-a7a18192f161'
title: 'Offboarding'
title_meta: 'Offboarding'
keywords: ['offboarding', 'monitor', 'scripts', 'automation', 'configuration']
description: 'This document outlines the implementation of an offboarding process tailored to client requirements, detailing associated scripts, templates, and monitors necessary for effective execution. It provides step-by-step instructions for importing and configuring the relevant components using the ProSync plugin.'
tags: []
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to facilitate the Offboarding Process as per the client's requirements.

## Associated Content

| Content                                                                 | Type            | Function                                                                                                                                                                                                                                        |
|-------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>) | Script          | This is a wrapper script that can be used to offboard machines from the client's environment by defining the scripts to be run before offboarding the machine.                                                                                 |
| [CWM - Automate - Template - Offboarding Scripts - Partner](https://proval.itglue.com/DOC-5078775-15281996) | Template Script  | Template script to be used with [CWM - Automate - Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>) to run Child scripts. This script needs to be duplicated and modified as per the client's requirements.               |
| [CWM - Automate - Internal Monitor - Offboarding](<../cwa/monitors/Offboarding.md>) | Internal Monitor | The purpose of this monitor is to detect the clients, locations, or machines opted for offboarding.                                                                                                                                           |
| `△ Custom - Execute Script - Offboarding Wrapper`                       | Alert Template   | Executes the script [CWM - Automate - Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>) against the computers detected in the monitor set [CWM - Automate - Internal Monitor - Offboarding](<../cwa/monitors/Offboarding.md>). |

## Implementation

1. Import the following script using the ProSync plugin:
   - [CWM - Automate - Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>)

2. Import the following monitor using the ProSync plugin:
   - [CWM - Automate - Internal Monitor - Offboarding](<../cwa/monitors/Offboarding.md>)

3. Import the following Alert Template using the ProSync plugin:
   - `△ Custom - Execute Script - Offboarding Wrapper`

4. Reload the System Cache  
   ![Reload Cache](../../static/img/Offboarding/image_4.png)

5. Configure the solution as follows:
   - Go to Automation → Scripts → View Scripts → 'ProVal/Client Specific' folder
     - Duplicate [Script - Offboarding Scripts - Partner [Template]](https://proval.itglue.com/DOC-5078775-15281996)
       - Update the duplicated script as per the client's requirements as defined in [Template - Offboarding Scripts - Partner](https://proval.itglue.com/DOC-5078775-15281996).
     - Under 'ProVal/Automate' - Open the [Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>)
     - Update the script to use this updated script instead of the template one.
   - Ask the consultant if the client would like to set up a 'Failed Uninstall Process'.
     - If yes, select the required process from Dropdown EDF `"Failed Uninstall Process"`. For more details on this EDF, visit [CWM - Automate - Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>).
   - Navigate to Automation → Monitors within the CWA Control Center.
     - [CWM - Automate - Internal Monitor - Offboarding](<../cwa/monitors/Offboarding.md>)
       - Configure with the alert template: `△ Custom - Execute Script - Offboarding Wrapper`
       - Right-click and Run Now to start the monitor.
   - The following EDFs can be selected to offboard a client, location, or machine. These EDFs are described in detail in [Script - Offboarding Wrapper](<../cwa/scripts/Offboarding Wrapper.md>).
     - Offboard Client
     - Offboard Location
     - Offboard Computer




