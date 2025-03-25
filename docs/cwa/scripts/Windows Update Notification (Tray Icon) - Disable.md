---
id: 'ae80d21c-908e-413f-97f1-1a4e370553ae'
slug: /ae80d21c-908e-413f-97f1-1a4e370553ae
title: 'Windows Update Notification (Tray Icon) - Disable'
title_meta: 'Windows Update Notification (Tray Icon) - Disable'
keywords: ['windows', 'update', 'notification', 'tray', 'icon', 'script', 'disable']
description: 'This document outlines a script that disables the Windows Update Notification Tray Icon by modifying the TrayIconVisibility DWORD value. It includes a verification process to check if the setting is already disabled and provides a sample run image for reference.'
tags: ['update', 'windows']
draft: false
unlisted: false
---

## Summary

This script will disable the Windows Update Notification (Tray Icon) by setting the TrayIconVisibility DWORD value to 0.

**Time Saved by Automation:** 5 Minutes

## Sample Run

![Sample Run](../../../static/img/Windows-Update-Notification-(Tray-Icon)---Disable/image_1.png)

## Process

- The script first verifies if the Windows Update Notification (Tray Icon) setting is already disabled. If it is, the script will exit.
- If the setting is not disabled, the script will run a PowerShell command to disable it.
- After that, the script will call a subscript to flag the machine as reboot pending.


