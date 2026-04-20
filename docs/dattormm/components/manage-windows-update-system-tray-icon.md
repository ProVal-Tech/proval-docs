---
id: 'd615ac1e-c12b-409a-966d-53c6100817ce'
slug: /d615ac1e-c12b-409a-966d-53c6100817ce
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
- Turn on `Show_Windows_Update_Tray_Icon` if you want to show the icon again.

## Implementation  

1. Download the `component` [Manage Windows Update System Tray Icon](../../../static/attachments/manage-windows-update-system-tray-icon.cpt) from the attachments.

2. After downloading the attached file, click on the `Import` button
3. Select the component just downloaded and add it to the Datto RMM interface.  
![Image 1](../../../static/img/docs/cad55427-9b06-47c0-b675-6b2fb974c1c4/template1.webp)  

## Sample Run

![Image5](../../../static/img/docs/d615ac1e-c12b-409a-966d-53c6100817ce/image1.webp)

## Datto Variables

| Variable Name | Type | Default | Description |
| ------------- | ---- | ------- | ----------- |
| `Show_Windows_Update_Tray_Icon` | `Boolean` | `False` | Check to show the tray icon. Leave unchecked to hide it. |

## Output

- stdOut
- stdError

## Attachments

[Manage Windows Update System Tray Icon](../../../static/attachments/manage-windows-update-system-tray-icon.cpt)

## Changelog

### 2026-04-13

- Changed the automation name from `Hide-Unhide Windows Update Systray Icon` to `Manage Windows Update System Tray Icon`.
- Added support for Windows 11 24H2 and newer devices.

### 2026-03-30

- Initial version of the document.
