---
id: '879879ec-21c4-4c8d-9301-43b14ffbe830'
slug: /879879ec-21c4-4c8d-9301-43b14ffbe830
title: 'cPVAL AD Password Expiry SMTP Port'
title_meta: 'cPVAL AD Password Expiry SMTP Port'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This custom field is required to be set only when the custom field ''cpvalAdPasswordExpiryEmailMethod'' is set to the SMTP option. STARTTLS. Port 465 (implicit TLS) is not supported.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Provide the SMTP port detail. 

Required only when the [cPVAL AD Password Expiry Email Method](/docs/546c3075-2c22-4886-b9a6-224055c744e7) is set to `SMTP`.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry SMTP Port | cpvalAdPasswordExpirySmtpPort | ******* | `Organization`, `Location`, `Device` | Text | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-smtp-port.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-3.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-6.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-9.webp)

## Changelog

### 2026-11-09

- Initial version of the document