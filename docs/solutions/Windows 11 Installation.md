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
1. [Script : Windows 11 Installer](<../cwa/scripts/Windows _11_Installer.md>) :
    - Used to install Windows 11 on compatible Windows 10 machines.
    - It can also be executed manually as a standalone script with no limits on the number of executions.

2. [Internal Monitor : Install Windows 11 - Compatible Machines](<../cwa/monitors/Install Windows 11 - Compatible Machines.md>) 
    - Configured to automatically execute Windows 11 Installer script on compatible Windows 10 machines.
    - Runs during off-hours (6:00 PM to 6:00 AM) to prevent disruptions during working hours, as the installation process involves forced computer reboots.
    - For machines where the script fails during the initial execution, it will retry once per week, up to a maximum of three attempts per machine.

3. [Dataview : Windows 11 Installation Audit [Compatible Machines]](<../cwa/dataviews//Windows 11 Installation Audit [Compatible Machines].md>) 
    - Provides an overview of the automation process, enabling administrators to track the progress and status of the upgrade across all machines.

## Associated Content
| Content                                | Type             | Function                                                                 |
|----------------------------------------|------------------|-------------------------------------------------------------------------|
| [Solution - Windows 11 Compatibility Audit ](<../solutions/Windows 11 Compatibility Audit.md>)         | Solution         | Determine the compatibility of Windows 10 machines for the Windows 11 installation. |
| [Windows 11 Installer](<../cwa/scripts/Windows _11_Installer.md>)                  | Script           | Executes windows-upgrader.exe on Windows 10.                           |
| [Install Windows 11 - Compatible Machines](<../cwa/monitors/Install Windows 11 - Compatible Machines.md>)   | Internal Monitor  | Executes Windows 11 Installer script on compatible Windows 10 machines. |
| [Dataview - Windows 11 Installation Audit [Compatible Machines]](<../cwa/dataviews//Windows 11 Installation Audit [Compatible Machines].md>)  | Dataview        | Displays the outcome of automation.                                    |
| △ Custom - Install Windows 11 - Compatible Machines | Alert Template  | Executes the script detected by the internal monitor.                  |

## Implementation
1. Implement the Windows 11 Compatibility Audit solution as instructed in this document.  

2. Import the following content using the ProSync Plugin:
    - [Script : Windows 11 Installer](<../cwa/scripts/Windows _11_Installer.md>) 
    - [Internal Monitor : Install Windows 11 - Compatible Machines](<../cwa/monitors/Install Windows 11 - Compatible Machines.md>) 
    - [Dataview : Windows 11 Installation Audit [Compatible Machines]](<../cwa/dataviews//Windows 11 Installation Audit [Compatible Machines].md>) 
    - Alert Template: △ Custom - Install Windows 11 - Compatible Machines

3. Reload the system cache:  
![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_1.png)

4. Configure the solution as outlined below:
    - Navigate to Automation --> Monitors within the CWA Control Center and setup the following:
        - [Internal Monitor : Install Windows 11 - Compatible Machines](<../cwa/monitors/Install Windows 11 - Compatible Machines.md>) 
            - Alert Template: △ Custom - Install Windows 11 - Compatible Machines
            - Right-click and Run Now to start the monitor

## EDF

| Name                             | Type       | Level    | Section     | Description                                                                 |
|----------------------------------|------------|----------|-------------|-----------------------------------------------------------------------------|
| Enable Windows 11 Installation   | Check-Box  | Client   | Default     | Enables automation for the client.                                         |
| Exclude Windows 11 Installation  | Check-Box  | Location | Exclusions  | Exclude location from the automation.                                      |
| Exclude Windows 11 Installation  | Check-Box  | Computer | Exclusions  | Exclude location from the computer.                                        |
| Windows 11 Installation Attempts | Text       | Computer | Default     | A non-editable EDF, updated by [Script : Windows 11 Installer](<../cwa/scripts/Windows _11_Installer.md>)  to keep track of the number of scripts run. |
