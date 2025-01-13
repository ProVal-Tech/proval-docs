---
id: 'rmm-create-device-group-update-orchestrator'
title: 'Create Device Group for Update Orchestrator'
title_meta: 'Create Device Group for Update Orchestrator'
keywords: ['device', 'group', 'update', 'orchestrator', 'solution', 'windows']
description: 'This document provides a step-by-step guide on how to create a device group for the Update Orchestrator solution in ConnectWise RMM. It includes dependencies, creation instructions, and criteria for grouping devices based on OS type.'
tags: ['configuration', 'windows', 'setup', 'software']
draft: false
unlisted: false
---
## Summary

There is one device group related to the Update Orchestrator solution. Please see the guide below to create a device group.

## Dependencies

- [CW RMM - Task - Update Orchestrator Bouncer](https://proval.itglue.com/5078775/docs/13460454#version=published&documentMode=edit)
- [CW RMM - Custom Monitor - Update Orchestrator Bouncer](https://proval.itglue.com/5078775/docs/13460540#version=published&documentMode=edit)

## Create Device Group

There is one device group for this solution. To create device groups, please navigate to Devices > Device Groups.

**![Image](..\..\..\static\img\Update-Orchestrator\image_1.png)**

Select Add > Dynamic Group.

![Image](..\..\..\static\img\Update-Orchestrator\image_2.png)

---

## Device Group Name: Update Orchestrator

![Image](..\..\..\static\img\Update-Orchestrator\image_3.png)

Description: Machines in this group will get the Update Orchestrator solution.

Criteria:

![Image](..\..\..\static\img\Update-Orchestrator\image_4.png)

When adding criteria, please search for the "OS Type".

Contains any of: "Windows"

AND

Site > Contains any of > "Select the sites you want this to target".


