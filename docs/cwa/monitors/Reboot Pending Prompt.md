---
id: '8163996f-f8b6-4b7d-b5b1-6b965a9408d4'
slug: /8163996f-f8b6-4b7d-b5b1-6b965a9408d4
title: 'Reboot Pending [Prompt]'
title_meta: 'Reboot Pending [Prompt]'
keywords: ['monitor', 'reboot', 'windows', 'edf', 'automation', 'prompt', 'pending']
description: 'This document outlines an internal monitor designed to detect agents that have undergone a reboot through a specific script. It triggers another script to clear pending EDFs, allowing for re-triggering at a later time. This monitor is specifically intended for Windows workstations and is automation-driven.'
tags: ['reboot', 'windows']
draft: false
unlisted: false
---

## Summary

The internal Monitor is used for two functions. If a workstation is showing an uptime of over 2 weeks, the monitor automatically triggers the Script [User Prompt - Reboot [Reboot, Param, Autofix]](../scripts/User%20Prompt%20-%20Reboot.md). This script will only run when triggered by a monitor.

The Monitor has all of the following conditions that must be met before it kicks off the reboot prompting script:
1. Computers OS is Windows
    - The OS does not contain 'Server' or 'CE'
2. The computers uptime is greater than `[Property - proval_RebootPromptUptimeDays]` # of days
    - OR the `Pending Reboot` EDF is checked at the machine level
3. The computer is online
4. The computer has a idle time of less than 5 minutes (User is Active on the machine)
5. It has been at least `[System Property: RebootPromptDurBetween]` hours since the last time the user was prompted (Default of 4 hours)
6. The `Times Prompted` EDF does not = `Rebooted` (Signifying the script issued the reboot to the machine)
7. The `Last Prompted` EDF = 0 (Not Set/No Prompts occurred yet)
    - OR the computers uptime is greater than the last time the user was prompted (machine has not been rebooted by the user)

## Dependencies

[Script - User Prompt - Reboot [Reboot, Param, Autofix]](../scripts/User%20Prompt%20-%20Reboot.md)

[Script - Reset Reboot Pending EDFs](../Scripts/Reset%20Reboot%20Pending%20EDFs.md)

[Monitor - Reset Reboot Pending EDFs](./Reset%20Reboot%20Pending%20EDFs.md)


## Target

This monitor is an automation-driven reboot prompting monitor. This should only be applied to Windows Workstations

**Windows Workstations:** Should be run on non-servers and must be running Windows. 

## Exclusion EDFs

## Exclusion EDFs

| Name                 | Type     | Section    | Level    | Description                                           |
|----------------------|----------|------------|----------|-------------------------------------------------------|
| Disable Reboot Prompt| CheckBox | Exclusions | Client   | Flag this EDF to exclude the client from the solution.|
| Disable Reboot Prompt| CheckBox | Exclusions | Location | Flag this EDF to exclude the location from the solution.|
| Disable Reboot Prompt| CheckBox | Exclusions | Computer | Flag this EDF to exclude the computer from the solution.|