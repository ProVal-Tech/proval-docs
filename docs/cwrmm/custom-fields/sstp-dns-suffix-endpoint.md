---
id: '2a2f7930-d975-4d1b-9b93-808992ddd76c'
slug: /2a2f7930-d975-4d1b-9b93-808992ddd76c
title: 'SSTP_DNS_Suffix_Endpoint'
title_meta: 'SSTP_DNS_Suffix_Endpoint'
keywords: ['sstp', 'vpn', 'dns-suffix', 'domain', 'endpoint']
description: 'Endpoint-level override for the SSTP VPN DNS suffix. Overrides Site and Company settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c) and [SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c) for a single device. Leave it empty to use the site or company value.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c)
- [Custom Field: SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_DNS_Suffix_Endpoint | Endpoint-level override for the SSTP VPN DNS suffix. Overrides Site and Company settings. | `Endpoint` | `Text Box` | Leave blank to inherit. Enter the internal DNS suffix. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
