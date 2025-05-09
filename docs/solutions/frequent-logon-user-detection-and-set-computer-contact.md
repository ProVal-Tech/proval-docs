---
id: '3579d837-d1a4-4186-ba92-4323a27bc367'
slug: /3579d837-d1a4-4186-ba92-4323a27bc367
title: 'Frequent Logon User Detection and Set Computer Contact'
title_meta: 'Frequent Logon User Detection and Set Computer Contact'
keywords: ['frequent', 'logon', 'user', 'contact', 'workstation']
description: 'This document outlines a solution for gathering frequent domain logon users on Windows workstations and setting the associated contact in ConnectWise Automate. It includes implementation steps and associated content such as scripts and monitors for effective user detection.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This solution is designed to gather the frequent domain logon user on Windows workstations and set the associated contact to the computer from the database resembling the name of the logon user detected using the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4).

## Associated Content

| Content                                                                                      | Type            | Function                                                                                                                                                                                                                      |
|----------------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4) | Script          | This script is designed to gather the frequent logged-in domain users on the workstations and set the associated contact to the computer in Automate resembling the detected username.                                        |
| [CWA - Monitor - Frequent User Detection](/docs/925ec2d0-a4f0-4bff-8482-f0f4137885ce) | Internal Monitor | This internal monitor is designed to detect the online Windows workstation agent where frequent user detection has not been detected in the last 14 days by default.                                                            |
| [CWA - Dataview - Frequent Logon Users](/docs/0dac9234-cf2a-4649-aab5-dfbc08c1765d)   | Dataview        | This dataview stores the logon username, logon user count, and script run date data detected via the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4) of the Windows workstations. |
| **△ Custom - Execute Script - Frequent Logon Users**                                        | Alert Template   | This alert template schedules the script [CWM - Automate - Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4) to the detected agents of the monitor [CWA - Monitor - Frequent User Detection](/docs/925ec2d0-a4f0-4bff-8482-f0f4137885ce). |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Stitching Frequent Logon User (Set Computer Contact)](/docs/bef87782-0d9d-40f0-96c5-d30b589b57b4)
   - [Monitor - Frequent User Detection](/docs/925ec2d0-a4f0-4bff-8482-f0f4137885ce)
   - [Dataview - Frequent Logon Users](/docs/0dac9234-cf2a-4649-aab5-dfbc08c1765d)
   - **△ Custom - Execute Script - Frequent Logon Users**

2. Reload the system cache:
   - ![Reload Cache](../../static/img/docs/3579d837-d1a4-4186-ba92-4323a27bc367/image_1.webp)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Monitor - Frequent User Detection](/docs/925ec2d0-a4f0-4bff-8482-f0f4137885ce)
       - Set up with the "**△ Custom - Execute Script - Frequent Logon Users**" Alert Template
       - Right-click and Run Now to start the monitor.