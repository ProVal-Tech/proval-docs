---
id: '8f2741e6-ef04-4a1e-804d-f481469e8beb'
title: 'Latest Cumulative Update Audit'
title_meta: 'Latest Cumulative Update Audit'
keywords: ['cumulative', 'update', 'audit', 'microsoft', 'compliance']
description: 'This document outlines a solution that retrieves the computer build number, compares it with Microsoft’s database to identify the installed Cumulative Update, and assesses its compliance status based on the update age.'
tags: ['compliance', 'database', 'windows']
draft: false
unlisted: false
---

## Purpose

The solution retrieves the computer's build number and compares it with Microsoft's database to determine the installed Cumulative Update. It then assesses the age of the installed Cumulative Update to determine whether the machine is in compliance with Microsoft updates.

## Associated Content

| Content                                                                 | Type         | Function                                                       |
|-------------------------------------------------------------------------|--------------|----------------------------------------------------------------|
| [CW RMM - Custom Field - Latest Cumulative Update](<../cwrmm/custom-fields/Latest Cumulative Update.md>) | Custom Field | Stores and displays the result gathered by the script.        |
| [CW RMM - Task - Cumulative Update Audit](<../cwrmm/tasks/Cumulative Update Audit.md>)      | Task         | Gathers the cumulative update details from the computer.      |
| [CW RMM - Monitor - Cumulative Update Audit](<../cwrmm/monitors/Cumulative Update Audit.md>)   | Monitor      | Monitors the result stored in the custom field and handles the alerting. |

## Implementation

- Read all the associated documents carefully.
- Create the custom field: [CW RMM - Custom Field - Latest Cumulative Update](<../cwrmm/custom-fields/Latest Cumulative Update.md>)
- Create the task: [CW RMM - Task - Cumulative Update Audit](<../cwrmm/tasks/Cumulative Update Audit.md>)
- Create the deployment schedule as described in this document (at the bottom): [CW RMM - Task - Cumulative Update Audit](<../cwrmm/tasks/Cumulative Update Audit.md>)
- Create the monitor set if necessary: [CW RMM - Monitor - Cumulative Update Audit](<../cwrmm/monitors/Cumulative Update Audit.md>)




