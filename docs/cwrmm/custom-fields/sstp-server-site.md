---
id: '89c2001e-dfce-43fd-b622-23a6e0f9703f'
slug: /89c2001e-dfce-43fd-b622-23a6e0f9703f
title: 'SSTP_Server_Site'
title_meta: 'SSTP_Server_Site'
keywords: ['sstp', 'vpn', 'server-address', 'site']
description: 'Site-level override for the SSTP VPN server address. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Server](/docs/74c3c252-1d85-4860-8e89-4c4e7d2804d7) for one site. Leave it empty to use the company's value. [SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc) overrides it for a single device. Use it for a site that connects to its own VPN server.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Server](/docs/74c3c252-1d85-4860-8e89-4c4e7d2804d7)
- [Custom Field: SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Server_Site | Site-level override for the SSTP VPN server address. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter the public host name of the VPN server. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/89c2001e-dfce-43fd-b622-23a6e0f9703f/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
