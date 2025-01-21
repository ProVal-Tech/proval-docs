---
id: '16acceef-5282-42e0-840c-8b8e5af8058f'
title: 'Winget Update All Scheduled Tasks'
title_meta: 'Winget Update All Scheduled Tasks for Windows 10 and 11'
keywords: ['winget', 'scheduled', 'tasks', 'windows', 'update']
description: 'This document outlines the implementation of scheduled tasks using Winget to update installed applications on Windows 10 and 11 machines. It provides detailed instructions on creating, deleting, and monitoring these tasks, as well as addressing common questions related to their management.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Purpose

The ultimate objective of this solution is to establish and oversee two scheduled tasks designed to update installed applications utilizing Winget on Windows 10 and 11 machines within the environment.

- The `Winget Update All [System]` task executes Winget's `upgrade all` command upon system boot (after network connection) under the SYSTEM context.
- The `Winget Update All [Logged on User]` task initiates Winget's `upgrade all` command upon user login.

**Note:** Excluding the client/location/computer will remove both scheduled tasks from the associated endpoint(s).

## Associated Content

### Script

| Content                                                                 | Type   | Function                     |
|-------------------------------------------------------------------------|--------|------------------------------|
| [Script - Scheduled Task - Create - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Create - Winget Update All Autofix.md>) | Script | Creates the tasks.           |
| [Script - Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>) | Script | Deletes the tasks.           |

### Internal Monitor

| Content                                                                 | Type             | Function                                                   |
|-------------------------------------------------------------------------|------------------|------------------------------------------------------------|
| [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Create - Winget Update All.md>) | Internal Monitor | Detects the Windows 10 and 11 machines where either of the tasks are missing. |
| [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>) | Internal Monitor | Detects the Windows 10 and 11 machines where either of the tasks are present but are excluded. |

### Alert Template

| Content                                                                 | Type          | Function                                                                                                     |
|-------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------|
| △ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All | Alert Template | Executes the [Script - Scheduled Task - Create - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Create - Winget Update All Autofix.md>) against the computers detected by the [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Create - Winget Update All.md>) |
| △ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All | Alert Template | Executes the [Script - Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>) against the computers detected by the [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>) |

## Implementation

1. Import the following scripts from the ProSync plugin:
   - [Script - Scheduled Task - Create - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Create - Winget Update All Autofix.md>)
   - [Script - Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>)

2. Import the following internal monitors from the ProSync plugin:
   - [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Create - Winget Update All.md>)
   - [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>)

3. Import the following alert templates from the ProSync plugin:
   - △ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All
   - △ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All

4. Reload the system cache.
   ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_1.png)

5. Execute the [Script - Scheduled Task - Create - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Create - Winget Update All Autofix.md>) against any online Windows 10 or Windows 11 computer with the `SetEnvironment` parameter set to `1` to create the system property and the EDFs.
   ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_2.png)

6. Configure the Extra Data Fields to initiate the solution as described in this document: [Script - Scheduled Task - Create - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Create - Winget Update All Autofix.md>).

   **Note:** Marking the client-level EDF `Winget Update All Task - Create` will initiate the solution for the client.

7. Configure the solution as follows:

   Navigate to Automation → Monitors within the CWA Control Center and set up the following:

   - [CWM - Automate - Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Create - Winget Update All.md>)
     - Configure with the alert template: `△ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All`
     - Right-click and Run Now to start the monitor

   - [CWM - Automate - Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>)
     - Configure with the alert template: `△ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All`
     - Right-click and Run Now to start the monitor

## FAQ

**Q:** How to disable the `Winget Update All [Logged on User]` task on the endpoints?  
**A:**
- For Environment-Level Changes
  - Set the `Winget_Disable_User_Level_Scheduled_Task` system property to `1`.  
  ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_3.png)
  - Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](<../cwa/monitors/Reset - Extra Data Field - Winget_update_all_task_created.md>) article for the **Environment Level Changes**.

- For Client-Level Changes
  - Flag the Client-Level EDF `Winget User Level Task - Disable`.  
  ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_4.png)
  - Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](<../cwa/monitors/Reset - Extra Data Field - Winget_update_all_task_created.md>) article for the **Client Level Changes**.

**Q:** How to recreate the tasks on all Windows 10 and 11 computers in the environment?  
**A:** Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](<../cwa/monitors/Reset - Extra Data Field - Winget_update_all_task_created.md>) article for the **Environment Level Changes**.

**Q:** How to recreate the tasks on all Windows 10 and 11 computers for a particular client?  
**A:** Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](<../cwa/monitors/Reset - Extra Data Field - Winget_update_all_task_created.md>) article for the **Client Level Changes**.

**Q:** How to delete the tasks created on an endpoint?  
**A:** Upon marking the Computer-Level EDF `Winget Update All Task - Exclude`, the [Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>) script to remove the tasks from the endpoint.

**Q:** How to remove the tasks from all machines of a location?  
**A:** Upon marking the Location-Level EDF `Winget Update All Task - Exclude`, the [Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>) script to remove the tasks from all Windows 10 and 11 machines of the location.

**Q:** How to remove the tasks from all machines of a client?  
**A:** Upon unmarking the Client-Level EDF `Winget Update All Task - Create`, the [Execute Script - Scheduled Task - Delete - Winget Update All](<../cwa/monitors/Execute Script - Scheduled Task - Delete - Winget Update All.md>) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](<../cwa/scripts/Scheduled Task - Delete - Winget Update All Autofix.md>) script to remove the tasks from all Windows 10 and 11 machines of the client.
