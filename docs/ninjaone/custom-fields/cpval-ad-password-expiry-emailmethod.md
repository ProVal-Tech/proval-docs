---
id: '546c3075-2c22-4886-b9a6-224055c744e7'
slug: /546c3075-2c22-4886-b9a6-224055c744e7
title: 'cPVAL AD Password Expiry Email Method'
title_meta: 'cPVAL AD Password Expiry Email Method'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This custom field is set to register the email method for users whose passwords are about to expire within a specified number of days.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This custom field is set to register the email method for users whose passwords are about to expire within a specified number of days.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Email Method | cpvalAdPasswordExpiryEmailMethod | Graph | `Device`, `Location`, `Computer` | Drop-down | false |  | `Graph`, `SMTP` | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-emailmethod.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-1.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-7.webp)

## Changelog

### 2026-11-09

- Initial version of the document