---
id: '9116ea7c-c6ef-4b49-a906-4a9e0e148b64'
slug: /9116ea7c-c6ef-4b49-a906-4a9e0e148b64
title: 'cPVAL AD Password Expiry Issues'
title_meta: 'cPVAL AD Password Expiry Issues'
keywords: ['access-management', user-management', 'active-directory', 'ad', 'password-expiration', 'notification']
description: 'Users who couldn''t be notified + failed emails + script errors. 0 = healthy.'
tags: ['active-directory', 'access-management']
draft: false
unlisted: false
last_update:
  date: 2026-11-09
---

## Summary

Count of users who could not be notified due to email delivery failures or script execution errors.

0 = Healthy


## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL AD Password Expiry Issues | cpvalAdPasswordExpiryIssues | 1 | `Device` | Integer | false |  |  | Yes | AD Password Expiration |

## Dependencies

- [Solution - AD Password Expiration Notification](/docs/d4cea30e-2724-4a28-870e-91eb349ad028)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-ad-password-expiry-issues.toml)

## Sample Screenshot

### Device Level
![Sample Screenshot](../../../static/img/docs/c39c4df0-e2ec-40e3-abdc-55d73f439dad/image-4.webp)

## Changelog

### 2026-11-09

- Initial version of the document