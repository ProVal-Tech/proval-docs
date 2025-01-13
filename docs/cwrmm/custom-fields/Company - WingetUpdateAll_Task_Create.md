---
id: 'rmm-winget-update-all-tasks'
title: 'Winget Update All Tasks for Windows 10 and 11'
title_meta: 'Winget Update All Tasks for Windows 10 and 11'
keywords: ['winget', 'update', 'tasks', 'windows', 'custom', 'field']
description: 'This document explains how to mark a custom field to create Winget Update All tasks for Windows 10 and 11 computers within the company. It details the necessary configuration to automatically add machines to the designated machine group and the requirements for running scheduled tasks.'
tags: ['company', 'configuration', 'windows', 'task', 'flag']
draft: false
unlisted: false
---
## Summary

Mark this custom field to create Winget Update All (System And Logged on User) tasks for the company's Windows 10 and 11 computers. 

Marking this custom field will automatically add the machines to [CW RMM - Machine Group - Winget Update All (Task Create)](https://proval.itglue.com/DOC-5078775-15702935) group.

This custom field must be marked on the company level to run [CW RMM - Task - Scheduled Task Winget Update All (Create)](https://proval.itglue.com/DOC-5078775-15702931) task.

## Details

| Field Name                     | Level  | Type | Default Value | Description                                                                 | Editable |
|--------------------------------|--------|------|---------------|-----------------------------------------------------------------------------|----------|
| WingetUpdateAll_Task_Create    | COMPANY | Flag | No            | Mark this custom field to create Winget Update All (System And Logged on User) tasks for the company. | Yes      |

## Screenshot

![Screenshot 1](../../../static/img/Company---WingetUpdateAll_Task_Create/image_1.png)
![Screenshot 2](../../../static/img/Company---WingetUpdateAll_Task_Create/image_2.png)



