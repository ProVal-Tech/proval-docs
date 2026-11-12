---
id: 'e734bed4-a878-4574-b456-1e1ed59ee6bc'
slug: /e734bed4-a878-4574-b456-1e1ed59ee6bc
title: 'cPVAL Lock Status'
title_meta: 'cPVAL Lock Status'
keywords: ['lock', 'stolen', 'lockdown', 'status']
description: 'Shows whether the Lock Stolen System solution has locked the device: Locked, Partially Locked or Unlocked.'
tags: ['custom-fields', 'security', 'data-theft']
draft: false
unlisted: false
last_update:
  date: 2026-11-12
---

## Summary

Shows whether the [Lock Stolen System](/docs/13b4df99-df9b-4a57-bc0f-8675c68be028) solution has locked the device. It shows `Locked` after a successful lockdown, `Partially Locked` when a Mac lockdown couldn't lock every user account, and `Unlocked` after an unlock automation reverses the lockdown. It's empty if the device was never locked. The field is on the **Lock Stolen System [Windows]** tab of Windows devices and the **Lock Stolen System [Macintosh]** tab of Macs.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL Lock Status | cpvalLockStatus | `Locked` | `Device` | Text | No |  | | Yes | <ul><li>`Lock Stolen System [Windows]`</li><li>`Lock Stolen System [Macintosh]`</li></ul> |

## Dependencies

- [Automation: Lock Stolen System [Windows]](/docs/0f78be64-557a-4c0e-b7cf-e2ba41e71374)
- [Automation: Lock Stolen System [Macintosh]](/docs/08b38e83-0836-49de-b185-dbfc97a0f249)
- [Automation: Unlock Stolen System [Windows]](/docs/0ced6b64-58a6-4a7f-bfea-a40724f6b554)
- [Automation: Unlock Stolen System [Macintosh]](/docs/ef4a9833-6094-4e6e-ad99-12ae267db316)
- [Solution: Lock Stolen System](/docs/13b4df99-df9b-4a57-bc0f-8675c68be028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-lock-status.toml)

## Sample Screenshot

![Sample ScreenShot](../../../static/img/docs/e734bed4-a878-4574-b456-1e1ed59ee6bc/image1.webp)

## Changelog

### 2026-11-12

- Added the field to Mac devices on the Lock Stolen System [Macintosh] tab, moved it to the Lock Stolen System [Windows] tab on Windows devices, and added the Partially Locked and Unlocked values.

### 2026-02-25

- Initial version of the document
