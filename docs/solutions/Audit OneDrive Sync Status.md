---
id: 'ddfef387-6914-46a5-a805-12dd035abe17'
title: 'Get OneDrive Sync Status'
title_meta: 'Get OneDrive Sync Status'
keywords: ['onedrive', 'sync', 'status', 'monitor', 'script']
description: 'This document provides a comprehensive guide on retrieving and displaying the OneDrive Sync Status using the Get-ODStatus.ps1 script, including associated content for auditing and alerting, as well as implementation steps for system configuration.'
tags: ['alerting', 'windows']
draft: false
unlisted: false
---
## Purpose

The solution aims to retrieve and display the OneDrive Sync Status using the [Get-ODStatus.ps1](https://github.com/rodneyviana/ODSyncUtil/blob/master/ODSyncUtil/Get-ODStatus.ps1) script.

## Associated Content

#### Auditing

| Content                                                                                         | Type          | Function                                         |
|-------------------------------------------------------------------------------------------------|---------------|--------------------------------------------------|
| [Script - Get OneDrive Sync Status [DV]](<../cwa/scripts/Get OneDrive Sync Status DV.md>)      | Script        | The script fetches the data.                     |
| [pvl_odsync_status](<../cwa/tables/pvl_odsync_status.md>)                          | Custom Table  | The custom table stores the data.                |
| [Dataview - OneDrive Sync Status [Script]](<../cwa/dataviews/OneDrive Sync Status Script.md>)   | Dataview      | The dataview displays the data.                  |
| [Internal Monitor - Execute Script - Get OneDrive Sync Status [DV]](<../cwa/monitors/Execute Script - Get OneDrive Sync Status DV.md>) | Internal Monitor | The internal monitor detects the relevant computers. |
| Alert Template - △ Custom - Execute Script - Get OneDrive Sync Status [DV]                    | Alert Template | The alert template executes the script.          |

#### Alerting

| Content                                                                                                      | Type            | Function                                         |
|--------------------------------------------------------------------------------------------------------------|-----------------|--------------------------------------------------|
| [Internal Monitor - ProVal - Production - OneDrive Sync Failures](<../cwa/monitors/OneDrive Sync Failures.md>) | Internal Monitor | Detects the problematic machines.                 |
| [Script - Ticket Creation - Computer](<../cwa/scripts/Ticket Creation - Computer.md>)                       | Autofix Script  | Manages ticketing.                               |
| △ Custom - Ticket Creation - Computer                                                                         | Alert Template   | Executes the script against the computers detected by the Internal Monitor. |

## Implementation

### 1.
**Remove the following** items if they exist (This is the old solution):
- [Script - Microsoft OneDrive Sync Status [DV]](<../cwa/scripts/Microsoft OneDrive Sync Status DV.md>)  
  - _If you get an error stating the script is running_, navigate to the System Dashboard --> Management --> Scripts --> Remove this script from that list by Right-Clicking and selecting 'Kill Script'
    - Then proceed to delete the script
- Dataview - Microsoft OneDrive Sync Status [Script]
- [Internal Monitor - OneDrive Sync Status Issue](<../cwa/monitors/OneDrive Sync Status Issue.md>)
- [Internal Monitor - Execute Script - Microsoft OneDrive Sync Status](<../cwa/monitors/Execute Script - Microsoft OneDrive Sync Status.md>)  
- Alert Template - `△ CUSTOM - Execute Script - Microsoft OneDrive Sync Status`

### 2.
**Import the following** content using the ProSync Plugin:
- [Script - Get OneDrive Sync Status [DV]](<../cwa/scripts/Get OneDrive Sync Status DV.md>)  
- [Dataview - OneDrive Sync Status [Script]](<../cwa/dataviews/OneDrive Sync Status Script.md>)  
- [Internal Monitor - Execute Script - Get OneDrive Sync Status [DV]](<../cwa/monitors/Execute Script - Get OneDrive Sync Status DV.md>)  
- △ Custom - Execute Script - Get OneDrive Sync Status [DV]

### 3.
Reload the system cache:  
![Reload Cache](../../static/img/Audit-OneDrive-Sync-Status/image_1.png)

### 4.
Run the script against any online Windows machine with the `Set_Environment` parameter set to `1` to create the custom table [pvl_odsync_status](<../cwa/tables/pvl_odsync_status.md>).  
![Run Script](../../static/img/Audit-OneDrive-Sync-Status/image_2.png)

### 5.
Configure the solution as outlined below:
- Navigate to Automation --> Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - Execute Script - Get OneDrive Sync Status [DV]](<../cwa/monitors/Execute Script - Get OneDrive Sync Status DV.md>)  
    - Alert Template: `△ Custom - Execute Script - Get OneDrive Sync Status [DV]`
    - Right-click and Run Now to start the monitor

#### Optional Alerting

The following steps to import and implement the Alerting section should only be performed if the partner chooses to opt-in.

### 1.
**Import/Update the following** content using the ProSync Plugin:
- [Internal Monitor - ProVal - Production - OneDrive Sync Failures](<../cwa/monitors/OneDrive Sync Failures.md>)  
- [Script - Get OneDrive Sync Status [DV]](<../cwa/scripts/Get OneDrive Sync Status DV.md>)  
- Alert Template - △ Custom - Ticket Creation - Computer

### 2.
Reload the system cache:  
![Reload Cache](../../static/img/Audit-OneDrive-Sync-Status/image_1.png)

### 3.
Configure the solution as outlined below:
- Navigate to Automation --> Monitors within the CWA Control Center and setup the following:
  - [Internal Monitor - ProVal - Production - OneDrive Sync Failures](<../cwa/monitors/OneDrive Sync Failures.md>)  
    - Alert Template: `△ Custom - Ticket Creation - Computer`
    - Right-click and Run Now to start the monitor












