---
id: 'rmm-exclude-winget-update'
title: 'Exclude Site from Winget Update All Task'
title_meta: 'Exclude Site from Winget Update All Task'
keywords: ['winget', 'task', 'exclude', 'site', 'windows']
description: 'This document explains how to mark a custom field to exclude a site from the Winget Update All Task creation, specifically for Windows 10 and 11 computers. It details the implications of marking this field and provides a description of the custom field settings.'
tags: ['task', 'windows', 'configuration', 'update', 'security']
draft: false
unlisted: false
---
## Summary

Mark this custom field to exclude the site from Winget Update All Task creation and remove the created tasks for the site's Windows 10 and 11 computers.

Marking this custom field will exclude the machines from [CW RMM - Machine Group - Winget Update All (Task Delete)](https://proval.itglue.com/DOC-5078775-15702936) group. The [CW RMM - Task - Scheduled Task Winget Update All (Create)](https://proval.itglue.com/DOC-5078775-15702931) task will not run on the computers of sites with this custom field marked.

## Details

| Field Name                        | Level | Type | Default Value | Description                                                                                     | Editable |
|-----------------------------------|-------|------|---------------|-------------------------------------------------------------------------------------------------|----------|
| WingetUpdateAll_Task_Exclude      | SITE  | Flag | No            | Mark this custom field to exclude the site from Winget Update All Task creation and remove the created task. | Yes      |

## ScreenShot

![Screenshot 1](..\..\..\static\img\Site---WingetUpdateAll_Task_Exclude\image_1.png)  
![Screenshot 2](..\..\..\static\img\Site---WingetUpdateAll_Task_Exclude\image_2.png)  


