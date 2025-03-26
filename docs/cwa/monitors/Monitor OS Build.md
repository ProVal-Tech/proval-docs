---
id: 'd8ec2315-c425-41f0-a4a9-3f8aa3e61fc4'
slug: /d8ec2315-c425-41f0-a4a9-3f8aa3e61fc4
title: 'Monitor OS Build'
title_meta: 'Monitor OS Build'
keywords: ['monitor', 'os', 'build', 'update', 'windows']
description: 'This document outlines a remote monitor designed to detect changes in the operating system build number of Windows machines. Upon detecting a change, it triggers a script to update the latest installed cumulative update information in the relevant database table. It includes suggestions for configuration and alert styles.'
tags: ['database', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this remote monitor is to detect any changes in the machine's OS build number. If a change is detected, it will run the [CWM - Automate - Script - Get Latest Installed Cumulative Update](/docs/bd99d6b2-2d31-4611-9682-3c8518c53998) script on the machine to update information in the [pvl_win_latest_installed_cu](/docs/c03e4def-7efe-4a8b-99e9-d99ac2c65f5a) table.

## Details

**Suggested "Limit to"**: `Windows OS excluding EOL machines such as Server 2003, 2008, 2012, Windows 7, XP, 8, etc.`  
**Suggested Alert Style**: `Continuous`  
**Suggested Alert Template**: `△ Custom - Execute Script - Get Latest Installed Cumulative Update`  

Insert the details of the monitor in the table below.

| Check Action | Server Address | Check Type | Execute Info | Comparator   | Interval | Result |
|--------------|----------------|-------------|---------------|---------------|----------|--------|
| System       | 127.0.0.1     | Run File    | **REDACTED**  | State Based    | 3600     | ![Result](../../../static/img/CWM---Automate---Remote-Monitor---Monitor-OS-Build/image_1.png) |

## Target

Windows OS

## How To Import

[Implement - Remote Monitor - Monitor OS Build](<./Import%20-%20Remote%20Monitor%20-%20Monitor%20OS%20Build.md>)
