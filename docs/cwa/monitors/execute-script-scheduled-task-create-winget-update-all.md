---
id: '2f324c74-1e32-4c48-b567-abbeebdabe6d'
slug: /2f324c74-1e32-4c48-b567-abbeebdabe6d
title: 'Execute Script - Scheduled Task - Create - Winget Update All'
title_meta: 'Execute Script - Scheduled Task - Create - Winget Update All'
keywords: ['scheduled', 'task', 'winget', 'update', 'windows']
description: 'This document outlines the process for executing a scheduled task that creates Winget Update All tasks on Windows 10 and 11 workstations. It details the necessary client-level and location-level EDFs for managing task initiation and exclusions.'
tags: ['software', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

The monitor executes the [Script - Scheduled Task - Create - Winget Update All [Autofix]](/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1) script on the Windows workstations (Windows 10 and 11) where either the `Winget Update All [Logged on User]` or `Winget Update All [System]` scheduled tasks are missing.

1. Ensure that the **Client-Level EDF** named `Winget Update All Task - Create` is checked to initiate the task.
2. If needed, you can utilize the **Location-Level** and **Computer-Level EDFs** named `Winget Update All Task - Exclude` to exclude specific machine(s).

## Dependencies

[Script - Scheduled Task - Create - Winget Update All [Autofix]](/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1)

## Target

Managed Windows Workstations

![Image](../../../static/img/docs/2f324c74-1e32-4c48-b567-abbeebdabe6d/image_1.webp)

## Alert Template

**Name**: `△ CUSTOM - Execute Script - Scheduled Task - Create - Winget Update All`

The alert template executes the [Script - Scheduled Task - Create - Winget Update All [Autofix]](/docs/4bb08610-f80b-4c5a-8e13-b6db095484c1)