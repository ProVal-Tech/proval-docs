---
id: '8f2741e6-ef04-4a1e-804d-f481469e8beb'
title: 'Cumulative Update Audit'
title_meta: 'Cumulative Update Audit'
keywords: ['cumulative', 'update', 'audit', 'microsoft', 'compliance']
description: 'This document outlines a solution that retrieves the computer build number, compares it with Microsoft’s database to identify the installed Cumulative Update, and assesses its compliance status based on the update age.'
tags: ['compliance', 'database', 'windows']
draft: false
unlisted: false
---
## Purpose

The solution grabs the computer's build number and compares it with Microsoft's database to determine the installed Cumulative Update. It then compares the age of the installed Cumulative Update to determine whether the machine is in compliance with Microsoft updates or not.

## Associated Content

| Content                                                                 | Type         | Function                                                       |
|-------------------------------------------------------------------------|--------------|----------------------------------------------------------------|
| [CW RMM - Custom Field - Latest Cumulative Update](https://proval.itglue.com/DOC-5078775-14029450) | Custom Field | Stores and displays the result gathered by the script.        |
| [CW RMM - Task - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029442)      | Task         | Gathers the cumulative update details from the computer.      |
| [CW RMM - Monitor - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029444)   | Monitor      | Monitors the result stored in the custom field and handles the alerting. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [CW RMM - Custom Field - Latest Cumulative Update](https://proval.itglue.com/DOC-5078775-14029450)
- Create the task: [CW RMM - Task - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029442)
- Create the deployment schedule as described in this document (at the bottom): [CW RMM - Task - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029442)
- Create the monitor set if necessary: [CW RMM - Monitor - Cumulative Update Audit](https://proval.itglue.com/DOC-5078775-14029444)











