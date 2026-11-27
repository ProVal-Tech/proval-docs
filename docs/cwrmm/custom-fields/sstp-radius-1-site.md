---
id: 'e3fc5254-1fcd-4f1c-b98e-8c6f5335a120'
slug: /e3fc5254-1fcd-4f1c-b98e-8c6f5335a120
title: 'SSTP_RADIUS_1_Site'
title_meta: 'SSTP_RADIUS_1_Site'
keywords: ['sstp', 'vpn', 'radius', 'nps', 'certificate', 'peap', 'site']
description: 'Site-level override for the primary RADIUS server. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d) for one site. Leave it empty to use the company's value. [SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b) overrides it for a single device.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d)
- [Custom Field: SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_RADIUS_1_Site | Site-level override for the primary RADIUS server. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter the host name or FQDN. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/e3fc5254-1fcd-4f1c-b98e-8c6f5335a120/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
