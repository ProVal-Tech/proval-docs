---
id: 'cwa-disable-windows-update-notification'
title: 'Disable Windows Update Notification Tray Icon'
title_meta: 'Disable Windows Update Notification Tray Icon'
keywords: ['windows', 'update', 'notification', 'tray', 'icon', 'script', 'disable']
description: 'This document outlines a script that disables the Windows Update Notification Tray Icon by modifying the TrayIconVisibility DWORD value. It includes a verification process to check if the setting is already disabled and provides a sample run image for reference.'
tags: ['windows', 'notification', 'update', 'configuration', 'script']
draft: false
unlisted: false
---
## Summary

This script will disable the Windows Update Notification (Tray Icon) by setting the TrayIconVisibility DWORD value to 0.

Time Saved by Automation: 5 Minutes

## Sample Run

![Sample Run](..\..\..\static\img\Windows-Update-Notification-(Tray-Icon)---Disable\image_1.png)

## Process

- The first script will verify if the Windows Update Notification (Tray Icon) setting is already disabled; if it is, the script will exit.
- If the setting is not disabled, the script will run a PowerShell command to disable it.
- After that, the script will call a subscript to flag the machine as reboot pending.



