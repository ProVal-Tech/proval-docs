---
id: '9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b'
slug: /9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b
title: 'cPVAL Current Developer Mode'
title_meta: 'cPVAL Current Developer Mode'
keywords: ['developer-mode', 'enable-developer-mode', 'disable-developer-mode', 'check-developer-mode', 'manage-developer-mode']
description: 'Stores the current Developer Mode state from the device. This field is updated when the automation runs in Check, Enable, or Disable modes.'
tags: ['windows', 'auditing', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-17
---

## Summary

This field shows the current Developer Mode state of a device. It is a read only field and is updated automatically by the [Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af) automation.

When the automation runs in `Check` mode, it reads the current state from the device and stores it here. When running in `Enable` or `Disable` mode, the field is updated after the change is applied.

This field helps track what setting is actually present on the device at the time of the last run. It allows users to confirm whether Developer Mode is enabled or disabled without needing to manually check the device.

It is useful for reporting, auditing, and verifying that automation actions have been applied correctly.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Available Options | Editable | Custom Field Tab Name |
| ----- | ---------- | ---------------- | ---- | -------- | ------------- | ----------------- | -------- | --------------------- |
| cPVAL Current Developer Mode | cpvalCurrentDeveloperMode | `Device` | Text | `False` | | | `False` | `Developer Mode` |

## Dependencies

- [Automation: Manage Developer Mode](/docs/d1a715d8-715c-4f72-9f2a-a0d93c5c40af)
- [Solution: Manage Developer Mode](/docs/3ab05cd9-d579-49d1-92c8-2b57870f5e7d)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-current-developer-mode.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/9e05e3a1-05fb-4e33-a74c-f9df79ca5e1b/image1.webp)

## Changelog

### 2026-06-17

- Initial version of the document
