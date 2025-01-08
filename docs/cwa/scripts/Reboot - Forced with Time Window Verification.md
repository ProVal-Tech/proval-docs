---
id: 'cwa-reboot-machine-time-window'
title: 'Reboot Machine Within Time Window'
title_meta: 'Reboot Machine Within Time Window'
keywords: ['reboot', 'machine', 'time', 'window', 'script']
description: 'This script allows you to reboot a machine only if it falls within a specified time window, which is not configured by default. It ensures that reboots occur at appropriate times to minimize disruption.'
tags: ['configuration', 'windows', 'security', 'notification']
draft: false
unlisted: false
---
## Summary

This script will reboot a machine, but only if it is between a preconfigured window. The window is NOT configured by default.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](5078775/docs/8246356/images/11482812)

## Dependencies

- Global variables have to be setup correctly

## Variables

- `@PSResult@` -> Output from the PowerShell time window check
- `@MachineTime@` -> grabs the local time of the machine
- `@newuptime@` -> gets the latest Uptime from the Automate Database

#### Global Parameters

| Name        | Example                                                                 | Required | Description                          |
|-------------|-------------------------------------------------------------------------|----------|--------------------------------------|
| WindowStart | 0 = Midnight<br>1 = 1:00 AM<br>5 = 5:00 AM<br>11 = 11:00 AM<br>23 = 11:00 PM | True     | When is the window open to reboot    |
| WindowEnd   | 0 = Midnight<br>1 = 1:00 AM<br>5 = 5:00 AM<br>11 = 11:00 AM<br>23 = 11:00 PM | True     | When is the window closed to reboot   |

## Output

- Script log


