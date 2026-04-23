---
id: '233110ca-c1ca-4ef0-84ba-4285ab3c895e'
slug: /233110ca-c1ca-4ef0-84ba-4285ab3c895e
title: 'cPVAL Windows Update Notification Level'
title_meta: 'cPVAL Windows Update Notification Level'
keywords: ['windows','updates','patching']
description: 'This custom field is used to configure the Windows Updates notification based on the selected options.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-22
---

## Summary

This custom field is used to configure the Windows Updates notification based on the selected options.

## Details

| Label | Field Name | Definition Scope | Type | Required | Option Value | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------ | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Update Notification Level | cpvalWindowsUpdateNotificationLevel | `Organization` , `Location`, `Device` | DropDown | False  |</br>`The default Windows Update notification level`,</br>`Disable all notifications including restart prompt`,</br>`Disable all notifications excluding restart prompt` |  | Editable | Read/Write | Read/Write | This custom field is used to configure the Windows Updates notification based on the selected options. | 	This custom field is used to configure the Windows Updates notification based on the selected options. | Select desired notification style for Windows Update. | Windows Updates |

## Dependencies

- [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
- [Solution - Windows Update UI Enable-Disable](/docs/a6da0735-ac80-40f8-8ad3-375ffa8d0e93)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-notification-level.toml)

## Sample Screenshot

![Organization/Location level](../../../static/img/docs/233110ca-c1ca-4ef0-84ba-4285ab3c895e/image.webp)

## Changelog

### 2026-04-16

- Removed unnecessary auditing solution, that contains multiple groups, custom fields, and complicated compound conditions.

### 2026-04-22

- Initial version of the document