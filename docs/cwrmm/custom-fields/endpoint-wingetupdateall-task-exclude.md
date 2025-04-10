---
id: '91965ea0-f912-4f5d-8e42-c9ee546293a9'
slug: /91965ea0-f912-4f5d-8e42-c9ee546293a9
title: 'EndPoint - WingetUpdateAll_Task_Exclude'
title_meta: 'EndPoint - WingetUpdateAll_Task_Exclude'
keywords: ['winget', 'update', 'exclusion', 'task', 'computer']
description: 'This document outlines how to mark a custom field to exclude a computer from the Winget Update All Task creation in ConnectWise RMM. It provides details on the specific field, its properties, and how to manage tasks related to Winget updates for machines.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

Mark this custom field to exclude the computer from Winget Update All Task creation and remove the created tasks for the machine.

Marking this custom field will exclude the machine from the [CW RMM - Machine Group - Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808) group. The [CW RMM - Task - Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e) task will not run on the computer with this custom field marked.

## Details

| Field Name                        | Level    | Type | Default Value | Description                                                                 | Editable |
|-----------------------------------|----------|------|---------------|-----------------------------------------------------------------------------|----------|
| WingetUpdateAll_Task_Exclude      | ENDPOINT | Flag | No            | Mark this custom field to exclude the computer from Winget Update All Task creation and remove the created task. | Yes      |

## Screenshots

![Screenshot 1](../../../static/img/EndPoint---WingetUpdateAll_Task_Exclude/image_1.png) 
![Screenshot 2](../../../static/img/EndPoint---WingetUpdateAll_Task_Exclude/image_2.png)


