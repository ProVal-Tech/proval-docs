---
id: '00b08a60-f202-42db-9f67-a76ea29289fa'
slug: /00b08a60-f202-42db-9f67-a76ea29289fa
title: 'Windows 11 Installation'
title_meta: 'Windows 11 Installation'
keywords: ['windows', 'readiness', 'plugin', 'compatibility', 'upgrade']
description: 'This solution is designed to automate the upgrade from Windows 10 to Windows 11'
tags: ['database', 'report', 'setup', 'update', 'windows']
draft: False
unlisted: false
---

## Purpose

This solution is designed to automate the upgrade from Windows 10 to Windows 11, addressing the end-of-support deadline for Windows 10 in October 2025.

**Key Components**:

1. [Script : Windows 11 Installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad):  
    - Used to install Windows 11 on compatible Windows 10 machines.  
    - It can also be executed manually as a standalone script with no limits on the number of executions.

2. [Internal Monitor : Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad):  
    - Configured to automatically execute Windows 11 Installer script on compatible Windows 10 machines.  
    - Runs during off-hours (6:00 PM to 6:00 AM) to prevent disruptions during working hours, as the installation process involves forced computer reboots.  
    - For machines where the script fails during the initial execution, it will retry once per week, up to a maximum of three attempts per machine.

3. [Dataview : Windows 11 Installation Audit [Compatible Machines]](/docs/a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce):  
    - Provides an overview of the automation process, enabling administrators to track the progress and status of the upgrade across all machines.

## Update Notice: 08-April-2025

The following scripts have been incorporated into the solution:

- [Windows 11 Upgrade Failure [Ticket]](/docs/ad564b3a-e4dc-4e47-90dd-52ca8fbc6d52)  
- [Install Windows 11 Feature Update [Beta, Reboot]](/docs/27f8240b-603a-4af2-b9d9-480a560f8747)

## Associated Content

| Content                                                                                                      | Type             | Function                                                                            |
| ------------------------------------------------------------------------------------------------------------ | ---------------- | ----------------------------------------------------------------------------------- |
| [Solution - Windows 11 Compatibility Audit ](/docs/f0bb3ffc-60cb-484c-b7fa-27a386ac664c)                     | Solution         | Determine the compatibility of Windows 10 machines for the Windows 11 installation. |
| [Windows 11 Installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)                                           | Script           | Executes windows-upgrader.exe on Windows 10.                                        |
| [Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad)                       | Internal Monitor | Executes Windows 11 Installer script on compatible Windows 10 machines.             |
| [Dataview - Windows 11 Installation Audit [Compatible Machines]](/docs/a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce) | Dataview         | Displays the outcome of automation.                                                 |
| △ Custom - Install Windows 11 - Compatible Machines                                                          | Alert Template   | Executes the script detected by the internal monitor.                               |

### Additional Content

| Content                                | Type             | Function                                                                 |
|----------------------------------------|------------------|-------------------------------------------------------------------------|
| [Windows 11 Upgrade Failure [Ticket]](/docs/ad564b3a-e4dc-4e47-90dd-52ca8fbc6d52) | Script | Generates a ticket for the erroneous machines |
| [Install Windows 11 Feature Update [Beta, Reboot]](/docs/27f8240b-603a-4af2-b9d9-480a560f8747) | Script | Workaround script for erroneous machines |

## Implementation

1. Implement the Windows 11 Compatibility Audit solution as instructed in this document.  

2. Import the following content using the ProSync Plugin:
    - [Script : Windows 11 Installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)  
    - [Script: Windows 11 Upgrade Failure [Ticket]](/docs/ad564b3a-e4dc-4e47-90dd-52ca8fbc6d52)  
    - [Script: Install Windows 11 Feature Update [Beta, Reboot]](/docs/27f8240b-603a-4af2-b9d9-480a560f8747)  
    - [Internal Monitor : Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad)  
    - [Dataview : Windows 11 Installation Audit [Compatible Machines]](/docs/a9cf49a9-c8e0-432c-ae8e-9560d38bf1ce)  
    - Alert Template: △ Custom - Install Windows 11 - Compatible Machines

3. Reload the system cache:  
![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_1.png)

4. Configure the solution as outlined below:  
    - Navigate to Automation --> Monitors within the CWA Control Center and setup the following:  
        - [Internal Monitor : Install Windows 11 - Compatible Machines](/docs/db122f12-3d6b-48ae-8c8b-e9de9797ecad)  
            - Alert Template: △ Custom - Install Windows 11 - Compatible Machines
            - Right-click and Run Now to start the monitor

5. Schedule the [Script: Windows 11 Upgrade Failure [Ticket]](/docs/ad564b3a-e4dc-4e47-90dd-52ca8fbc6d52) script to run once per day.  
**Note:** This script should only be scheduled after obtaining partner confirmation, as it generates tickets and may produce significant noise.

## EDF

| Name                             | Type      | Level    | Section    | Description                                                                                                                                             |
| -------------------------------- | --------- | -------- | ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Enable Windows 11 Installation   | Check-Box | Client   | Default    | Enables automation for the client.                                                                                                                      |
| Exclude Windows 11 Installation  | Check-Box | Location | Exclusions | Exclude location from the automation.                                                                                                                   |
| Exclude Windows 11 Installation  | Check-Box | Computer | Exclusions | Exclude location from the computer.                                                                                                                     |
| Windows 11 Installation Attempts | Text      | Computer | Default    | A non-editable EDF, updated by [Script : Windows 11 Installer](/docs/a4668ce4-9788-47a9-bb3b-1997367803ad)  to keep track of the number of scripts run. |
