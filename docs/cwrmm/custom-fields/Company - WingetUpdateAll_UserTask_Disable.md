---
id: '8c8bc8b0-817e-4903-bd09-90df4c25ab9e'
title: 'Company - WingetUpdateAll_UserTask_Disable'
title_meta: 'Company - WingetUpdateAll_UserTask_Disable'
keywords: ['winget', 'scheduled', 'task', 'windows', 'update']
description: 'This document provides instructions on how to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 by setting a custom field to "No". It explains the default settings and includes a detailed table of the field name, type, and description.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

Set this custom field to "No" to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 in the company.

The [CW RMM - Task - Scheduled Task Winget Update All (Create)](<../tasks/Scheduled Task Winget Update All (Create).md>) task will not enable the user-level Winget to update all scheduled tasks by default, as it is set to "Yes".

## Details

| Field Name                              | Level  | Type | Default Value | Description                                                                                                                                       | Editable |
|-----------------------------------------|--------|------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| WingetUpdateAll_UserTask_Disable       | COMPANY| Flag | Yes           | Set this custom field to "No" to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 in the company. | Yes      |

## Screenshots

![Screenshot 1](../../../static/img/Company---WingetUpdateAll_UserTask_Disable/image_1.png)

![Screenshot 2](../../../static/img/Company---WingetUpdateAll_UserTask_Disable/image_2.png)



