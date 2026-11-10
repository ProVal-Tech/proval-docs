---
id: '089f83dd-2b05-4dcd-9cee-f60fd0267b82'
slug: /089f83dd-2b05-4dcd-9cee-f60fd0267b82
title: 'cPVAL AD Password Expiry Reminder Days'
title_meta: 'cPVAL AD Password Expiry Reminder Days'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'Optional extra reminders, e.g. 3,1. Blank means one email per cycle.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Optional extra reminders, e.g. 3,1. Blank means one email per cycle.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Reminder Days | cpvalAdPasswordExpiryReminderDays | 3,1 | `Organization`, `Location`, `Device` | Text | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-reminder-days.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-1.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-7.webp)

## Changelog

### 2026-11-09

- Initial version of the document