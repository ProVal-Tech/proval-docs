---
id: 'e0515cd5-5dab-444c-a7c4-47f1fa80bff4'
title: 'Monitor and Disable SMB1'
title_meta: 'Monitor and Disable SMB1'
keywords: ['smb1', 'monitor', 'disable', 'task', 'custom', 'field']
description: 'This document outlines the process to monitor and disable SMB1, providing detailed steps for implementing associated tasks and monitors within the ConnectWise RMM platform. It includes links to custom fields and tasks that facilitate the detection and disabling of SMB1 on target machines.'
tags: ['monitoring', 'security', 'configuration', 'task', 'custom']
draft: false
unlisted: false
---
## Purpose

The purpose of the content is to monitor and disable SMB1, either automatically or through the manual execution of a task.

## Associated Content

| Content                                                                                       | Type         | Function                                                                                                                                                                                                                                                   |
|-----------------------------------------------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753)      | Custom Field | Stores and displays the result gathered by the script [CW RMM - Task - Detect SMB1](https://proval.itglue.com/DOC-5078775-14419758)                                                                                                                  |
| [CW RMM - Task - Detect SMB1](https://proval.itglue.com/DOC-5078775-14419758)              | Task         | Detects if SMB1 is enabled on the machine or not and saves its output to [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753) Custom field. This information can then be utilized by the device group to present a consolidated view of machines with SMB1 enabled on a unified platform. |
| [CW RMM - Monitor - SMB1 Detection](https://proval.itglue.com/DOC-5078775-14394593)        | Monitor      | This monitor checks whether SMB1 is enabled on the end machine or not. [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334) can be run with this monitor to disable SMB1 on the detected machines automatically.                   |
| [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334)            | Task         | Disables the SMB1 protocol on the target machine.                                                                                                                                                                                                         |

## Implementation

Read all the associated documents carefully.

To establish a device group showcasing machines with SMB1 enabled, follow the two steps below:

1. Create the custom field: [CW RMM - Custom Field - SMB1 Enabled](https://proval.itglue.com/DOC-5078775-14419753)
2. Create the task: [CW RMM - Task - Detect SMB1](https://proval.itglue.com/DOC-5078775-14419758)

To implement a monitor that identifies machines with SMB1 enabled and subsequently initiates an automatic disabling of SMB1, follow the two steps below:

1. Create the Monitor: [CW RMM - Monitor - SMB1 Detection](https://proval.itglue.com/DOC-5078775-14394593)
2. Create the task: [CW RMM - Task - Disable SMB1](https://proval.itglue.com/DOC-5078775-14393334)






