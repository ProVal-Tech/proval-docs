---
id: '86fee99f-6e26-440b-b6a4-6c0eb32fd240'
title: 'Reboot Scheduling Solution'
title_meta: 'Reboot Scheduling Solution for Target Machines'
keywords: ['reboot', 'schedule', 'customfields', 'workstation', 'server', 'implementation']
description: 'This document outlines a solution that allows users to trigger immediate reboots or schedule them for the next applicable day at a specified time on target machines, based on approved windows defined in company-level custom fields.'
tags: ['customfields', 'scheduling', 'implementation', 'task', 'server', 'workstation']
draft: false
unlisted: false
---
## Purpose

This solution helps to allow users to trigger the reboot immediately or schedule for the next applicable day at the specified time on a target machine based on the approved window provided in the company-level custom fields for the day and time.

## Associated Content

| Content                                                                                      | Type          | Function                                                                                                      |
|----------------------------------------------------------------------------------------------|---------------|---------------------------------------------------------------------------------------------------------------|
| [Custom Fields - Reboot Trigger/Schedule](https://proval.itglue.com/DOC-5078775-15502216) | Custom Fields | The below custom fields are used in the Reboot Schedule Solution.                                            |
| [Force Reboot Workstation With Reboot Windows Verification](https://proval.itglue.com/DOC-5078775-15505514) | Task          | This script is designed to reboot the workstations endpoints based on the customfield @WorkstationRebootWindowStart@, @WorkstationRebootWindowEnd@, and @WorkstationRebootWindowDay@. If the reboot time does not fall between the windows then the reboot will not trigger. |
| [Force Reboot Server With Reboot Windows Verification](https://proval.itglue.com/DOC-5078775-15505510) | Task          | This script is designed to reboot the endpoints based on the customfield @ServerRebootWindowStart@, @ServerRebootWindowEnd@, and @ServerRebootWindowDay@. If the reboot time does not fall between the windows then reboot will not trigger. |
| [Server Reboot Schedule on Specific Days](https://proval.itglue.com/DOC-5078775-15503048) | Task          | This schedules the force reboot of the server on the scheduled days based on the approved window check.      |
| [Workstation Reboot Schedule on Specific Days](https://proval.itglue.com/DOC-5078775-15505168) | Task          | This schedules the force reboot of the workstation on the scheduled days based on the approved window check.  |

## Implementation

- Create the [Custom Fields - Reboot Trigger/Schedule](https://proval.itglue.com/DOC-5078775-15502216)
- Create the [Force Reboot Workstation With Reboot Windows Verification](https://proval.itglue.com/DOC-5078775-15505514) and follow the deployment instructions.
- Create the [Force Reboot Server With Reboot Windows Verification](https://proval.itglue.com/DOC-5078775-15505510) and follow the deployment instructions.
- Create the [Server Reboot Schedule on Specific Days](https://proval.itglue.com/DOC-5078775-15503048) and follow the deployment instructions.
- Create the [Workstation Reboot Schedule on Specific Days](https://proval.itglue.com/DOC-5078775-15505168) and follow the deployment instructions.







