---
id: 'd8e1d743-88d6-4acb-b149-7fc27c2e1738'
slug: /d8e1d743-88d6-4acb-b149-7fc27c2e1738
title: 'Crystal Disk Info Health'
title_meta: 'Crystal Disk Info Health'
keywords: ['disk', 'health', 'monitoring', 'crystal', 'info']
description: 'This document outlines the process for monitoring the disk health of physical machines using the Crystal Disk Info tool. It includes associated content such as custom fields, tasks, and monitors within the ConnectWise RMM environment to ensure effective disk health management.'
tags: ['alerting', 'disk']
draft: false
unlisted: false
---

## Purpose

The purpose of this document is to monitor the disk health of physical machines using the [Crystal Disk Info tool](https://crystalmark.info/en/software/crystaldiskinfo/).

## Associated Content

| Content                                                                                       | Type         | Function                                                |
|-----------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------|
| [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01) | Custom Field | Stores and displays the result gathered by the script. |
| [CW RMM - Task - Get Crystal Disk Info (Disk Health)](/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b) | Task         | Gathers the Crystal Disk Info data from the computer.  |
| [CW RMM - Monitor - Crystal Disk Info Health Status](/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59) | Monitor      | Monitors the result stored in the custom field and handles the alerting. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [CW RMM - Custom Field - Crystal Disk Info_Disk Health](/docs/1e713ef3-1378-4601-a00a-c8a8ecd60c01)
- Create the task: [CW RMM - Task - Get Crystal Disk Info (Disk Health)](/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b)
- Create the deployment schedule as described in this document: [CW RMM - Task - Get Crystal Disk Info (Disk Health)](/docs/37220488-64d2-4de9-8e65-1cd53f5dee3b)
- Create the monitor if necessary: [CW RMM - Monitor - Crystal Disk Info Health Status](/docs/8ceb86c8-23b2-4a95-b920-f78e446d9e59)

