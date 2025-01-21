---
id: '84b2e461-c2a3-423f-8a2c-0ac4e8e62fb9'
title: 'Managing and Upgrading PowerShell to Version 5 in RMM'
title_meta: 'Managing and Upgrading PowerShell to Version 5 in RMM'
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
| [CW RMM - Custom Field - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824368) | Custom Field  | Stores PowerShell version information, including the "success/failure" status that determines if the machine is on PowerShell 5 or not.                                        |
| [CW RMM - Device Groups - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824362) | Device Group  | The device groups are used to report on devices that have not been audited, are < PowerShell 5, and > PowerShell 5. The PowerShell audit pending device group is used as the default target for the PowerShell version information audit script. |
| [CW RMM - Task - PowerShell Version Information](<../cwrmm/tasks/PowerShell Version Information.md>) | Task          | Gathers the PowerShell version and writes a success/failure note based on the PowerShell version of the device. If the target device is under PowerShell 5, it will write "failure" in the custom field. If the target device is over PowerShell 5, it will write "success" in the custom field. |
| [CW RMM - Task - PowerShell Version Update](https://proval.itglue.com/DOC-5078775-12825752) | Task          | This task will attempt to upgrade the target device to PowerShell version 5.                                                                                                 |
| [CW RMM - Custom Monitor - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824363) | Monitor       | This monitor reviews the custom field for "Success" or "Failure" and will trigger the PowerShell Version Update script if the machine is less than PowerShell 5.             |

## Implementation

1. **Create the custom field.** This step is required before the rest of the steps will work as expected.  
   Follow the documentation here: [CW RMM - Custom Field - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824368)

2. **Create the device groups.** This step is required before creating the tasks; otherwise, they will not have a proper target.  
   Follow the documentation here: [CW RMM - Device Groups - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824362)

3. **Create the PowerShell audit task.**  
   Follow the documentation here: [CW RMM - Task - PowerShell Version Information](<../cwrmm/tasks/PowerShell Version Information.md>)  
   **Please ensure that the task is scheduled per the above documentation!**

4. **Create the PowerShell update task.**  
   Follow the documentation here: [CW RMM - Task - PowerShell Version Update](https://proval.itglue.com/DOC-5078775-12825752)

5. **Create the custom monitor.**  
   Follow the documentation here: [CW RMM - Custom Monitor - PowerShell Version](https://proval.itglue.com/DOC-5078775-12824363)  
   **Please ensure that the task is scheduled as the Automation Task on the monitor.**

## FAQ


