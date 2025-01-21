---
id: '93faad94-8731-4fd5-afd0-0ae2a669fc05'
title: 'Reboot Prompter Deployment - Auto'
title_meta: 'Reboot Prompter Deployment - Auto'
keywords: ['dynamic', 'group', 'check', 'agent', 'custom', 'field', 'windows', 'reboot']
description: 'This document outlines the process for creating a dynamic group that detects agents with the custom field Auto_RebootPendingCheck checked, ensuring that the agents are available for the group and managed by the Reboot Pending Check Automation task.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

This dynamic group depends on the endpoint custom field 'Auto_RebootPendingCheck' being checked, and the agent should be available to check into the group.

## Dependencies

- Auto_RebootPendingCheck --> Custom field (Endpoint)  
- [CW RMM - Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)  
- [CW RMM - Task - Reboot Pending Check Automation](<../tasks/Reboot Pending Check Automation.md>)  

## Details

| Field Name                            | Type of Field (Machine or Organization) | Description                                                                                                                                                        |
|---------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reboot Prompter Deployment - Auto     | Dynamic Group                           | This dynamic group detects the agents where the custom field 'Auto_RebootPendingCheck' is checked. The custom field is automatically managed by the task 'Reboot Pending Check Automation'. |

## Group Creation

1. **Create Dynamic Groups:**

   ![Dynamic Groups](../../../static/img/Reboot-Prompter-Deployment---Auto/image_1.png)

2. **Reboot Prompter Deployment - Auto**

   ![Reboot Prompter Deployment](../../../static/img/Reboot-Prompter-Deployment---Auto/image_2.png)

   **Criteria:**

   - Prompter_RebootPending custom field equals False.
   - Auto_RebootPendingCheck custom field equals True.
   - The agent available equals True.
   - The OS contains either Windows 10 or Windows 11.
   - Exclude Reboot custom field equals False.



