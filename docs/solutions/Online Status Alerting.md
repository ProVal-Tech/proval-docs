---
id: 'cwa-online-status-alerting'
title: 'Online Status Alerting for Offline Machines'
title_meta: 'Online Status Alerting for Offline Machines'
keywords: ['ticket', 'status', 'offline', 'online', 'monitor', 'alert', 'automate']
description: 'This document outlines a solution to automatically change the status of a ticket in ConnectWise Manage when an offline machine comes back online. It includes associated scripts, internal monitors, and detailed implementation steps to ensure proper functionality.'
tags: ['ticket', 'monitor', 'alert', 'automation', 'configuration', 'windows']
draft: false
unlisted: false
---
## Purpose

The purpose of this solution is to change the status of the ticket in CW Manage to desired status when an offline machine comes back online.

## Associated Content

| Content                                                                                                         | Type            | Function                                                                                                                                                                                                                                                                                                                                 |
|-----------------------------------------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Online Status Alerting - Update EDFs [Param]](https://proval.itglue.com/DOC-5078775-13284610)       | Script          | This script can be used to provide input to the computer EDFs "Online Alert Reason" "Online Alert E-mail" and "Online Alert Ticket ID".                                                                                                                                                                                                 |
| [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609) | Auto-fix Script | This will run as an autofix to the [Online Status Alerting - Machine Back Online](https://proval.itglue.com/DOC-5078775-13284611) and [Online Status Alerting - Machine Restarted](https://proval.itglue.com/DOC-5078775-17543410) monitor sets to change the status of the CW manage ticket.                                                                                  |
| [Internal Monitor - Online Status Alerting - Machine Back Online](https://proval.itglue.com/DOC-5078775-13284611) | Internal Monitor | This will look for the machines for which the EDF "Online Alert Ticket ID" is filled with Ticket ID and were offline and just came back online. It will then trigger the [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609).                                                                                   |
| [Internal Monitor - Online Status Alerting - Machine Restarted](https://proval.itglue.com/DOC-5078775-17543410) | Internal Monitor | Runs the script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609) once a machine comes back online after restart and has either Ticket ID filled in the EDF "Online Alert Ticket ID" or Email ID filled in the EDF "Online Alert E-mail".                                                                 |
| △ Custom - Autofix - Online Status Alerting                                                                     | Alert Template   | This will run the [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609).                                                                                                                                                                                                 |

## Implementation

1. Import both scripts, the internal monitor, and the alert template.
   - [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609)
   - [Script - Online Status Alerting - Update EDFs [Param]](https://proval.itglue.com/DOC-5078775-13284610)
   - [Internal Monitor - Online Status Alerting - Machine Back Online](https://proval.itglue.com/DOC-5078775-13284611)
   - [Internal Monitor - Online Status Alerting - Machine Restarted](https://proval.itglue.com/DOC-5078775-17543410)
   - `△ Custom - Autofix - Online Status Alerting`

2. Run or debug the [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609) against a random Windows computer with the following parameters filled out:
   - `SetEnvironment`  
     - Set this value to 1
   - `Email_Connector_email_Address`  
     - Fill this out with the email address to the connector within Manage. This allows tickets to be updated when the machine comes online.
   - `Status_To_Change_To`  
     - Set this to what the status should change to when the machine comes online.

   For more information on system properties, see the document for script [Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609).

3. Reload the System Cache  
   ![Reload the System Cache](..\..\static\img\Online-Status-Alerting\image_1.png)

4. Navigate to the System Dashboard → Config → Configurations → Properties and validate the settings that you specified have been set correctly:  
   ![Settings Validation](..\..\static\img\Online-Status-Alerting\image_2.png)  
   ![Settings Validation](..\..\static\img\Online-Status-Alerting\image_3.png)  
   **If they are different from what you specified, update them now.** The SetEnvironment process does not overwrite any existing properties if they exist, so this must be double-checked.

5. Navigate to Automation → Monitors → Internal Monitors
   - Find the [Internal Monitor - Online Status Alerting - Machine Back Online](https://proval.itglue.com/DOC-5078775-13284611)  
     - Apply the alert template `△ Custom - Autofix - Online Status Alerting`  
       - Make sure this alert template is set to run the [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609)  
     - Right-click and Run Now on the monitor
   - Find the [Internal Monitor - Online Status Alerting - Machine Restarted](https://proval.itglue.com/DOC-5078775-17543410)  
     - Apply the alert template `△ Custom - Autofix - Online Status Alerting`  
       - Make sure this alert template is set to run the [Script - Online Status Alerting - Autofix - Update Ticket + Email [EDF]](https://proval.itglue.com/DOC-5078775-13284609)  
     - Right-click and Run Now on the monitor


