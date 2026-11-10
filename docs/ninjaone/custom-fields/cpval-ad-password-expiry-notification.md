---
id: '8cc47fa6-a3d3-42d4-8708-9e924ef88479'
slug: /8cc47fa6-a3d3-42d4-8708-9e924ef88479
title: 'cPVAL AD Password Expiry Notification'
title_meta: 'cPVAL AD Password Expiry Notification'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This custom field is required to be set to enable the AD Password Expiry Notification alerting.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This custom field is required to be set to enable the AD Password Expiry Notification alerting.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Notification | cpvalAdPasswordExpiryNotification | Enable | `Organization`, `Location`, `Device` | Drop-down | false |  | `Enable`, `Disable` | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-notification.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-1.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-7.webp)

## Changelog

### 2026-11-09

- Initial version of the document