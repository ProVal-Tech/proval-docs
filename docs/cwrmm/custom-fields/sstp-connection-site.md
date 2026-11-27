---
id: '942398eb-d14a-4cea-aee8-f392bad853b2'
slug: /942398eb-d14a-4cea-aee8-f392bad853b2
title: 'SSTP_Connection_Site'
title_meta: 'SSTP_Connection_Site'
keywords: ['sstp', 'vpn', 'connection-name', 'site']
description: 'Site-level override for the SSTP VPN connection name. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3) for one site. Leave it empty to use the company's value. [SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1) overrides it for a single device. Type a single quote twice.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3)
- [Custom Field: SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Connection_Site | Site-level override for the SSTP VPN connection name. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter the connection name. Type a single quote twice. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/942398eb-d14a-4cea-aee8-f392bad853b2/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
