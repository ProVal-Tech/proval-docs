---
id: '4e8aa00e-8e4d-413d-86d6-6798790c6235'
title: 'Reboot Pending Prompt Monitor'
title_meta: 'Reboot Pending Prompt Monitor'
keywords: ['reboot', 'monitor', 'windows', 'uptime', 'script']
description: 'The Reboot Pending Prompt Monitor is designed to automate the reboot prompting process for Windows workstations with specific conditions regarding uptime and user activity. It ensures that users are prompted to reboot their machines under certain criteria, enhancing system performance and compliance.'
tags: ['monitor', 'windows', 'uptime', 'script', 'exclusions']
draft: false
unlisted: false
---
## Summary

The Reboot Pending [Prompt] Monitor is used for two functions. If a workstation is showing an uptime of over 2 weeks, the monitor automatically triggers the Script [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644). This script will only run when triggered by a monitor.

The Monitor has all of the following conditions that must be met before it kicks off the reboot prompting script:

1. Computers OS is Windows
   - The OS does not contain 'Server' or 'CE'
2. The computer's uptime is greater than [Property - proval_RebootPromptUptimeDays] # of days
   - OR the ![EDF is checked at the machine level](../../../static/img/Reboot-Pending-Prompt/image_1.png)
3. The computer is online
4. The computer has an idle time of less than 5 minutes (User is Active on the machine)
5. It has been at least `[System Property: RebootPromptDurBetween]` hours since the last time the user was prompted (Default of 4 hours)
6. The `Times Prompted` EDF does not equal 'Rebooted' (Signifying the script issued the reboot to the machine)
7. The `Last Prompted` EDF = 0 (Not Set/No Prompts occurred yet)
   - OR the computer's uptime is greater than the last time the user was prompted (machine has not been rebooted by the user)

## Dependencies

The following items are needed for this monitor to function:

- [EPM - Windows Configuration - Script - User Prompt - Reboot](https://proval.itglue.com/DOC-5078775-9076644)
- [EPM - Windows Configuration - Script - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-9077421)
- [EPM - Windows Configuration - Monitor - Reset Reboot Pending EDFs](https://proval.itglue.com/DOC-5078775-13433274)

## Target

This monitor is an Automation Driven reboot prompting monitor. This should only be applied to Windows Workstations.

Windows Workstations - Should be run on non-servers and must be running Windows.

## Exclusion EDFs

| **Name**               | Type     | Section     | **Level** | **Description**                                                       |
|------------------------|----------|-------------|-----------|-----------------------------------------------------------------------|
| Disable Reboot Prompt  | CheckBox | Exclusions  | Client    | Flag this EDF to exclude the client from the solution.                |
| Disable Reboot Prompt  | CheckBox | Exclusions  | Location  | Flag this EDF to exclude the location from the solution.              |
| Disable Reboot Prompt  | CheckBox | Exclusions  | Computer  | Flag this EDF to exclude the computer from the solution.              |






