---
id: '93faad94-8731-4fd5-afd0-0ae2a669fc05'
slug: /93faad94-8731-4fd5-afd0-0ae2a669fc05
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
- [CW RMM - Custom Fields - Reboot Prompter](/docs/7876f32c-a5ec-4b58-9f7e-b60b710e19d5)  
- [CW RMM - Task - Reboot Pending Check Automation](/docs/509ed97f-105b-47d7-8a66-f7da58da8138)  

## Details

| Field Name                            | Type of Field (Machine or Organization) | Description                                                                                                                                                        |
|---------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reboot Prompter Deployment - Auto     | Dynamic Group                           | This dynamic group detects the agents where the custom field 'Auto_RebootPendingCheck' is checked. The custom field is automatically managed by the task 'Reboot Pending Check Automation'. |

## Group Creation

1. **Create Dynamic Groups:**

   ![Dynamic Groups](../../../static/img/docs/93faad94-8731-4fd5-afd0-0ae2a669fc05/image_1.webp)

2. **Reboot Prompter Deployment - Auto**

   ![Reboot Prompter Deployment](../../../static/img/docs/93faad94-8731-4fd5-afd0-0ae2a669fc05/image_2.webp)

   **Criteria:**

   - Prompter_RebootPending custom field equals False.
   - Auto_RebootPendingCheck custom field equals True.
   - The agent available equals True.
   - The OS contains either Windows 10 or Windows 11.
   - Exclude Reboot custom field equals False.

