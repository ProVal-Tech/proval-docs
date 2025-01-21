---
id: 'e0515cd5-5dab-444c-a7c4-47f1fa80bff4'
title: 'SMB1'
title_meta: 'SMB1'
keywords: ['smb1', 'monitor', 'disable', 'task', 'custom', 'field']
description: 'This document outlines the process to monitor and disable SMB1, providing detailed steps for implementing associated tasks and monitors within the ConnectWise RMM platform. It includes links to custom fields and tasks that facilitate the detection and disabling of SMB1 on target machines.'
tags: ['security']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to monitor and disable SMB1, either automatically or through the manual execution of a task.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753)      | Custom Field | Stores and displays the result gathered by the script [CW RMM - Task - Detect SMB1](<../cwrmm/tasks/Detect SMB1.md>)                                                                                                                  |
| [CW RMM - Task - Detect SMB1](<../cwrmm/tasks/Detect SMB1.md>)                            | Task         | Detects if SMB1 is enabled on the machine and saves its output to [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753). This information can then be utilized by the device group to present a consolidated view of machines with SMB1 enabled on a unified platform. |
| [CW RMM - Monitor - SMB1 Detection](<../cwa/monitors/SMB1 Detection.md>)                   | Monitor      | This monitor checks whether SMB1 is enabled on the end machine. [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334) can be run with this monitor to disable SMB1 on the detected machines automatically.                   |
| [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334)            | Task         | Disables the SMB1 protocol on the target machine.                                                                                                                                                                                                         |

## Implementation

Read all the associated documents carefully.

To establish a device group showcasing machines with SMB1 enabled, follow these two steps:

1. Create the custom field: [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753)
2. Create the task: [CW RMM - Task - Detect SMB1](<../cwrmm/tasks/Detect SMB1.md>)

To implement a monitor that identifies machines with SMB1 enabled and subsequently initiates an automatic disabling of SMB1, follow these two steps:

1. Create the monitor: [CW RMM - Monitor - SMB1 Detection](<../cwa/monitors/SMB1 Detection.md>)
2. Create the task: [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334)



