---
id: 'rmm-winget-update-all-user-task'
title: 'Enable User-Level Scheduled Task for Winget Update All'
title_meta: 'Enable User-Level Scheduled Task for Winget Update All in Windows 10 and 11'
keywords: ['winget', 'scheduled', 'task', 'windows', 'user', 'update']
description: 'This document explains how to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 by setting a custom field to "No". It also describes the default behavior of the related task and provides a detailed table of the relevant field settings.'
tags: ['windows', 'configuration', 'update', 'task', 'screenshot']
draft: false
unlisted: false
---
## Summary

Set this custom field to "No" to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 of the site.

[CW RMM - Task - Scheduled Task Winget Update All (Create)](https://proval.itglue.com/DOC-5078775-15702931) task will not enable the user-level Winget to update all scheduled tasks by default as it is set to "Yes".

## Details

| Field Name                          | Level | Type | Default Value | Description                                                                                                        | Editable |
|-------------------------------------|-------|------|---------------|--------------------------------------------------------------------------------------------------------------------|----------|
| WingetUpdateAll_UserTask_Disable   | SITE  | Flag | No            | Set this custom field to "Yes" to disable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 of the site. | Yes      |

## Screenshot

![Screenshot 1](../../../static/img/Site---WingetUpdateAll_UserTask_Disable/image_1.png)
![Screenshot 2](../../../static/img/Site---WingetUpdateAll_UserTask_Disable/image_2.png)



