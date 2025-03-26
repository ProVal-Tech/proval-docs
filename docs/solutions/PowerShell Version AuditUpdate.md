---
id: '84b2e461-c2a3-423f-8a2c-0ac4e8e62fb9'
slug: /84b2e461-c2a3-423f-8a2c-0ac4e8e62fb9
title: 'PowerShell Version AuditUpdate'
title_meta: 'PowerShell Version AuditUpdate'
keywords: ['powershell', 'upgrade', 'rmm', 'windows', 'custom', 'monitor', 'tasks']
description: 'This document provides a comprehensive guide on managing and upgrading PowerShell to version 5 for all Windows devices within the ConnectWise RMM platform, utilizing custom tasks, device groups, and monitors to ensure successful upgrades.'
tags: ['windows']
draft: false
unlisted: false
---

## Purpose

This solution uses custom tasks, device groups, and a custom monitor to manage and upgrade PowerShell to version 5 for all Windows devices in the RMM.

## Associated Content

| Content                                                                 | Type          | Function                                                                                                                                                                         |
|-------------------------------------------------------------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [CW RMM - Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a) | Custom Field  | Stores PowerShell version information, including the "success/failure" status that determines if the machine is on PowerShell 5 or not.                                        |
| [CW RMM - Device Groups - PowerShell Version](/docs/bbb9f958-4fd3-4fda-903f-7d303bf26779) | Device Group  | The device groups are used to report on devices that have not been audited, are < PowerShell 5, and > PowerShell 5. The PowerShell audit pending device group is used as the default target for the PowerShell version information audit script. |
| [CW RMM - Task - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b) | Task          | Gathers the PowerShell version and writes a success/failure note based on the PowerShell version of the device. If the target device is under PowerShell 5, it will write "failure" in the custom field. If the target device is over PowerShell 5, it will write "success" in the custom field. |
| [CW RMM - Task - PowerShell Version Update](https://proval.itglue.com/DOC-5078775-12825752) | Task          | This task will attempt to upgrade the target device to PowerShell version 5.                                                                                                 |
| [CW RMM - Custom Monitor - PowerShell Version](/docs/8c623742-14b0-4263-8a1a-abd4c61d602d) | Monitor       | This monitor reviews the custom field for "Success" or "Failure" and will trigger the PowerShell Version Update script if the machine is less than PowerShell 5.             |

## Implementation

1. **Create the custom field.** This step is required before the rest of the steps will work as expected.  
   Follow the documentation here: [CW RMM - Custom Field - PowerShell Version](/docs/945d88e0-81a9-4253-8406-63fa7430d45a)

2. **Create the device groups.** This step is required before creating the tasks; otherwise, they will not have a proper target.  
   Follow the documentation here: [CW RMM - Device Groups - PowerShell Version](/docs/bbb9f958-4fd3-4fda-903f-7d303bf26779)

3. **Create the PowerShell audit task.**  
   Follow the documentation here: [CW RMM - Task - PowerShell Version Information](/docs/a8419e91-9e07-4f16-be4b-769c78f86f1b)  
   **Please ensure that the task is scheduled per the above documentation!**

4. **Create the PowerShell update task.**  
   Follow the documentation here: [CW RMM - Task - PowerShell Version Update](https://proval.itglue.com/DOC-5078775-12825752)

5. **Create the custom monitor.**  
   Follow the documentation here: [CW RMM - Custom Monitor - PowerShell Version](/docs/8c623742-14b0-4263-8a1a-abd4c61d602d)  
   **Please ensure that the task is scheduled as the Automation Task on the monitor.**

## FAQ





