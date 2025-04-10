---
id: '86fee99f-6e26-440b-b6a4-6c0eb32fd240'
slug: /86fee99f-6e26-440b-b6a4-6c0eb32fd240
title: 'Reboot TriggerSchedule on Specific Days'
title_meta: 'Reboot TriggerSchedule on Specific Days'
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
| [Custom Fields - Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6) | Custom Fields | The custom fields used in the Reboot Schedule Solution.                                                      |
| [Force Reboot Workstation With Reboot Windows Verification](/docs/d2983497-492e-4812-ba6c-09ac8998c7b3) | Task          | This script is designed to reboot the workstation endpoints based on the custom fields @WorkstationRebootWindowStart@, @WorkstationRebootWindowEnd@, and @WorkstationRebootWindowDay@. If the reboot time does not fall between the windows, then the reboot will not trigger. |
| [Force Reboot Server With Reboot Windows Verification](/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1) | Task          | This script is designed to reboot the endpoints based on the custom fields @ServerRebootWindowStart@, @ServerRebootWindowEnd@, and @ServerRebootWindowDay@. If the reboot time does not fall between the windows, then the reboot will not trigger. |
| [Server Reboot Schedule on Specific Days](/docs/26d390ba-1542-4524-b9ff-7a420004cb73) | Task          | This schedules the forced reboot of the server on the scheduled days based on the approved window check.      |
| [Workstation Reboot Schedule on Specific Days](/docs/0957012a-a6da-4e1b-abec-936a0a467e6a) | Task          | This schedules the forced reboot of the workstation on the scheduled days based on the approved window check.  |

## Implementation

- Create the [Custom Fields - Reboot Trigger/Schedule](/docs/c0aece55-4e18-4914-9e43-965c8c9e23a6).
- Create the [Force Reboot Workstation With Reboot Windows Verification](/docs/d2983497-492e-4812-ba6c-09ac8998c7b3) and follow the deployment instructions.
- Create the [Force Reboot Server With Reboot Windows Verification](/docs/a1fc1dc3-b9aa-414f-bf6e-7a9bf79cedd1) and follow the deployment instructions.
- Create the [Server Reboot Schedule on Specific Days](/docs/26d390ba-1542-4524-b9ff-7a420004cb73) and follow the deployment instructions.
- Create the [Workstation Reboot Schedule on Specific Days](/docs/0957012a-a6da-4e1b-abec-936a0a467e6a) and follow the deployment instructions.


