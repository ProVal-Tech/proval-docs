---
id: '09e4ea2c-54d9-4e8f-bfa8-1707501d5a11'
slug: /09e4ea2c-54d9-4e8f-bfa8-1707501d5a11
title: 'Auto Reboot Audit'
title_meta: 'Auto Reboot Audit'
keywords: ['reboot', 'auto-reboot', 'reboot-audit', 'last-reboot-status', 'managed-reboot', 'maintenance-mode', 'pending-reboot']
description: 'The Auto Reboot Audit dataview shows the effective reboot schedule, pending reboot status, maintenance mode configuration, and last scheduled reboot outcome for machines managed by the Auto Reboot Management solution.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Summary

The purpose of this dataview is to show the effective reboot time, day, and week of the month assigned to each computer by the [Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0) solution.

It also displays:

- the status of the last scheduled reboot,
- whether the machine was online or offline during the scheduled reboot window,
- whether maintenance mode was applied as part of the scheduled reboot,
- whether the machine currently has a pending reboot flag,
- whether the pending reboot requirement is satisfied,
- the effective maintenance mode duration configured for the machine,
- and an estimated last actual reboot time based on last contact and uptime.

This dataview is intended to be used as an audit and reporting view for the Auto Reboot Management solution.

:::note  
This dataview depends on the [Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0) script. If you are using the maintenance mode or pending reboot features introduced after 2026-08-03, ensure the Auto Reboot Management script has been run with `Set_Environment = 1` so the required EDFs are created.  
:::

## Dependencies

- [Script: Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0)
- [View: pvl_auto_reboot_management](/docs/2d5b0aa8-8536-4776-957c-eaa8b9d3c1a0)

## Dataview Columns

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
| Effective Pending Reboot Check | Shows the effective pending reboot setting after applying computer, location, and client precedence. `Enabled` means the machine reboots only if a pending reboot flag is detected. `Disabled` means the pending reboot check is bypassed. |
| Reboot Pending Flag | Shows whether the computer currently has a pending reboot flag detected. This is based on the `computers.flags` bit value `1024`. |
| Pending Reboot Requirement Met | Shows whether the pending reboot requirement is satisfied. `Yes` means pending reboot is required and the flag is present. `No` means pending reboot is required but the flag is not present. `Not Required` means the pending reboot check is disabled. |
| Effective Maintenance Minutes | Shows the effective maintenance mode duration in minutes after applying computer, location, and client precedence. `0` means maintenance mode is disabled or excluded. Values from `1` to `14` are enforced as `15` minutes. Values of `15` or higher represent the configured maintenance duration. |
| Last Schedule Outcome | The result of the last schedule. This may indicate whether the reboot was scheduled, whether the machine was offline, whether maintenance mode was applied, or whether the reboot was skipped because no pending reboot flag was detected. |
| Last Reboot Time    | Calculated by subtracting the machine's uptime from its last contact time, providing an accurate estimate of when the computer was last rebooted. |

## Pending Reboot Reporting

The dataview reports pending reboot information without hiding machines that do not currently have a pending reboot flag.

This allows administrators to audit why a machine may not have rebooted when the pending reboot requirement is enabled.

For example:

| Effective Pending Reboot Check | Reboot Pending Flag | Pending Reboot Requirement Met | Meaning |
| ------------------------------ | ------------------- | ------------------------------ | ------- |
| Disabled | Yes | Not Required | Pending reboot check is not required. The machine can reboot based on the normal schedule. |
| Disabled | No | Not Required | Pending reboot check is not required. The machine can reboot based on the normal schedule. |
| Enabled | Yes | Yes | Pending reboot check is required and the machine has a pending reboot flag. |
| Enabled | No | No | Pending reboot check is required, but the machine does not currently have a pending reboot flag. The reboot command will not be sent. |

## Maintenance Mode Reporting

The `Effective Maintenance Minutes` column shows the maintenance mode duration that will be applied when a reboot command is scheduled.

Maintenance mode is applied only when:

- the machine is online,
- the reboot command is scheduled,
- and the effective maintenance mode duration is greater than `0`.

The value shown in this column is the effective configured duration after applying the following rules:

- Blank/unset values inherit from the next level.
- Computer-level settings override location-level settings.
- Location-level settings override client-level settings.
- A value of `0` disables or excludes maintenance mode at that level.
- Values from `1` to `14` are enforced as `15` minutes.
- Values of `15` or higher use the configured value.

## Last Schedule Outcome

The `Last Schedule Outcome` column is populated by the Auto Reboot Management script.

Depending on the machine state during the scheduled reboot window, this field may show outcomes such as:

- the machine was offline,
- the reboot was scheduled,
- maintenance mode was applied,
- the reboot was skipped because no pending reboot flag was detected,
- or a previously scheduled reboot command was removed.

This column is useful for auditing whether the machine was available during the reboot window and whether the expected reboot action was taken.

## Changelog

### 2026-08-06

- Replaced the dataview’s complex runtime query with the new `pvl_auto_reboot_management` MySQL view to improve reliability and prevent load failures caused by query complexity.
- The dataview now retrieves its data by querying the view directly, while the MySQL server executes the underlying reporting logic.
- Added the `Effective Pending Reboot Check` column to display the effective pending reboot setting after applying computer, location, and client precedence.
- Added the `Reboot Pending Flag` column to show whether the machine currently has a pending reboot flag, based on the `computers.flags` bit value `1024`.
- Added the `Pending Reboot Requirement Met` column to show whether the pending reboot requirement is satisfied, with values of `Yes`, `No`, or `Not Required`.
- Added the `Effective Maintenance Minutes` column to display the effective maintenance mode duration after applying precedence and the minimum 15-minute enforcement rule.
- Updated the `Last Schedule Outcome` column description to include maintenance mode activity, pending reboot skip conditions, offline status, scheduled reboot commands, and removal of previously scheduled reboot commands.
- Updated the dataview to support the maintenance mode and pending reboot EDFs introduced in the Auto Reboot Management Solution.

### 2026-07-08

- Added `Effective_Week_Num`, `Effective Reboot Week`, and `Effective_Reboot_Cycle` columns to display the specific week of the month and the full consolidated schedule cycle.
- Updated the `Last Reboot Time` logic to calculate the reboot time based on the `LastContact` time minus the system `uptime`, rather than using the current time, for greater accuracy.

### 2025-08-26

- Updated the uptime column to display uptime in decimal format. This means, instead of 9783 minutes, it will show 6 Days 19h 3m 00s

### 2025-07-17

- Initial version of the document
