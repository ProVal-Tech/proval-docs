---
id: 'c31a9bfa-2b08-47b5-b148-777b6adf3d54'
slug: /c31a9bfa-2b08-47b5-b148-777b6adf3d54
title: 'cPVAL AD Password Expiry SMTP Username'
title_meta: 'cPVAL AD Password Expiry SMTP Username'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This custom field is required to provide the SMTP server details only when the custom field ''cpvalAdPasswordExpiryEmailMethod'' is set to the SMTP option.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This custom field is required to provide the SMTP server details only when the custom field 'cpvalAdPasswordExpiryEmailMethod' is set to the SMTP option.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry SMTP Username | cpvalAdPasswordExpirySmtpUsername | testuser | `Organization`, `Location`, `Device` | Text | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-smtp-username.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-3.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-6.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-9.webp)

## Changelog

### 2026-11-09

- Initial version of the document