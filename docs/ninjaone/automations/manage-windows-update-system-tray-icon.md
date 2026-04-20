---
id: '13964fea-c4e9-435f-8043-5107efa21592'
slug: /13964fea-c4e9-435f-8043-5107efa21592
title: 'Manage Windows Update System Tray Icon'
title_meta: 'Manage Windows Update System Tray Icon'
keywords: ['windows','windows update','hide','unhide','icon','system','tray']
description: 'Shows or hides the Windows Update system tray icon for all users on Windows 10/11 endpoints.'
tags: ['registry','update','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Overview

This automation controls the Windows Update icon in the system tray for all users on Windows 10 and Windows 11 devices.

- By default, it hides the icon.
- Turn on `Show Windows Update Tray Icon` if you want to show the icon again.

## Sample Run

![SampleRun1](../../../static/img/docs/13964fea-c4e9-435f-8043-5107efa21592/sample-run.webp)

## Parameters

| parameter Name | Calculated Name | Type | Default | Description |
| -------------- | --------------- | ---- | ------- | ----------- |
| `Show Windows Update Tray Icon` | `showWindowsUpdateTrayIcon` | `Checkbox` | `False` | Check to show the tray icon. Leave unchecked to hide it. |

## Automation Setup/Import

Use this automation package:

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/manage-windows-update-system-tray-icon.ps1)

## Output

- Activity Details

## Changelog

### 2026-04-13

- Changed the automation name from `Hide-Unhide Windows Update Systray Icon` to `Manage Windows Update System Tray Icon`.
- Added support for Windows 11 24H2 and newer devices.

### 2026-03-30

- Initial version of the document.
