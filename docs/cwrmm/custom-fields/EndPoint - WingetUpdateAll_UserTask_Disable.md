---
id: '8022b663-4923-47d5-b8c7-7ba24aae305d'
title: 'EndPoint - WingetUpdateAll_UserTask_Disable'
title_meta: 'EndPoint - WingetUpdateAll_UserTask_Disable'
keywords: ['scheduled', 'task', 'winget', 'update', 'windows']
description: 'This document explains how to set a custom field to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows machines. It includes details about the necessary configuration and the default settings for the task.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

Set this custom field to "No" to enable the user-level scheduled task `Winget Update All [Logged on User]` for Windows machines.

The [CW RMM - Task - Scheduled Task Winget Update All (Create)](<../tasks/Scheduled Task Winget Update All (Create).md>) task will not enable the user-level Winget to update all scheduled tasks by default, as it is set to "Yes".

## Details

| Field Name                             | Level    | Type | Default Value | Description                                                                                                           | Editable |
|----------------------------------------|----------|------|---------------|-----------------------------------------------------------------------------------------------------------------------|----------|
| WingetUpdateAll_UserTask_Disable      | ENDPOINT | Flag | No            | Set this custom field to "Yes" to disable the user-level scheduled task `Winget Update All [Logged on User]` for Windows 10 and 11 on Windows machines. | Yes      |

## Screenshots

![Screenshot 1](../../../static/img/EndPoint---WingetUpdateAll_UserTask_Disable/image_1.png)
![Screenshot 2](../../../static/img/EndPoint---WingetUpdateAll_UserTask_Disable/image_2.png)



