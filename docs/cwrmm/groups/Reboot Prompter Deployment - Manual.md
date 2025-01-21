---
id: '284c0ff4-381a-45c0-8282-aa6ac4c3da20'
title: 'Reboot Prompter Deployment - Manual'
title_meta: 'Reboot Prompter Deployment - Manual'
keywords: ['dynamic', 'group', 'endpoint', 'custom', 'field', 'agent', 'windows', 'criteria']
description: 'This document outlines the process for creating a dynamic group based on the endpoint custom field "Prompter_RebootPending". It details the dependencies, group creation steps, and criteria required for the group to function effectively.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

This dynamic group depends on the endpoint custom field 'Prompter_RebootPending'. The flag should be checked, and the agent should be available to check in to the group.

## Dependencies

Reboot_PendingReboot --> Custom field (Endpoint)  
[CW RMM - Custom Fields - Reboot Prompter](https://proval.itglue.com/DOC-5078775-15298950)  

## Details

| Field Name                          | Type of Field (Machine or Organization) | Description                                                                                                                                                      |
|-------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reboot Prompter Deployment - Manual | Dynamic Group                          | This dynamic group depends on the endpoint custom field 'Prompter_RebootPending'. The flag should be checked, and the agent should be available to check in to the group. |

## Group Creation 

1. Create Dynamic Groups:  
   ![Image](../../../static/img/Reboot-Prompter-Deployment---Manual/image_1.png)

2. Reboot Prompter Deployment - Manual  
   ![Image](../../../static/img/Reboot-Prompter-Deployment---Manual/image_2.png)  

   Criteria:
   - Prompter_RebootPending custom field equals True.
   - The agent available equals True.
   - The OS contains either Windows 10 or Windows 11.
   - Exclude Reboot custom field equals False.

