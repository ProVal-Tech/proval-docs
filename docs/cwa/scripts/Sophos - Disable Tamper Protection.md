---
id: 'f7d7af7b-0b1e-463a-bda5-e9d30901e0b6'
title: 'Reboot into Safe Mode and Disable Sophos Tamper Protection'
title_meta: 'Reboot into Safe Mode and Disable Sophos Tamper Protection'
keywords: ['sophos', 'tamper', 'protection', 'reboot', 'safe', 'mode', 'registry']
description: 'This document describes a script that reboots a Windows machine into safe mode and modifies the registry keys related to tamper protection for systems with Sophos Tamper Protection enabled, ultimately streamlining the process of disabling this feature.'
tags: ['recovery', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

This script will reboot a machine into safe mode and change the registry keys related to tamper protection for machines with Sophos Tamper Protection enabled.

**Time Saved by Automation:** 20 Minutes

## Sample Run

![Sample Run](../../../static/img/Sophos---Disable-Tamper-Protection/image_1.png)

## Dependencies

- The target machine must have Sophos installed.
- The target machine must be running a Windows operating system.

## Variables

- `@Result@` - Used to verify if the tamper protection was disabled properly.

## Process

The script will first verify that the target device has Sophos installed. It will then reboot the machine into safe mode and wait for the machine to come back up. The script will stop the Sophos services and change the appropriate registry keys to disable tamper protection. After that, it will restart the Sophos services and reboot the machine back to normal mode. Finally, the script will verify that tamper protection was properly disabled; if successful, it will exit with a success log message. If the script fails, it will exit with an error log message.

## Output

Script log messages only.

