---
id: '2d5b0aa8-8536-4776-957c-eaa8b9d3c1a0'
slug: /2d5b0aa8-8536-4776-957c-eaa8b9d3c1a0
title: 'pvl_auto_reboot_management'
title_meta: 'pvl_auto_reboot_management'
keywords: ['reboot', 'auto-reboot', 'reboot-audit', 'last-reboot-status', 'managed-reboot', 'maintenance-mode', 'pending-reboot', 'mysql-view']
description: 'MySQL view used by the Auto Reboot Audit dataview to report the effective reboot schedule, pending reboot status, maintenance mode configuration, last scheduled reboot outcome, and estimated last reboot time for computers managed by the Auto Reboot Management solution.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-06
---

## Purpose

The `pvl_auto_reboot_management` view provides the data source for the [Auto Reboot Audit](/docs/09e4ea2c-54d9-4e8f-bfa8-1707501d5a11) dataview.

It returns the effective Auto Reboot Management configuration and reporting state for each managed computer, including:

- the effective reboot day or days,
- the effective reboot time,
- the effective reboot week of the month,
- the last scheduled reboot outcome,
- whether the machine was online or offline during the scheduled reboot window,
- whether maintenance mode was applied as part of the scheduled reboot,
- whether the machine currently has a pending reboot flag,
- whether the pending reboot requirement is satisfied,
- the effective maintenance mode duration configured for the machine,
- and an estimated last actual reboot time based on last contact and uptime.

This view centralizes the reporting logic that was previously executed directly by the dataview at runtime. Because the underlying query became too complex for the dataview to execute reliably, the logic has been moved into this MySQL view.

The dataview now queries this view directly, while the MySQL server executes the view definition.

## Dependencies

- [Dataview: Auto Reboot Audit](/docs/09e4ea2c-54d9-4e8f-bfa8-1707501d5a11)
- [Script: Auto Reboot Management](/docs/69b28e39-89c4-498a-8c45-3d18459d39a0)

## Views

### pvl_auto_reboot_management

The view returns one row per computer managed by the Auto Reboot Management solution.

| Column | Type | Explanation |
|---|---:|---|
| `ClientId` | INT | Unique identifier for the client. This column is hidden in the dataview but is retained for filtering, joins, and internal reference. |
| `LocationId` | INT | Unique identifier for the location. This column is hidden in the dataview but is retained for filtering, joins, and internal reference. |
| `ComputerId` | INT | Unique identifier for the computer. |
| `Client` | VARCHAR | The name of the client to which the computer belongs. |
| `Location` | VARCHAR | The location of the computer within the client. |
| `Computer` | VARCHAR | The name of the computer. |
| `Operating System` | VARCHAR | The operating system installed on the computer. |
| `Last Contact` | DATETIME | The last time the computer checked in with the system. |
| `Last Logged In User` | VARCHAR | The username of the last user who logged into the computer. |
| `Form Factor` | VARCHAR | The hardware type of the computer, such as desktop, laptop, or server. |
| `Uptime` | VARCHAR | The machine uptime displayed in a human-readable format, for example `6 Days 19h 3m 00s`. The underlying uptime value is used internally to calculate the estimated last reboot time. |
| `Reboot Sunday` | TINYINT | Indicates whether auto reboot is enabled for Sunday. `1 = enabled`, `0 = disabled`. |
| `Reboot Monday` | TINYINT | Indicates whether auto reboot is enabled for Monday. `1 = enabled`, `0 = disabled`. |
| `Reboot Tuesday` | TINYINT | Indicates whether auto reboot is enabled for Tuesday. `1 = enabled`, `0 = disabled`. |
| `Reboot Wednesday` | TINYINT | Indicates whether auto reboot is enabled for Wednesday. `1 = enabled`, `0 = disabled`. |
| `Reboot Thursday` | TINYINT | Indicates whether auto reboot is enabled for Thursday. `1 = enabled`, `0 = disabled`. |
| `Reboot Friday` | TINYINT | Indicates whether auto reboot is enabled for Friday. `1 = enabled`, `0 = disabled`. |
| `Reboot Saturday` | TINYINT | Indicates whether auto reboot is enabled for Saturday. `1 = enabled`, `0 = disabled`. |
| `Effective_Week_Num` | TINYINT | Numeric representation of the effective reboot week. `0 = every week`, `1 = first week`, `2 = second week`, `3 = third week`, `4 = fourth week`, `5 = fifth week`. |
| `Reboot_Time` | TIME | The effective scheduled reboot time for the computer. |
| `Effective Reboot Week` | VARCHAR | Human-readable effective reboot week, such as `Every Week`, `1st Week`, `2nd Week`, `3rd Week`, `4th Week`, or `5th Week`. |
| `Effective_Reboot_Cycle` | VARCHAR | Consolidated summary of the effective reboot schedule, such as `Every Monday, Wednesday at 02:00` or `2nd Tuesday, Thursday at 03:00`. |
| `Effective Pending Reboot Check` | VARCHAR | Shows the effective pending reboot setting after applying computer, location, and client precedence. `Enabled` means the machine reboots only if a pending reboot flag is detected. `Disabled` means the pending reboot check is bypassed. |
| `Reboot Pending Flag` | VARCHAR | Shows whether the computer currently has a pending reboot flag detected. This is based on the `computers.flags` bit value `1024`. |
| `Pending Reboot Requirement Met` | VARCHAR | Shows whether the pending reboot requirement is satisfied. `Yes` means pending reboot is required and the flag is present. `No` means pending reboot is required but the flag is not present. `Not Required` means the pending reboot check is disabled. |
| `Effective Maintenance Minutes` | INT | Shows the effective maintenance mode duration in minutes after applying computer, location, and client precedence. `0` means maintenance mode is disabled or excluded. Values from `1` to `14` are enforced as `15` minutes. Values of `15` or higher represent the configured maintenance duration. |
| `Last Schedule Outcome` | TEXT | The result of the last schedule. This may indicate whether the reboot was scheduled, whether the machine was offline, whether maintenance mode was applied, whether the reboot was skipped because no pending reboot flag was detected, or whether a previously scheduled reboot command was removed. |
| `Last Reboot Time` | DATETIME | Estimated last reboot time. This is calculated by subtracting the machine uptime from its last contact time. |

## Changelog

### 2026-08-06

- Initial version of the view document.
