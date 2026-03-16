---
id: '3d1a16b3-688c-4911-a92d-835a578254a9'
slug: /3d1a16b3-688c-4911-a92d-835a578254a9
title: 'cPVAL Connect Secure Tenant ID'
title_meta: 'cPVAL Connect Secure Tenant ID'
keywords: ['cybercns', 'connectsecure', 'vulnerability', 'management']
description: 'Stores the top-level Tenant ID for the ConnectSecure environment. This identifier represents the primary tenant within the ConnectSecure hierarchy.'
tags: ['vulnerability', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-03-16
---

## Summary

Stores the top-level Tenant ID for the ConnectSecure environment. This identifier represents the primary tenant within the ConnectSecure hierarchy.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Connect Secure Tenant ID | cpvalConnectSecureTenantId | `Organization`, `Location`, `Device` | Secure | True | | Editable | Read/Write | Read/Write | Stores the top-level Tenant ID for the ConnectSecure environment. This identifier represents the primary tenant within the ConnectSecure hierarchy. | Enter the top-level ConnectSecure Tenant ID for this environment. | This field contains the unique Tenant ID that identifies the organization's root-level ConnectSecure tenant. | ConnectSecure |

## Dependencies

- [Solution - ConnectSecure Agent Deployment](/docs/0e33b1a2-5539-4451-b49d-2ba9b7f904dd)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-connect-secure-tenant-id.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/3d1a16b3-688c-4911-a92d-835a578254a9/image1.webp)

## Changelog

### 2026-03-16

- Change the field type to `Secure` from `Text`.

### 2025-12-10

- Initial version of the document
