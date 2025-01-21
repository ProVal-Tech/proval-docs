---
id: '86fee99f-6e26-440b-b6a4-6c0eb32fd240'
title: 'Reboot Scheduling Solution'
title_meta: 'Reboot Scheduling Solution for Target Machines'
keywords: ['reboot', 'schedule', 'custom fields', 'workstation', 'server', 'implementation']
description: 'This document outlines a solution that allows users to trigger immediate reboots or schedule them for the next applicable day at a specified time on target machines, based on approved windows defined in company-level custom fields.'
tags: []
draft: false
unlisted: false
---

## Purpose

This solution allows users to trigger an immediate reboot or schedule it for the next applicable day at the specified time on a target machine, based on the approved window provided in the company-level custom fields for the day and time.

## Associated Content

| Content                                                                                      | Type          | Function                                                                                                      |
|----------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------------|
| [Custom Fields - Reboot Trigger/Schedule](<../cwrmm/custom-fields/Reboot TriggerSchedule.md>) | Custom Fields | The custom fields used in the Reboot Schedule Solution.                                                      |
| [Force Reboot Workstation With Reboot Windows Verification](<../cwrmm/tasks/Force Reboot Workstation With Reboot Windows Verification.md>) | Task          | This script is designed to reboot the workstation endpoints based on the custom fields @WorkstationRebootWindowStart@, @WorkstationRebootWindowEnd@, and @WorkstationRebootWindowDay@. If the reboot time does not fall between the windows, then the reboot will not trigger. |
| [Force Reboot Server With Reboot Windows Verification](<../cwrmm/tasks/Force Reboot Server With Reboot Windows Verification.md>) | Task          | This script is designed to reboot the endpoints based on the custom fields @ServerRebootWindowStart@, @ServerRebootWindowEnd@, and @ServerRebootWindowDay@. If the reboot time does not fall between the windows, then the reboot will not trigger. |
| [Server Reboot Schedule on Specific Days](<../cwrmm/tasks/Server Reboot Schedule on Specific Days.md>) | Task          | This schedules the forced reboot of the server on the scheduled days based on the approved window check.      |
| [Workstation Reboot Schedule on Specific Days](<../cwrmm/tasks/Workstation Reboot Schedule on Specific Days.md>) | Task          | This schedules the forced reboot of the workstation on the scheduled days based on the approved window check.  |

## Implementation

- Create the [Custom Fields - Reboot Trigger/Schedule](<../cwrmm/custom-fields/Reboot TriggerSchedule.md>).
- Create the [Force Reboot Workstation With Reboot Windows Verification](<../cwrmm/tasks/Force Reboot Workstation With Reboot Windows Verification.md>) and follow the deployment instructions.
- Create the [Force Reboot Server With Reboot Windows Verification](<../cwrmm/tasks/Force Reboot Server With Reboot Windows Verification.md>) and follow the deployment instructions.
- Create the [Server Reboot Schedule on Specific Days](<../cwrmm/tasks/Server Reboot Schedule on Specific Days.md>) and follow the deployment instructions.
- Create the [Workstation Reboot Schedule on Specific Days](<../cwrmm/tasks/Workstation Reboot Schedule on Specific Days.md>) and follow the deployment instructions.
