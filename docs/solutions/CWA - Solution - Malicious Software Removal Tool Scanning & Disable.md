---
id: 'e84b3dd2-284b-4384-b972-4a02feaa7b37'
slug: /e84b3dd2-284b-4384-b972-4a02feaa7b37
title: 'CWA Solution - Malicious Software Removal Tool Scanning & Disabling'
title_meta: 'CWA Solution - Malicious Software Removal Tool Scanning & Disabling'
keywords: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
description: 'This solution details the deployment and removal solution of the Malicious Software Removal Tool and its implementation'
tags: ['MSRT', 'Malicious', 'field', 'key', 'security', 'software', 'Tool']
draft: false
unlisted: false
---

## Purpose

The solution provides feature to run the scanning using Malicious Software Removal Tool or disable/uninstall it completely.

## Deployment Content

| Content                                                                 | Type     | Function                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) | Script   | This script runs the Malicious Software Removal Tool Scanner and logs the result. It also provides an option to perform an auto-fix of the detected infections by the tool.                                                                                                                                                                                      |
| [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673) | Monitor  | This monitor detects the online Windows-supported agents (Windows 10, 11, 2016, 2019, and 2022 only) where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' are not checked. It also excludes the agents where the MSRT scanner script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) ran in the past 7 days. |
| [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26) | Dataview | This dataview stores the status of the MSRT scanner result from the script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257).                                                                                                                                                                                             |
| **△ Custom - Execute Script - MSRT Scanner**                          | Alert template | This alert template helps to schedule the script [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) to the detected agents of the monitor [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673).                                                                                       |

## Disabling Content

| Content                                                                 | Type     | Function                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|[Monitor - MSRT Disable-Uninstall](/docs/d3b1689c-fd8d-492a-91e7-ee5670f4a415) | Internal Monitor | This monitor detects the online Windows 10/11 where the MSRT disable/uninstall EDF is checked and exclusions are not checked and ignores the agent where the disable/uninstall was already done. |
| [Script - Malicious Software Removal Tool Disable/Unistall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7)| Script | This script will block the MSRT patches to be enrolled to the Windows and also provides feature to Uninstall it completely. It can run on demand and also be scheduled as an autofix with the monitor [Monitor - MSRT Disable-Uninstall](/docs/d3b1689c-fd8d-492a-91e7-ee5670f4a415). | 
| [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26) | Dataview | This dataview stores the status of the MSRT scanner result from the [Script - Malicious Software Removal Tool Disable/Unistall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7).                                                                                                                                                                                             |
| `△ Custom - Execute Script - MSRT Disable/Uninstall` | Alert Template | This alert template helps to schedule the [Script - Malicious Software Removal Tool Disable/Unistall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7) to the detected agents of the [Monitor - MSRT Disable-Uninstall](/docs/d3b1689c-fd8d-492a-91e7-ee5670f4a415). |

## Implementation

#### **Implement the deployment content**

1. Import the following content using the ProSync Plugin:
   - [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257)
   - [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673)
   - [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26)
   - **△ Custom - Execute Script - MSRT Scanner**
   - Run the script [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) with SetEnvironment = 1 on any random machine so that required EDFs get imported.
2. Reload the system cache:

   ![Reload Cache](../../static/img/MSRT-Scanner/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673)
       - Set up with **△ Custom - Execute Script - MSRT Scanner** Alert Template.
       - Right-click and Run Now to start the monitor.
   - Please ensure to whitelist the following hashes for script execution.
     ```
     ED06AECD5686944B0A5E5D76C1E7A9EA
     C8759C7E4979819C0BB39DAF4DC64124
     ```

#### **Implement the Disable/Uninstall content**

1. Import the following content using the ProSync Plugin:
   - [Script - Malicious Software Removal Tool Disable/Unistall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7)
   - [Internal Monitor - MSRT Disable-Uninstall](/docs/d3b1689c-fd8d-492a-91e7-ee5670f4a415)
   - [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26)
   - **△ Custom - Execute Script - MSRT Disable/Uninstall**
   - Run the script [Script - Malicious Software Removal Tool Disable/Unistall](/docs/21c23057-f81d-11ef-87d3-8600008a66b7) with Set_Environment = 1 on any random machine so that required EDFs get imported.
2. Reload the system cache:

   ![Reload Cache](../../static/img/MSRT-Scanner/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Automation → Monitors within the CWA Control Center and set up the following:
     - [Internal Monitor - MSRT Disable-Uninstall](/docs/d3b1689c-fd8d-492a-91e7-ee5670f4a415)
       - Set up with **△ Custom - Execute Script - MSRT Disable/Uninstall** Alert Template.
       - Right-click and Run Now to start the monitor.
   - Please ensure to whitelist the following hashes for script execution.
     ```
     8E7513A15FC33B38337976B85C0E8C5C
     ```

