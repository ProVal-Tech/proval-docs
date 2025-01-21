---
id: '663e3658-c389-4ab6-b7a2-8486f9e237c1'
title: 'Fast Boot - Disable'
title_meta: 'Fast Boot - Disable'
keywords: ['windows', 'registry', 'fast', 'boot', 'shutdown']
description: 'This document details a script designed to disable the Windows Fast Boot feature by adjusting the local registry on the target device. Fast Boot can prevent a full kernel reboot during shutdown, potentially causing system issues and impacting patch installations. The script ensures proper functionality by requiring a device restart for changes to take effect.'
tags: ['performance', 'reboot', 'registry', 'windows']
draft: false
unlisted: false
---

## Summary

This script will adjust the local registry on the target device and disable the Windows Fast Boot feature. When a machine has Fast Boot enabled, it will not perform a full kernel reboot on "shutdown," which can lead to system misbehavior. This can also impact the installation of patches on devices, as the patch will not be able to apply itself fully until the machine is properly restarted. The target device will need to be restarted for this change to take effect.

**Time Saved by Automation:** 5 Minutes

## Sample Run

**Target:** Windows Device  
**Note:** This script is part of the ProVal @Fast Boot Solution. This solution can be run manually and not as an autofix.

![Sample Run](../../../static/img/Fast-Boot---Disable/image_1.png)

## Dependencies

- **Role Definition:** @Windows Fast Boot Enabled
- **Monitor:** @ProVal - Production - Windows - Fast Boot Enabled
- **Dataview:** Windows - @Fast Boot Enabled [Role]

## Variables

- **@HiberBoot@** - This variable is used to verify that the registry change took place as expected.

## Process

This script will first verify that it is a Windows-based device; otherwise, it will exit.

It will then set the registry key to disable Fast Boot on the system and verify that the change occurred as expected.

If the script was successful, it will exit with a log message indicating that the registry was updated successfully and that the machine needs to be rebooted for the setting to take effect.

If the value did not change in the registry, the script will exit with a failure message indicating it was unable to adjust the registry value.

## Output

Script log messages only.



