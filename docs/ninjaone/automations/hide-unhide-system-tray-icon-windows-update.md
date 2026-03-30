---
id: '13964fea-c4e9-435f-8043-5107efa21592
slug: /13964fea-c4e9-435f-8043-5107efa21592
title: 'Hide-Unhide Windows Update Systray Icon'
title_meta: 'Hide-Unhide Windows Update Systray Icon'
keywords: ['ninjarmm','windows','windows update','hide','unhide','icon','system','tray']
description: 'This script provides features to hide or unhide the Windows update icon from the system tray.'
tags: ['registry','update','patching']
draft: false
unlisted: false
last_update:
  date: 2026-03-30
---

## Overview

This script provides features to hide or unhide the Windows update icon from the system tray.

Enable the variable `HIDE_WinUpdateSystray` to hide the Windows Update icon from the system tray and disable it to unhide it. By default this component will hide the Windows Update icon.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/13964fea-c4e9-435f-8043-5107efa21592/sample-run.webp)

## Parameters

| parameter Name | Calculated Name | Type | Default | Description |
| -------------- | --------------- | ---- | ------- | ----------- |
| HIDE_WinUpdateSystray | hide_winupdatesystray | Checkbox | True | Set it to false to unhide the Windows Update icon display from the system tray. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/hide-unhide-system-tray-icon-windows-update.ps1)

## Output

- Activity Details  

## Changelog

### 2026-03-30

- Initial version of the document.
