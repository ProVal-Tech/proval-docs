---
id: 'cwa-winget-update-all-scheduled-tasks'
title: 'Winget Update All Scheduled Tasks'
title_meta: 'Winget Update All Scheduled Tasks for Windows 10 and 11'
keywords: ['winget', 'scheduled', 'tasks', 'windows', 'update']
description: 'This document outlines the implementation of scheduled tasks using Winget to update installed applications on Windows 10 and 11 machines. It provides detailed instructions on creating, deleting, and monitoring these tasks, as well as addressing common questions related to their management.'
tags: ['windows', 'update', 'scheduled', 'monitoring', 'automation']
draft: false
unlisted: false
---
## Purpose

The ultimate objective of the solution is to establish and oversee two scheduled tasks designed to update installed applications utilizing Winget on Windows 10 and 11 machines within the environment.

- `Winget Update All [System]` task executes the Winget's `upgrade all command` upon system boot (after network connection) under the SYSTEM context.
- `Winget Update All [Logged on User]` task initiates the Winget's `upgrade all command` upon user login.

**Note:** Excluding the client/location/computer will remove both scheduled tasks from the associated endpoint(s).

## Associated Content

### Script

| Content                                                                 | Type   | Function                     |
|-------------------------------------------------------------------------|--------|------------------------------|
| [Script - Scheduled Task - Create - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-14825195) | Script | Creates the tasks.           |
| [Script - Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949) | Script | Deletes the tasks.           |

### Internal Monitor

| Content                                                                 | Type             | Function                                                   |
|-------------------------------------------------------------------------|------------------|------------------------------------------------------------|
| [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](https://proval.itglue.com/DOC-5078775-14825214) | Internal Monitor | Detects the Windows 10 and 11 machines where either of the tasks are missing. |
| [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948) | Internal Monitor | Detects the Windows 10 and 11 machines where either of the tasks are present but are excluded. |

### Alert template

| Content                                                                 | Type          | Function                                                                                                     |
|-------------------------------------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------|
| △ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All | Alert Template | Executes the [Script - Scheduled Task - Create - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-14825195) against the computers detected by the [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](https://proval.itglue.com/DOC-5078775-14825214) |
| △ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All | Alert Template | Executes the [Script - Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949) against the computers detected by the [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948) |

## Implementation

1. Import the following scripts from the ProSync plugin:
   - [Script - Scheduled Task - Create - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-14825195)
   - [Script - Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949)

2. Import the following internal monitors from the ProSync plugin:
   - [Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](https://proval.itglue.com/DOC-5078775-14825214)
   - [Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948)

3. Import the following alert templates from the ProSync plugin:
   - △ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All
   - △ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All

4. Reload the system cache.
   ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_1.png)

5. Execute the [Script - Scheduled Task - Create - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-14825195) against any online Windows 10 or Windows 11 computer with the `SetEnvironment` parameter to `1` to create the system property and the EDFs.
   ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_2.png)

6. Configure the Extra Data Fields to initiate the solution as described in this document: [Script - Scheduled Task - Create - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-14825195).
   
   **Note:** Marking the client-level EDF `Winget Update All Task - Create` will initiate the solution for the client.

7. Configure the solution as follows:

   Navigate to Automation → Monitors within the CWA Control Center and setup the following:

   - [CWM - Automate - Internal Monitor - Execute Script - Scheduled Task - Create - Winget Update All](https://proval.itglue.com/DOC-5078775-14825214)
     - Configure with the alert template: `△ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All`
     - Right-click and Run Now to start the monitor

   - [CWM - Automate - Internal Monitor - Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948)
     - Configure with the alert template: `△ CUSTOM - Execute Script - Scheduled Task - Delete - Winget Update All`
     - Right-click and Run Now to start the monitor

## FAQ

**Q:** How to disable the `Winget Update All [Logged on User]` task on the endpoints?  
**A:**
- For Environment-Level Changes
  - Set the `Winget_Disable_User_Level_Scheduled_Task` system property to `1`.  
  ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_3.png)
  - Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](https://proval.itglue.com/DOC-5078775-14825940) article for the **Environment Level Changes**.

- For Client-Level Changes
  - Flag the Client-Level EDF `Winget User Level Task - Disable`.  
  ![Image](../../static/img/Scheduled-Tasks---Winget-Update-All/image_4.png)
  - Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](https://proval.itglue.com/DOC-5078775-14825940) article for the **Client Level Changes**.

**Q:** How to recreate the tasks on all Windows 10 and 11 computers in the environment?  
**A:** Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](https://proval.itglue.com/DOC-5078775-14825940) article for the **Environment Level Changes**.

**Q:** How to recreate the tasks on all Windows 10 and 11 computers for a particular client?  
**A:** Follow the steps described in the [Reset - Extra Data Field - Winget_update_all_task_created](https://proval.itglue.com/DOC-5078775-14825940) article for the **Client Level Changes**.

**Q:** How to delete the tasks created on an endpoint?  
**A:** Upon marking the Computer-Level EDF `Winget Update All Task - Exclude`, the [Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949) script to remove the tasks from the endpoint.

**Q:** How to remove the tasks from all machines of a location?  
**A:** Upon marking the Location-Level EDF `Winget Update All Task - Exclude`, the [Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949) script to remove the tasks from all Windows 10 and 11 machines of the location.

**Q:** How to remove the tasks from all machines of a client?  
**A:** Upon Un-marking the Client-Level EDF `Winget Update All Task - Create`, the [Execute Script - Scheduled Task - Delete - Winget Update All](https://proval.itglue.com/DOC-5078775-15226948) internal monitor executes the [Scheduled Task - Delete - Winget Update All [Autofix]](https://proval.itglue.com/DOC-5078775-15226949) script to remove the tasks from all Windows 10 and 11 machines of the client.



