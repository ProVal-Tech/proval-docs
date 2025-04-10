---
id: '0c299d28-5fcb-4a1e-a341-1c5e78f74cfb'
slug: /0c299d28-5fcb-4a1e-a341-1c5e78f74cfb
title: 'Site - WingetUpdateAll_Task_Exclude'
title_meta: 'Site - WingetUpdateAll_Task_Exclude'
keywords: ['winget', 'task', 'exclude', 'site', 'windows']
description: 'This document explains how to mark a custom field to exclude a site from the Winget Update All Task creation, specifically for Windows 10 and 11 computers. It details the implications of marking this field and provides a description of the custom field settings.'
tags: ['security', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

Mark this custom field to exclude the site from Winget Update All Task creation and remove the created tasks for the site's Windows 10 and 11 computers.

Marking this custom field will exclude the machines from [CW RMM - Machine Group - Winget Update All (Task Delete)](/docs/a8ce29e2-502c-4bb8-a959-c7eb59e38808) group. The [CW RMM - Task - Scheduled Task Winget Update All (Create)](/docs/a898b5ac-23d0-4e0d-89e5-79bca2277a6e) task will not run on the computers of sites with this custom field marked.

## Details

| Field Name                       | Level | Type | Default Value | Description                                                                                   | Editable |
|----------------------------------|-------|------|---------------|-----------------------------------------------------------------------------------------------|----------|
| WingetUpdateAll_Task_Exclude     | SITE  | Flag | No            | Mark this custom field to exclude the site from Winget Update All Task creation and remove the created task. | Yes      |

## Screenshots

![Screenshot 1](../../../static/img/Site---WingetUpdateAll_Task_Exclude/image_1.png)  
![Screenshot 2](../../../static/img/Site---WingetUpdateAll_Task_Exclude/image_2.png)  


