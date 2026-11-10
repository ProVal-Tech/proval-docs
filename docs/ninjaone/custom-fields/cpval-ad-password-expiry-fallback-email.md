---
id: '955e220f-aaab-486c-8097-a55d8a882a97'
slug: /955e220f-aaab-486c-8097-a55d8a882a97
title: 'cPVAL AD Password Expiry Fallback Email'
title_meta: 'cPVAL AD Password Expiry Fallback Email'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'Optional. Helpdesk/PSA mailbox(es) for users without an email address, separated by semicolons (;).'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Optional. Helpdesk/PSA mailbox(es) for users without an email address, separated by semicolons (;).

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Fallback Email | cpvalAdPasswordExpiryFallbackEmail | helpdesk@domain.com | `Organization`, `Location`, `Device` | Text | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-fallback-email.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-2.webp)

### Organization and Location Level

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-5.webp)

![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-8.webp)

## Changelog

### 2026-11-09

- Initial version of the document