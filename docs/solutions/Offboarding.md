---
id: 'cwa-offboarding-process'
title: 'Offboarding Process Implementation'
title_meta: 'Offboarding Process Implementation for Client Requirements'
keywords: ['offboarding', 'monitor', 'scripts', 'automation', 'configuration']
description: 'This document outlines the implementation of an offboarding process tailored to client requirements, detailing associated scripts, templates, and monitors necessary for effective execution. It provides step-by-step instructions for importing and configuring the relevant components using the ProSync plugin.'
tags: ['automation', 'configuration', 'monitor', 'scripts', 'client']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to facilitate the Offboarding Process as per the client's requirement.

## Associated Content

| Content                                                                 | Type          | Function                                                                                                                                                                                                                                        |
|-------------------------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093) | Script        | This is a wrapper script that can be used to offboard machines from the client's environment by defining the scripts to be run before offboarding the machine.                                                                                 |
| [CWM - Automate - Template - Offboarding Scripts - Partner](https://proval.itglue.com/DOC-5078775-15281996) | Template Script | Template script to be used with [CWM - Automate - Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093) to run Child scripts. This script needs to be duplicated and modified as per Clients requirement               |
| [CWM - Automate - Internal Monitor - Offboarding](https://proval.itglue.com/DOC-5078775-14875676) | Internal Monitor | The purpose of this monitor is to detect the clients, locations or machines opted for offboarding.                                                                                                                                           |
| `△ Custom - Execute Script - Offboarding Wrapper`                       | Alert Template | Executes the script [CWM - Automate - Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093) against the computers detected in the monitor set [CWM - Automate - Internal Monitor - Offboarding](https://proval.itglue.com/DOC-5078775-14875676) |

## Implementation

1. Import the following script using the ProSync plugin:
   - [CWM - Automate - Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093)

2. Import the following monitor using the ProSync plugin:
   - [CWM - Automate - Internal Monitor - Offboarding](https://proval.itglue.com/DOC-5078775-14875676)

3. Import the following Alert Templates using the ProSync plugin:
   - `△ Custom - Execute Script - Offboarding Wrapper`

4. Reload the System Cache  
   ![Reload Cache](../../static/img/Offboarding/image_4.png)

5. Configure the solution as follows:
   - Go to Automation → Scripts → View Scripts → 'ProVal/Client Specific' folder
     - Duplicate [Script - Offboarding Scripts - Partner [Template]](https://proval.itglue.com/DOC-5078775-15281996)
       - Update the duplicated script as per clients requirement as defined in [Template - Offboarding Scripts - Partner](https://proval.itglue.com/DOC-5078775-15281996)
     - Under 'ProVal/Automate' - Open the [Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093)
     - Update the script to use this updated Script instead of the template one.
   - Ask consultant if client would like to set up a 'Failed Uninstall Process'.
     - If yes, select the required process from Dropdown EDF `"Failed Uninstall Process"`. For more details on this EDF visit [CWM - Automate - Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093).
   - Navigate to Automation → Monitors within the CWA Control Center.
     - [CWM - Automate - Internal Monitor - Offboarding](https://proval.itglue.com/DOC-5078775-14875676)
       - Configure with the alert template: `△ Custom - Execute Script - Offboarding Wrapper`
       - Right-click and Run Now to start the monitor.
   - Below EDFs can be selected to offboard a client, location, or a machine. These EDFs are described in detail in [Script - Offboarding Wrapper](https://proval.itglue.com/DOC-5078775-15050093).
     - Offboard Client
     - Offboard Location
     - Offboard Computer



