---
id: '2715ef45-6fba-4ff9-9e67-c6f65bc88615'
slug: /2715ef45-6fba-4ff9-9e67-c6f65bc88615
title: 'cPVAL AD Password Expiry Exclusions'
title_meta: 'cPVAL AD Password Expiry Exclusions'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'Provide sAMAccountNames separated by commas or newlines to be excluded from the password expiration notification. * wildcard allowed, e.g., svc_*'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Provide sAMAccountNames separated by commas or newlines to be excluded from the password expiration notification. * wildcard allowed, e.g., svc_*.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Exclusions | cpvalAdPasswordExpiryExclusions | svc_* | `Organization`, `Location`, `Device` | Multi-line | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-exclusions.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-1.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-7.webp)

## Changelog

### 2026-11-09

- Initial version of the document