---
id: '1530b61c-9bba-406b-9451-0b998c9e8d54'
title: 'Windows Cluster Volume Monitoring and Auditing'
title_meta: 'Windows Cluster Volume Monitoring and Auditing'
keywords: ['monitoring', 'auditing', 'cluster', 'volume', 'hyperv', 'disk', 'space', 'alert', 'ticket']
description: 'This document provides a comprehensive solution for monitoring Windows Cluster Shared volumes, creating tickets when space falls below 10%, and auditing to maintain a report of cluster disk spaces on Hyper-V Cluster servers. It includes details on scripts, remote monitors, and implementation steps for effective management.'
tags: ['cluster', 'disk', 'hyper-v', 'report']
draft: false
unlisted: false
---

## Purpose

This solution is designed to monitor the Windows Cluster Shared volume, create tickets if the cluster volume space falls below 10%, and perform audits to maintain a report of the cluster disk spaces on the Hyper-V Cluster servers.

## Auditing Content

| Content                                                                 | Type     | Function                                                                                                           |
|-------------------------------------------------------------------------|----------|--------------------------------------------------------------------------------------------------------------------|
| [Script - Windows Cluster Volume Space Audit [DV]](<../scripts/Windows Cluster Volume Space Audit DV.md>) | Script   | This script is created to audit the Cluster group devices to maintain a report of the free space on the cluster disks. |
| [Dataview - Windows Cluster Volume Space Audit [Script]](<../dataviews/Windows Cluster Volume Space Audit.md>) | Dataview | This dataview is built to show the cluster disk space audit report fetched from the table "pvl_cluster_volumes," where the script [CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>) performs the audit. |

## Automation Content

| Content                                                                 | Type          | Function                                                                                                           |
|-------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Remote Monitor - Windows Cluster Shared Volume Detection](<./CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>) | Remote Monitor | This monitor detects the cluster volumes where the cluster disk space is below 10% as an error and between 10% and 20% as a warning. |
| [Script - Windows Cluster Shared Volume [Autofix,Ticket]](<../scripts/Windows Cluster Shared Volume Autofix,Ticket.md>) | Script        | This function script runs as an autofix with the remote monitor [CWA Remote Monitor - Windows Cluster Shared Volume Detection](<./CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>) to create a ticket with detailed information about the cluster disk where the free space is below the threshold. It also calls the script [CWA Script - Windows Cluster Volume Space Audit](<../scripts/Windows Cluster Volume Space Audit DV.md>) to perform the space audit after the autofix script is scheduled to ensure the latest data is captured for that cluster server. |
| **△ CUSTOM - Execute Script - Windows Cluster Shared Volume**           | Alert Template | This alert template is designed to run the autofix script [Script - Windows Cluster Shared Volume](<../scripts/Windows Cluster Shared Volume Autofix,Ticket.md>) with the remote monitor [Remote Monitor - Windows Cluster Shared Volume Detection](<./CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>). |

## Additional Content

| Content                                                                 | Type          | Function                                                                                                           |
|-------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------|
| [Import - Remote Monitor - Windows Cluster Shared Volume Detection](<./Windows Cluster Shared Volume Detection.md>) | Import Content | This content assists in importing the remote monitor using the provided query.                                    |
| [CWA Custom Table - pvl_cluster_volumes](<../tables/pvl_cluster_volumes.md>) | Table         | The purpose of this table is to store the audit report of the cluster disk space on the Hyper-V cluster servers.   |

## Implementation

### Auditing

1. Import the following content using the ProSync Plugin:
   - [Script - Windows Cluster Volume Space Audit [DV]](<../scripts/Windows Cluster Volume Space Audit DV.md>)
   - [Dataview - Windows Cluster Volume Space Audit [Script]](<../dataviews/Windows Cluster Volume Space Audit.md>)

2. Reload the system cache:
   ![Reload Cache](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_1.png)

3. Configure the Audit script by following the steps below:
   - Navigate to Automation -> Scripts.
   - Open the script "Windows Cluster Volume Space Audit [DV]" and click debug.
   - Select any random client and computer.
   - Set the value of the Set_Environment Parameter to 1 and click OK.
   ![Set Environment](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_2.png)
   - Once the debugger screen opens, click Start and Finish.
   ![Start Finish](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_3.png)
   ![Completion](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_4.png)
   - Once the script completes successfully, click OK.

4. Reload the system cache:
   ![Reload Cache](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_1.png)

5. Navigate to Browse -> Groups -> _System Automation -> Cluster Detected. Launch it by double-clicking on it.
   ![Cluster Detected](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_5.png)
   Navigate to Computers -> Scheduled Scripts.
   It should show the schedule of the "Windows Cluster Volume Space Audit [DV]" script:
   ![Scheduled Scripts](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_6.png)

### Alerting

1. Import the following content using the ProSync Plugin:
   - [Script - Windows Cluster Shared Volume [Autofix,Ticket]](<../scripts/Windows Cluster Shared Volume Autofix,Ticket.md>)
   - Follow the [Import - Remote Monitor - Windows Cluster Shared Volume Detection](<./Windows Cluster Shared Volume Detection.md>) documentation to create the remote monitor [Remote Monitor - Windows Cluster Shared Volume Detection](<./CWA Remote Monitor - Windows Cluster Shared Volume Detection.md>).
   - Alert Template - △ CUSTOM - Execute Script - Windows Cluster Shared Volume.

2. Reload the system cache:
   ![Reload Cache](../../../static/img/Solution---Windows-Cluster-Shared-Volume/image_1.png)

3. Configure the solution as outlined below:
   - Navigate to Browse -> Groups -> _System Automation -> Cluster Detected.
   - Double-click the Cluster Detected group -> Computers -> Remote Monitors -> Windows Cluster Shared Volume Detection
     - Set up with alert template `△ CUSTOM - Execute Script - Windows Cluster Shared Volume`.

> **Note:** The autofix [Script - Windows Cluster Shared Volume [Autofix,Ticket]](<../scripts/Windows Cluster Shared Volume Autofix,Ticket.md>) also calls the [Script - Windows Cluster Volume Space Audit [DV]](<../scripts/Windows Cluster Volume Space Audit DV.md>) whenever the cluster volume space is detected below 20% as a warning or below 10% as an error. This maintains the fresh audit report for the volumes we need to monitor closely.

