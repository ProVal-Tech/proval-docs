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
last_update:
  date: 2026-07-08
---

## Summary

The purpose of this dataview is to show the effective reboot time, day, and week of the month assigned to each computer by the [Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0) solution. It also displays the status of the last scheduled reboot—indicating whether the machine was successfully rebooted during its previous schedule—and provides an accurate calculation of the machine's last actual reboot time.

## Dependencies

[Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0)

| Column              | Description                                                                                   |
|---------------------|-----------------------------------------------------------------------------------------------|
| ClientId | ClientId (Hidden) |
| LocationId | LocationId (Hidden) |
| ComputerId | ComputerId |
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
| Effective_Week_Num  | The numeric representation of the effective reboot week (0 = every week, 1-5 = specific week).|
| Reboot_Time         | The effective scheduled reboot time for the computer.                                         |
| Effective Reboot Week | The human-readable effective reboot week (e.g., "Every Week", "1st Week", "2nd Week").      |
| Effective_Reboot_Cycle | A comprehensive summary of the effective reboot schedule (e.g., "Every Monday, Wednesday at 02:00" or "2nd Tuesday, Thursday at 03:00"). |
| Last Schedule Outcome | The result of the last schedule (e.g., whether the reboot was scheduled or the machine was offline).    |
| Last Reboot Time    | Calculated by subtracting the machine's uptime from its last contact time, providing an accurate estimate of when the computer was last rebooted. |

## Changelog

### 2026-07-08

- Added `Effective_Week_Num`, `Effective Reboot Week`, and `Effective_Reboot_Cycle` columns to display the specific week of the month and the full consolidated schedule cycle.
- Updated the `Last Reboot Time` logic to calculate the reboot time based on the `LastContact` time minus the system `uptime`, rather than using the current time, for greater accuracy.

### 2025-08-26

- Updated the uptime column to display uptime in decimal format. This means, instead of 9783 minutes, it will show 6 Days 19h 3m 00s

### 2025-07-17

- Initial version of the document
