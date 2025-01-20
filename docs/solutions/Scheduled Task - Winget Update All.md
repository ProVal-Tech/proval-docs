---
id: 'ba9e49ca-2f53-42ca-94a7-373fd4098527'
title: 'Winget Update Scheduled Tasks for Windows 10 and 11'
title_meta: 'Winget Update Scheduled Tasks for Windows 10 and 11'
keywords: ['winget', 'update', 'scheduled', 'tasks', 'windows', '10', '11']
description: 'This document outlines the implementation of scheduled tasks for updating installed applications using Winget on Windows 10 and 11 machines. It details the necessary custom fields, device groups, and tasks required to automate the update process effectively.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---
## Purpose

The ultimate objective of the solution is to establish and oversee two scheduled tasks designed to update installed applications utilizing Winget on Windows 10 and 11 machines within the environment.

- `Winget Update All [System]` task executes the Winget's `upgrade all command` upon system boot (after network connection) under the SYSTEM context.
- `Winget Update All [Logged on User]` task initiates the Winget's `upgrade all command` upon user login.

**Note**:  
Excluding the client/location/computer will remove both scheduled tasks from the associated endpoint(s). By default, "[WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Company - WingetUpdateAll_UserTask_Disable.md>)" at the company, site, and endpoint level is set to "yes," which means disabled.

To enable the `Winget Update All [Logged on User]`, you need to change the custom field [WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Company - WingetUpdateAll_UserTask_Disable.md>) to "No" for the required company, site, or endpoint level.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
Be sure that user-level scheduled tasks `Winget Update All [Logged on User]` may prompt for UAC to the logged-in user if enabled. ![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  

## Associated Content

### Custom Fields

| Content | Type | Level | Default | Function |
|---------|------|-------|---------|----------|
| [WingetUpdateAll_Task_Create](<../cwrmm/custom-fields/Company - WingetUpdateAll_Task_Create.md>) | Flag | Company | No | Mark this custom field to create Winget Update All (System And Logged on User) tasks for the company's Windows 10 and 11 computers. |
| [WingetUpdateAll_Task_Delete](<../cwrmm/custom-fields/Company - WingetUpdateAll_Task_Delete.md>) | Flag | Company | No | Mark this custom field to delete Winget Update All (System And Logged on User) tasks for the company's Windows 10 and 11 machines. |
| [WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Company - WingetUpdateAll_UserTask_Disable.md>) | Flag | Company | Yes | Set this custom field to "No" to enable the user-level Winget to update all tasks for Windows 10 and 11 of the company. |
| [WingetUpdateAll_Task_Exclude](<../cwrmm/custom-fields/Site - WingetUpdateAll_Task_Exclude.md>) | Flag | Site | No | Mark this custom field to exclude the site from Winget Update All Task creation and remove the created tasks for the site's Windows 10 and 11 computers. |
| [WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Site - WingetUpdateAll_UserTask_Disable.md>) | Flag | Site | No | Set this custom field to "Yes" to disable the user-level Winget to update all tasks for Windows 10 and 11 of the site. |
| [WingetUpdateAll_Task_Exclude](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_Task_Exclude.md>) | Flag | Endpoint | No | Mark this custom field to exclude the computer from Winget Update All Task creation and remove the created tasks for the machine. |
| [WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_UserTask_Disable.md>) | Flag | Endpoint | No | Set this custom field to "Yes" to disable the user-level Winget to update all tasks for the Windows machines. |
| [WingetUpdateAll_Task_Result](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_Task_Result.md>) | Text | Endpoint | No | This custom field stores the outcome of both [Scheduled Task Winget Update All (Create)](<../cwrmm/tasks/Scheduled Task Winget Update All (Create).md>) and [Scheduled Task Winget Update All (Delete)](<../cwrmm/tasks/Scheduled Task Winget Update All (Delete).md>) tasks. It stores whether the task succeeded or failed. |

### Device Groups

| Content | Type | Function |
|---------|------|----------|
| [Winget Update All (Task Create)](<../cwrmm/groups/Winget Update All (Task Create).md>) | Dynamic | This group detects Windows 10 and 11 computers where Winget Update All [System] and Winget Update All [Logged on User] tasks are missing and are opted in the Winget update All Scheduled task creation solution. |
| [Winget Update All (Task Delete)](<../cwrmm/groups/Winget Update All (Task Delete).md>) | Dynamic | This group identifies Windows 10 and 11 computers with the presence of Winget Update All [System] and Winget Update All [Logged on User] tasks and opts to remove these scheduled tasks. |

### Tasks

| Content | Type | Function |
|---------|------|----------|
| [Scheduled Task Winget Update All (Create)](<../cwrmm/tasks/Scheduled Task Winget Update All (Create).md>) | Script Editor | Create the tasks if opted-in for creation. |
| [Scheduled Task Winget Update All (Delete)](<../cwrmm/tasks/Scheduled Task Winget Update All (Delete).md>) | Script Editor | Delete the task if opted-in for deletion. |

## Implementation

### 1.
Create the following custom fields:  
- [Company - WingetUpdateAll_Task_Create](<../cwrmm/custom-fields/Company - WingetUpdateAll_Task_Create.md>)  
- [Company - WingetUpdateAll_Task_Delete](<../cwrmm/custom-fields/Company - WingetUpdateAll_Task_Delete.md>)  
- [Company - WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Company - WingetUpdateAll_UserTask_Disable.md>)  
- [Site - WingetUpdateAll_Task_Exclude](<../cwrmm/custom-fields/Site - WingetUpdateAll_Task_Exclude.md>)  
- [Site - WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/Site - WingetUpdateAll_UserTask_Disable.md>)  
- [Endpoint - WingetUpdateAll_Task_Exclude](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_Task_Exclude.md>)  
- [Endpoint - WingetUpdateAll_Task_Result](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_Task_Result.md>)  
- [Endpoint - WingetUpdateAll_UserTask_Disable](<../cwrmm/custom-fields/EndPoint - WingetUpdateAll_UserTask_Disable.md>)  

### 2.
Create the following device groups:  
- [Winget Update All (Task Create)](<../cwrmm/groups/Winget Update All (Task Create).md>)  
- [Winget Update All (Task Delete)](<../cwrmm/groups/Winget Update All (Task Delete).md>)  

### 3.
Create and deploy the following tasks:  
- [Scheduled Task Winget Update All (Create)](<../cwrmm/tasks/Scheduled Task Winget Update All (Create).md>)  
- [Scheduled Task Winget Update All (Delete)](<../cwrmm/tasks/Scheduled Task Winget Update All (Delete).md>)  













