---
id: '1c798d37-8ff8-4e73-ba39-027e025a3551'
slug: /1c798d37-8ff8-4e73-ba39-027e025a3551
title: 'Automatic Reboot Pending Check'
title_meta: 'Automatic Reboot Pending Check'
keywords: ['reboot', 'automation', 'custom', 'dynamic', 'group']
description: 'This document outlines the setup and dependencies for the Automatic Reboot Pending Check task in ConnectWise RMM. It explains how to create a dynamic group that schedules the task based on the custom field Auto_RebootPendingCheck, ensuring efficient management of reboot automation.'
tags: ['windows']
draft: false
unlisted: false
---

## Summary

This group is designed to schedule the task 'Automatic Reboot Pending Check' to set the auto reboot pending automation by checking the custom field 'Auto_RebootPendingCheck'.

## Dependencies

- Auto_RebootPendingCheck --> Custom field (Endpoint)  
- [CW RMM - Custom Fields - Reboot Prompter](/docs/7876f32c-a5ec-4b58-9f7e-b60b710e19d5)  
- [CW RMM - Task - Reboot Pending Check Automation](/docs/509ed97f-105b-47d7-8a66-f7da58da8138)  

## Details

| Field Name                        | Type of Field (Machine or Organization) | Description                                                                                                                                               |
|-----------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Automatic Reboot Pending Check     | Dynamic group                           | This group is designed to schedule the task 'Reboot Pending Check Automation' to set the auto reboot pending automation by checking the custom field 'Auto_RebootPendingCheck'. |

## Group Creation

1. Create Dynamic Groups:  
   ![Image](../../../static/img/docs/1c798d37-8ff8-4e73-ba39-027e025a3551/image_1.webp)

2. Automatic Reboot Pending Check  
   ![Image](../../../static/img/docs/1c798d37-8ff8-4e73-ba39-027e025a3551/image_2.webp)  

   Criteria:
   - Prompter_RebootPending custom field equal to False.
   - Auto_RebootPendingCheck custom field equal to False.
   - The agent available is equal to True.
   - The OS contains any of Windows 10, Windows 11, Windows 2016 Server, Windows 2019 Server, and Windows 2022 Server.