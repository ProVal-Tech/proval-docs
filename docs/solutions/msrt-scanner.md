---
id: '20e5cbc7-4882-496d-a818-348e42f644db'
slug: /20e5cbc7-4882-496d-a818-348e42f644db
title: 'MSRT Scanner'
title_meta: 'MSRT Scanner'
keywords: ['msrt', 'scanner', 'malware', 'audit', 'monitor']
description: 'This document outlines a solution for performing MSRT scanning, including optional auto-fix features for detected infections and data storage for auditing purposes. It includes associated scripts, monitors, and dataviews necessary for implementation.'
tags: ['security', 'windows']
draft: false
unlisted: false
---

## Purpose

This solution performs MSRT scanning, auto-fixes detected infections as an optional feature, and stores the data for auditing purposes.

## Associated Content

| Content                                                                 | Type     | Function                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) | Script   | This script runs the Malicious Software Removal Tool Scanner and logs the result. It also provides an option to perform an auto-fix of the detected infections by the tool.                                                                                                                                                                                      |
| [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673) | Monitor  | This monitor detects the online Windows-supported agents (Windows 10, 11, 2016, 2019, and 2022 only) where the client EDF 'MSRT Scanner Enable' is checked and the exclusion location and computer EDFs 'MSRT Scanner Exclude' are not checked. It also excludes the agents where the MSRT scanner script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) ran in the past 7 days. |
| [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26) | Dataview | This dataview stores the status of the MSRT scanner result from the script [Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257).                                                                                                                                                                                             |
| **△ Custom - Execute Script - MSRT Scanner**                          | Alert template | This alert template helps to schedule the script [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257) to the detected agents of the monitor [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673).                                                                                       |

## Implementation

1. Import the following content using the ProSync Plugin:
   - [Script - Malicious Software Removal Tool Scanner](/docs/18a8b802-bc6a-42a8-859b-89c93fed4257)
   - [Internal Monitor - MSRT Scanner Execute](/docs/52caa288-ae6c-4047-a2d1-6d34b806d673)
   - [Dataview - MSRT Scanner Audit](/docs/3b6465a0-54e7-45ce-94b2-000ac55c6a26)
   - **△ Custom - Execute Script - MSRT Scanner**

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


