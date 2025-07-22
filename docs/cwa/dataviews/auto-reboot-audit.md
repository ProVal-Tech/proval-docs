---
id: '09e4ea2c-54d9-4e8f-bfa8-1707501d5a11'
slug: /09e4ea2c-54d9-4e8f-bfa8-1707501d5a11
title: 'Auto Reboot Audit'
title_meta: 'Auto Reboot Audit'
keywords: ['reboot', 'auto-reboot', 'reboot-audit', 'last-reboot-status', 'managed-reboot']
description: ''
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

The purpose of this dataview is to show the effective reboot time and day assigned to each computer by the [Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0) solution, along with the status of the last scheduled reboot—indicating whether the machine was successfully rebooted during its previous schedule.

## Dependencies

[Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0)

| Column              | Description                                                                                   |
|---------------------|-----------------------------------------------------------------------------------------------|
| ClientId | ClientId (Hidden) |
| LocationId | LocationId (Hidden) |
| ComputerId | ComputerId (Hidden) |
| Client              | The name of the client to which the computer belongs.                                         |
| Location            | The location of the computer within the client.                                               |
| Computer            | The name of the computer.                                                                     |
| Operating System    | The operating system installed on the computer.                                               |
| Last Contact        | The last time the computer checked in with the system.                                        |
| Last Logged In User | The username of the last user who logged into the computer.                                   |
| Form Factor         | The hardware type of the computer (e.g., desktop, laptop, server).                            |
| Uptime              | Uptime of the machine in minutes.                                                             |
| Reboot Sunday       | Indicates if auto reboot is enabled for Sunday (1 = enabled, 0 = disabled).                   |
| Reboot Monday       | Indicates if auto reboot is enabled for Monday (1 = enabled, 0 = disabled).                   |
| Reboot Tuesday      | Indicates if auto reboot is enabled for Tuesday (1 = enabled, 0 = disabled).                  |
| Reboot Wednesday    | Indicates if auto reboot is enabled for Wednesday (1 = enabled, 0 = disabled).                |
| Reboot Thursday     | Indicates if auto reboot is enabled for Thursday (1 = enabled, 0 = disabled).                 |
| Reboot Friday       | Indicates if auto reboot is enabled for Friday (1 = enabled, 0 = disabled).                   |
| Reboot Saturday     | Indicates if auto reboot is enabled for Saturday (1 = enabled, 0 = disabled).                 |
| Reboot_Time         | The effective scheduled reboot time for the computer.                                         |
| Last Schedule Outcome | The result of the last schedule (e.g., whether the reboot was scheduled or the machine was offline).    |
| Last Reboot Time | Last reboot time of the computer. |
