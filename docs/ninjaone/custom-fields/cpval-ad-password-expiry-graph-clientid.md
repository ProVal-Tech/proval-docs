---
id: '0a76e567-5a78-4bcb-92ce-5973fcedf73c'
slug: /0a76e567-5a78-4bcb-92ce-5973fcedf73c
title: 'cPVAL AD Password Expiry Graph Client ID'
title_meta: 'cPVAL AD Password Expiry Graph Client ID'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'This custom field is required to set the ClientId for the Ninja organization in O365 so the Graph integration can send emails to AD users.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

This custom field is required to set the ClientId for the Ninja organization in O365 so the Graph integration can send emails to AD users.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Graph Client ID | cpvalAdPasswordExpiryGraphClientId | xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx | `Organization`, `Location`, `Device` | Text | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-graph-clientId.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-2.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-5.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-8.webp)

## Changelog

### 2026-11-09

- Initial version of the document