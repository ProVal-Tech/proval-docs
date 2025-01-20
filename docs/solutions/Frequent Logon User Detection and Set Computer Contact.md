---
id: '3579d837-d1a4-4186-ba92-4323a27bc367'
title: 'Stitching Frequent Logon User'
title_meta: 'Stitching Frequent Logon User - Automate Integration'
keywords: ['frequent', 'logon', 'user', 'contact', 'workstation']
description: 'This document outlines a solution for gathering frequent domain logon users on Windows workstations and setting the associated contact in ConnectWise Automate. It includes implementation steps and associated content such as scripts and monitors for effective user detection.'
tags: ['windows']
draft: false
unlisted: false
---
## Purpose

This solution is designed to gather the frequent domain logon user on the Windows workstations and set the associated contact to the computer from the database resembling the name of the logon user detected using script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](<../cwa/scripts/Detect Frequent Logon User (Set Computer Contact).md>).

## Associated Content

| Content                                                                                      | Type            | Function                                                                                                                                                                                                                      |
|----------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](<../cwa/scripts/Detect Frequent Logon User (Set Computer Contact).md>) | Script          | This script is designed to gather the frequent logged-in domain users on the workstations and set the associate contact to the computer in Automate resembling the detected username.                                        |
| [CWA - Monitor - Frequent User Detection](<../cwa/monitors/Frequent User Detection.md>) | Internal Monitor | This internal monitor is designed to detect the online Windows workstation agent where frequent user detection has not been detected in the last 14 days by default.                                                            |
| [CWA - Dataview - Frequent Logon Users](<../cwa/dataviews/Frequent Logon Users.md>)   | Dataview        | This dataview stores the logonusername, logonusercount, and script run date data detected via script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](<../cwa/scripts/Detect Frequent Logon User (Set Computer Contact).md>) of the Windows Workstations. |
| **△ Custom - Execute Script - Frequent Logon Users**                                        | Alert Template   | This alert template schedules the script @[CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](<../cwa/scripts/Detect Frequent Logon User (Set Computer Contact).md>) to the detected agents of the monitor [CWA - Monitor - Frequent User Detection](<../cwa/monitors/Frequent User Detection.md>). |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Stitching Frequent Logon User (Set Computer Contact)](<../cwa/scripts/Detect Frequent Logon User (Set Computer Contact).md>)
   - [Monitor - Frequent User Detection](<../cwa/monitors/Frequent User Detection.md>)
   - [Dataview - Frequent Logon Users](<../cwa/dataviews/Frequent Logon Users.md>)
   - **△ Custom - Execute Script - Frequent Logon Users**

2. Reload the system cache:
   - ![Reload Cache](../../static/img/Frequent-Logon-User-Detection-and-Set-Computer-Contact/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and setup the following:
     - [Monitor - Frequent User Detection](<../cwa/monitors/Frequent User Detection.md>)
       - Setup with "**△ Custom - Execute Script - Frequent Logon Users**" Alert Template
       - Right-click and Run Now to start the monitor.












