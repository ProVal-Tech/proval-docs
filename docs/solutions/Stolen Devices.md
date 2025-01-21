---
id: '7284d09c-ce9b-4916-847b-b61688aff7f0'
title: 'Locking Down Stolen Systems in ConnectWise Automate'
title_meta: 'Locking Down Stolen Systems in ConnectWise Automate'
keywords: ['lockdown', 'stolen', 'monitor', 'script', 'security']
description: 'This document provides a comprehensive guide for technicians on how to detect and lockdown machines marked as stolen within a ConnectWise Automate environment. It includes implementation steps, associated scripts, and internal monitors to effectively manage stolen systems.'
tags: ['security', 'software']
draft: false
unlisted: false
---

## Purpose

The purpose of this solution is to detect and lockdown machines that are marked as stolen. This article will help guide technicians in implementing the solution within a ConnectWise Automate environment.

## Associated Content

| Content                                                                                                                                              | Type             | Function                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------|------------------|--------------------------------------------------------------------|
| [SEC - Encryption - Script - Lock Stolen System](<../cwa/scripts/Lock Stolen System.md>)                                                         | Script           | Tracks and locks down stolen systems.                               |
| [SEC - Security - Internal Monitor - EDF-Based Stolen Systems Monitor](<../cwa/monitors/EDF-Based Stolen Systems Monitor.md>)                     | Internal Monitor  | Detects online machines where the `Mark As Stolen` EDF is marked. |
| △ CUSTOM - Execute Script - Lock Stolen System                                                                                                     | Alert Template    | Executes the script against the computers detected by the internal monitor. |

## Implementation

- Read the solution-related documents carefully.
- Import the script [SEC - Encryption - Script - Lock Stolen System](<../cwa/scripts/Lock Stolen System.md>).
- Reload the system cache and ensure that the EDFs mentioned in the script's document are properly imported.
- Create/import the `Marked as Stolen` search, which should look for machines where the `Mark System As Stolen` EDF is marked.  
  ![Marked as Stolen Search](../../static/img/Stolen-Devices/image_1.png)
- Create/import the `Marked as Stolen` group, which should use the `Marked as Stolen` search as an Autojoin search.  
  ![Marked as Stolen Group](../../static/img/Stolen-Devices/image_2.png)
- Import the internal monitor [SEC - Security - Internal Monitor - EDF-Based Stolen Systems Monitor](<../cwa/monitors/EDF-Based Stolen Systems Monitor.md>).
- Limit the monitor set to the `Marked as Stolen` group.  
  ![Limit Monitor Set](../../static/img/Stolen-Devices/image_3.png)
- Import/create the `△ CUSTOM - Execute Script - Lock Stolen System` alert template. It should execute the [SEC - Encryption - Script - Lock Stolen System](<../cwa/scripts/Lock Stolen System.md>) script on failure.
- Assign the alert template to the monitor set.
- Mark the `Mark System As Stolen` EDF on the concerned computers. Marking the `System Lockdown` EDF will enable the script's feature to BitLocker and shutdown the computer.  
  ![Mark System As Stolen](../../static/img/Stolen-Devices/image_4.png)

