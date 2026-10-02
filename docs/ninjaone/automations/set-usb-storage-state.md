---
id: 'b066122e-052f-4b5c-a7e7-a2c58f4e5d8d'
slug: /b066122e-052f-4b5c-a7e7-a2c58f4e5d8d
title: 'Set USB Storage State'
title_meta: 'Set USB Storage State'
keywords: ['usb', 'storage', 'registry']
description: 'Enables or disables USB mass storage via the USBSTOR service ''Start'' value.'
tags: ['registry', 'storage']
draft: false
unlisted: false
last_update:
  date: 2026-10-02
---

## Overview

Enables or disables USB mass storage via the USBSTOR service 'Start' value.

## Sample Run

![Sample Run 1](<../../../static/img/docs/b066122e-052f-4b5c-a7e7-a2c58f4e5d8d/image.webp>)

![Sample Run 2](<../../../static/img/docs/b066122e-052f-4b5c-a7e7-a2c58f4e5d8d/image1.webp>)

## Dependencies

- [Solution - Set USB Storage State](/docs/8eb15892-347b-4786-a818-0d1bfb55f79b)

## Parameters

| Name | Example | Accepted Values | Required | Default | Type | Description |
| ---- | ------- | --------------- | -------- | ------- | ---- | ----------- |
| USBStorageAction | Enable | Enable, Disable | Yes |  | Dropdown | Select the option to either disable or enable the USB Storage. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/set-usb-storage-state.ps1)

## Output

- Activity Details  

## Changelog

### 2026-10-02

- Initial version of the document