---
id: 'cwa-reboot-window-check'
title: 'Reboot Machine Within Configured Time Window'
title_meta: 'Reboot Machine Within Configured Time Window'
keywords: ['reboot', 'time', 'window', 'script', 'check']
description: 'This document details a script that reboots a machine only if it falls within a preconfigured time window. It includes setup requirements, process steps, and output logging information.'
tags: ['windows', 'configuration', 'notification', 'security', 'script']
draft: false
unlisted: false
---
## Summary

This script will reboot a machine, but only if it is between a preconfigured window. The window is NOT configured by default.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Reboot---Forced-with-Time-Window-Verification-&-Verify-Reboot/image_1.png)

## Dependencies

- Global variables have to be setup correctly

## Variables

- `@PSResult@` -> Output from the PowerShell time window check
- `@MachineTime@` -> grabs the local time of the machine
- `@newuptime@` -> gets the latest Uptime from the Automate Database

#### Global Parameters

| Name        | Example                                                                                                                                                        | Required | Description                       |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----------------------------------|
| WindowStart | 0 = Midnight<br>1 = 1:00 AM<br>5 = 5:00 AM<br>11 = 11:00 AM<br>23 = 11:00 PM                                                                                | True     | When is the window open to reboot |
| WindowEnd   | 0 = Midnight<br>1 = 1:00 AM<br>5 = 5:00 AM<br>11 = 11:00 AM<br>23 = 11:00 PM                                                                                | True     | When is the window closed to reboot |

## Process

1. Converts the window variables to an integer and runs a comparison to see if the machine is allowed to reboot during this window
2. Grabs the local machine time
3. Checks if the current time (trying to run the script) is within the reboot window or not
4. If so, reboot the machine and verify that the reboot was successful
   1. If the reboot fails or is showing uptime >1800 seconds, creates a ticket
   2. If successful logs success in the script logs as
5. If not within the window
   1. Log that the machine time is not within the window and exit the script

## Output

- Script log




