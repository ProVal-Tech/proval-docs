---
id: '968485ea-c81e-4a03-b72b-b25a7bca424c'
slug: /968485ea-c81e-4a03-b72b-b25a7bca424c
title: 'SSTP_DNS_Suffix_Site'
title_meta: 'SSTP_DNS_Suffix_Site'
keywords: ['sstp', 'vpn', 'dns-suffix', 'domain', 'site']
description: 'Site-level override for the SSTP VPN DNS suffix. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c) for one site. Leave it empty to use the company's value. [SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c) overrides it for a single device.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c)
- [Custom Field: SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_DNS_Suffix_Site | Site-level override for the SSTP VPN DNS suffix. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter the internal DNS suffix. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/968485ea-c81e-4a03-b72b-b25a7bca424c/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
