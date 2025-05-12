---
id: 'ba9e49ca-2f53-42ca-94a7-373fd4098527'
slug: /ba9e49ca-2f53-42ca-94a7-373fd4098527
title: 'Scheduled Task - Winget Update All'
title_meta: 'Scheduled Task - Winget Update All'
keywords: ['winget', 'update', 'scheduled', 'tasks', 'windows', '10', '11']
description: 'This document outlines the implementation of scheduled tasks for updating installed applications using Winget on Windows 10 and 11 machines. It details the necessary custom fields, device groups, and tasks required to automate the update process effectively.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Purpose

The ultimate objective of this solution is to establish and oversee two scheduled tasks designed to update installed applications utilizing Winget on Windows 10 and 11 machines within the environment.

- The `Winget Update All [System]` task executes Winget's `upgrade all command` upon system boot (after network connection) under the SYSTEM context.
- The `Winget Update All [Logged on User]` task initiates Winget's `upgrade all command` upon user login.

**Note**:  
Excluding the client/location/computer will remove both scheduled tasks from the associated endpoint(s). By default, "[WingetUpdateAll_UserTask_Disable](/docs/8c8bc8b0-817e-4903-bd09-90df4c25ab9e)" at the company, site, and endpoint level is set to "yes," which means disabled.

To enable the `Winget Update All [Logged on User]`, you need to change the custom field [WingetUpdateAll_UserTask_Disable](/docs/8c8bc8b0-817e-4903-bd09-90df4c25ab9e) to "No" for the required company, site, or endpoint level.

![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  
Be aware that user-level scheduled tasks `Winget Update All [Logged on User]` may prompt for UAC to the logged-in user if enabled. ![Police Car Light](https://c.tenor.com/8vSJsVW-1pQAAAAj/police-car-light-joypixels.gif)  

## Associated Content

### Custom Fields

| Content | Type | Level | Default | Function |
|---------|------|-------|---------|----------|
| [WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1) | Flag | Company | No | Mark this custom field to create Winget Update All (System And Logged on User) tasks for the company's Windows 10 and 11 computers. |
| [WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a) | Flag | Company | No | Mark this custom field to delete Winget Update All (System And Logged on User) tasks for the company's Windows 10 and 11 machines. |
| [WingetUpdateAll_UserTask_Disable](/docs/8c8bc8b0-817e-4903-bd09-90df4c25ab9e) | Flag | Company | Yes | Set this custom field to "No" to enable the user-level Winget update all tasks for Windows 10 and 11 of the company. |
| [WingetUpdateAll_Task_Exclude](/docs/0c299d28-5fcb-4a1e-a341-1c5e78f74cfb) | Flag | Site | No | Mark this custom field to exclude the site from Winget Update All Task creation and remove the created tasks for the site's Windows 10 and 11 computers. |
| [WingetUpdateAll_UserTask_Disable](/docs/280aafc8-9ab0-4cca-b499-d107b47de432) | Flag | Site | No | Set this custom field to "Yes" to disable the user-level Winget update all tasks for Windows 10 and 11 of the site. |
| [WingetUpdateAll_Task_Exclude](/docs/91965ea0-f912-4f5d-8e42-c9ee546293a9) | Flag | Endpoint | No | Mark this custom field to exclude the computer from Winget Update All Task creation and remove the created tasks for the machine. |
| [WingetUpdateAll_UserTask_Disable](/docs/8022b663-4923-47d5-b8c7-7ba24aae305d) | Flag | Endpoint | No | Set this custom field to "Yes" to disable the user-level Winget update all tasks for the Windows machines. |
| [WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f) | Text | Endpoint | No | This custom field stores the outcome of both [Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e) and [Scheduled Task Winget Update All (Delete)](/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95) tasks. It stores whether the task succeeded or failed. |

### Device Groups

| Content | Type | Function |
|---------|------|----------|
| [Winget Update All (Task Create)](/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7) | Dynamic | This group detects Windows 10 and 11 computers where Winget Update All [System] and Winget Update All [Logged on User] tasks are missing and are opted in for the Winget Update All Scheduled task creation solution. |
| [Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808) | Dynamic | This group identifies Windows 10 and 11 computers with the presence of Winget Update All [System] and Winget Update All [Logged on User] tasks and opts to remove these scheduled tasks. |

### Tasks

| Content | Type | Function |
|---------|------|----------|
| [Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e) | Script Editor | Create the tasks if opted-in for creation. |
| [Scheduled Task Winget Update All (Delete)](/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95) | Script Editor | Delete the task if opted-in for deletion. |

## Implementation

### 1.
Create the following custom fields:  
- [Company - WingetUpdateAll_Task_Create](/docs/40e64c1d-ca29-4c85-9a72-a48b1082b8e1)  
- [Company - WingetUpdateAll_Task_Delete](/docs/a398be5b-5709-4ab5-ac33-7feca8fbc00a)  
- [Company - WingetUpdateAll_UserTask_Disable](/docs/8c8bc8b0-817e-4903-bd09-90df4c25ab9e)  
- [Site - WingetUpdateAll_Task_Exclude](/docs/0c299d28-5fcb-4a1e-a341-1c5e78f74cfb)  
- [Site - WingetUpdateAll_UserTask_Disable](/docs/280aafc8-9ab0-4cca-b499-d107b47de432)  
- [Endpoint - WingetUpdateAll_Task_Exclude](/docs/91965ea0-f912-4f5d-8e42-c9ee546293a9)  
- [Endpoint - WingetUpdateAll_Task_Result](/docs/a6ff85ad-b8e9-4e0f-9e2f-db964d483e5f)  
- [Endpoint - WingetUpdateAll_UserTask_Disable](/docs/8022b663-4923-47d5-b8c7-7ba24aae305d)  

### 2.
Create the following device groups:  
- [Winget Update All (Task Create)](/docs/22ee8d54-e19d-4b47-9ccd-c45c259f8fb7)  
- [Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808)  

### 3.
Create and deploy the following tasks:  
- [Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e)  
- [Scheduled Task Winget Update All (Delete)](/docs/aca364ec-208f-47e8-a838-11b8ee0c9f95)  