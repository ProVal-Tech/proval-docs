---
id: 'd8e1d743-88d6-4acb-b149-7fc27c2e1738'
title: 'Monitoring Disk Health with Crystal Disk Info'
title_meta: 'Monitoring Disk Health with Crystal Disk Info'
keywords: ['disk', 'health', 'monitoring', 'crystal', 'info']
description: 'This document outlines the process for monitoring the disk health of physical machines using the Crystal Disk Info tool. It includes associated content such as custom fields, tasks, and monitors within the ConnectWise RMM environment to ensure effective disk health management.'
tags: ['disk', 'monitor', 'custom-field', 'task', 'alerting']
draft: false
unlisted: false
---
## Purpose

The purpose of the content is to monitor the disk health of the physical machines using the [crystal disk info tool](https://crystalmark.info/en/software/crystaldiskinfo/).

## Associated Content

| Content                                                                                       | Type         | Function                                                |
|-----------------------------------------------------------------------------------------------|--------------|--------------------------------------------------------|
| [CW RMM - Custom Field - Crystal Disk Info_Disk Health](https://proval.itglue.com/DOC-5078775-13549899) | Custom Field | Stores and displays the result gathered by the script. |
| [CW RMM - Task - Get Crystal Disk Info (Disk Health)](https://proval.itglue.com/DOC-5078775-13549879) | Task         | Gathered the Crystal Disk Info data from the computer. |
| [CW RMM - Monitor - Crystal Disk Info Health Status](https://proval.itglue.com/DOC-5078775-14029148) | Monitor      | Monitor the result stored in the custom field and handle the alerting. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [CW RMM - Custom Field - Crystal Disk Info_Disk Health](https://proval.itglue.com/DOC-5078775-13549899)
- Create the task: [CW RMM - Task - Get Crystal Disk Info (Disk Health)](https://proval.itglue.com/DOC-5078775-13549879)
- Create the deployment schedule as described in this document: [CW RMM - Task - Get Crystal Disk Info (Disk Health)](https://proval.itglue.com/DOC-5078775-13549879)
- Create the monitor if necessary: [CW RMM - Monitor - Crystal Disk Info Health Status](https://proval.itglue.com/DOC-5078775-14029148)






