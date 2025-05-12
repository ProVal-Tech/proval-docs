---
id: 'e0515cd5-5dab-444c-a7c4-47f1fa80bff4'
slug: /e0515cd5-5dab-444c-a7c4-47f1fa80bff4
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
| [CW RMM - Custom Field - SMB1 Enabled](/docs/67da04f5-4170-402a-93b3-7e6236937263)      | Custom Field | Stores and displays the result gathered by the script [CW RMM - Task - Detect SMB1](/docs/f5a58819-dcc7-4905-a3b5-52ff73751e21)                                                                                                                  |
| [CW RMM - Task - Detect SMB1](/docs/f5a58819-dcc7-4905-a3b5-52ff73751e21)                            | Task         | Detects if SMB1 is enabled on the machine and saves its output to [CW RMM - Custom Field - SMB1 Enabled](/docs/67da04f5-4170-402a-93b3-7e6236937263). This information can then be utilized by the device group to present a consolidated view of machines with SMB1 enabled on a unified platform. |
| [CW RMM - Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)                   | Monitor      | This monitor checks whether SMB1 is enabled on the end machine. [CW RMM - Task - Disable SMB1](/docs/10055a68-f513-4580-bdc1-73272516866f) can be run with this monitor to disable SMB1 on the detected machines automatically.                   |
| [CW RMM - Task - Disable SMB1](/docs/10055a68-f513-4580-bdc1-73272516866f)            | Task         | Disables the SMB1 protocol on the target machine.                                                                                                                                                                                                         |

## Implementation

Read all the associated documents carefully.

To establish a device group showcasing machines with SMB1 enabled, follow these two steps:

1. Create the custom field: [CW RMM - Custom Field - SMB1 Enabled](/docs/67da04f5-4170-402a-93b3-7e6236937263)
2. Create the task: [CW RMM - Task - Detect SMB1](/docs/f5a58819-dcc7-4905-a3b5-52ff73751e21)

To implement a monitor that identifies machines with SMB1 enabled and subsequently initiates an automatic disabling of SMB1, follow these two steps:

1. Create the monitor: [CW RMM - Monitor - SMB1 Detection](/docs/de67816f-e6ff-4fed-92e1-26fd5ae5359d)
2. Create the task: [CW RMM - Task - Disable SMB1](/docs/10055a68-f513-4580-bdc1-73272516866f)