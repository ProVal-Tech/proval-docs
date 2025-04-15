---
id: 'd6235892-7f62-4a75-83ef-c6c01cc43898'
slug: /d6235892-7f62-4a75-83ef-c6c01cc43898
title: 'Reboot Pending Servers'
title_meta: 'Reboot Pending Servers'
keywords: ['reboot', 'servers', 'windows', 'dynamic', 'group', 'endpoint']
description: 'This document outlines the configuration and details for the Reboot Pending Servers group within ConnectWise RMM. It specifies the criteria for detecting supported Windows servers that require a reboot and the dependencies necessary for its functionality.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

This group contains the server endpoints where a reboot is pending. It detects only supported Windows servers, specifically 2016, 2019, and 2022, and it only works when the Reboot Prompter Solution is activated.

## Dependencies

[CW RMM - Custom Fields - Reboot Prompter](/docs/7876f32c-a5ec-4b58-9f7e-b60b710e19d5)

## Details

| Field Name                 | Type of Field (Machine or Organization) | Description                                                                                                                                                                                                                                                                                                                                                                         |
|----------------------------|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Reboot Pending Servers      | Dynamic Group                          | This group contains the server endpoints where a reboot is pending. It detects only supported Windows servers, specifically 2016, 2019, and 2022, and it only works when the Reboot Prompter Solution is activated.                                                                                                                                                                 |

## Group Creation

### 1. Create Dynamic Groups:

![Create Dynamic Groups](../../../static/img/Reboot-Pending-Servers/image_1.png)

### 2. Reboot Pending Servers

![Reboot Pending Servers](../../../static/img/Reboot-Pending-Servers/image_2.png)

**Criteria:**

- Auto_RebootPendingCheck custom field equals True.
- The agent available equals True.
- The OS contains any of Windows 2016, Windows 2019, or Windows 2022.
- The Exclude reboot custom field equals False.



