---
id: '096bae7a-48e6-4a36-8339-e1ce79e573e4'
slug: /096bae7a-48e6-4a36-8339-e1ce79e573e4
title: 'SSTP_Routes_Site'
title_meta: 'SSTP_Routes_Site'
keywords: ['sstp', 'vpn', 'routes', 'split-tunneling', 'site']
description: 'Site-level override for the networks routed through the SSTP VPN connection. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f) for one site. Leave it empty to use the company's value. [SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b) overrides it for a single device. Enter `None` to remove all routes at this site.

| Value | What happens |
|---|---|
| `10.10.0.0/16,192.168.20.0/24` | The connection gets exactly these routes. Missing ones are added, and any others are removed. |
| `None` | Every route is removed from the connection. |
| Empty | The company's value applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f)
- [Custom Field: SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Routes_Site | Site-level override for the networks routed through the SSTP VPN connection. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter networks separated by commas, or None to remove all routes at this site. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/096bae7a-48e6-4a36-8339-e1ce79e573e4/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
