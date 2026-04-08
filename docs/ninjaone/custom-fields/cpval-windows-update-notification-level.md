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
  date: 2026-04-08
---

## Summary

This custom field is used to configure the Windows Updates notification based on the selected options.

## Details

| Label | Field Name | Definition Scope | Type | Required | Option Value | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------ | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Update Notification Level | cpvalWindowsUpdateNotificationLevel | Organization , Location, Device | DropDown | False  | The default Windows Update notification level, Disable all notifications including restart prompt, Disable all notifications excluding restart prompt |  | Editable | Read/Write | Read/Write | This custom field is used to configure the Windows Updates notification based on the selected options. |  |  |  |

## Dependencies

[Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-notification-level.toml)

## Changelog

### 2026-04-08

- Initial version of the document