---
id: '618c9371-05fa-490e-ba06-20b76a806c72'
title: 'Hide Weather Widget from Taskbar'
title_meta: 'Hide Weather Widget from Taskbar'
keywords: ['registry', 'widget', 'windows', 'taskbar', 'automation']
description: 'This script inserts a registry key to hide the weather widget from the Windows taskbar. Initially rolled out in version 21H1, the weather widget has been pushed through cumulative updates on supported versions. The script verifies the successful addition of the registry key and flags the machine for a reboot if successful.'
tags: ['performance', 'registry', 'setup', 'update', 'windows']
draft: false
unlisted: false
---

## Summary

This script will insert a registry key to hide the weather widget from the taskbar. The new weather widget was initially rolled out in version 21H1, but Microsoft has been pushing it through cumulative updates on supported versions.

**Time Saved by Automation:** 10 Minutes

## Sample Run

![Sample Run](../../../static/img/Hide-Weather-Widget-from-Taskbar/image_1.png)

## Variables

`@Result@` - This variable will indicate whether the registry key was successfully added or not.

## Process

- Runs PowerShell to insert a registry key that will hide the weather widget on the Windows taskbar and verifies whether the registry key was successfully added.
- If the registry key was successfully added, the script will run the `@Flag for Reboot` script to flag the machine for a reboot.

## Output

- Script log



