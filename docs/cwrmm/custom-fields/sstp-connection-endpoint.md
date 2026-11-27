---
id: '0d156eb8-142a-48a5-bbc7-00cab392c9c1'
slug: /0d156eb8-142a-48a5-bbc7-00cab392c9c1
title: 'SSTP_Connection_Endpoint'
title_meta: 'SSTP_Connection_Endpoint'
keywords: ['sstp', 'vpn', 'connection-name', 'endpoint']
description: 'Endpoint-level override for the SSTP VPN connection name. Overrides Site and Company settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2) and [SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3) for a single device. Leave it empty to use the site or company value. Type a single quote twice.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Connection](/docs/d3fcba13-20f4-4371-a743-937868c9e8b3)
- [Custom Field: SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Connection_Endpoint | Endpoint-level override for the SSTP VPN connection name. Overrides Site and Company settings. | `Endpoint` | `Text Box` | Leave blank to inherit. Enter the connection name. Type a single quote twice. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
