---
id: '5e860000-83c9-49fa-87fa-f046fe1a793f'
slug: /5e860000-83c9-49fa-87fa-f046fe1a793f
title: 'SSTP_Routes'
title_meta: 'SSTP_Routes'
keywords: ['sstp', 'vpn', 'routes', 'split-tunneling', 'company']
description: 'Company-level list of networks routed through the SSTP VPN connection. When set, the routes of the connection are made to match this list. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The networks sent through the VPN, in network/prefix format. Separate them with commas, semicolons or spaces. [SSTP_Routes_Site](/docs/096bae7a-48e6-4a36-8339-e1ce79e573e4) overrides it for a site, and [SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b) overrides both for a single device.

| Value | What happens |
|---|---|
| `10.10.0.0/16,192.168.20.0/24` | The connection gets exactly these routes. Missing ones are added, and any others are removed. |
| `None` | Every route is removed from the connection. |
| Empty at every level | The routes are left as they are. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Routes_Site](/docs/096bae7a-48e6-4a36-8339-e1ce79e573e4)
- [Custom Field: SSTP_Routes_Endpoint](/docs/9210fae1-36ed-4210-86a8-b69f117ca50b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Routes | Company-level list of networks routed through the SSTP VPN connection. When set, the routes of the connection are made to match this list. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter networks separated by commas, for example 10.10.0.0/16,192.168.20.0/24. None removes all routes. Blank leaves routes untouched. |  | `Yes` |

:::note

Routes matter most with [SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81) set to `Enabled`, when only these networks go through the VPN.

A value that isn't in network/prefix format, such as `10.10.0.0`, fails the task and names the value.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/5e860000-83c9-49fa-87fa-f046fe1a793f/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
