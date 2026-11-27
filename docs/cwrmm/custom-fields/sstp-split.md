---
id: 'bafcaae5-8322-4ff2-9ace-26f27aa5df81'
slug: /bafcaae5-8322-4ff2-9ace-26f27aa5df81
title: 'SSTP_Split'
title_meta: 'SSTP_Split'
keywords: ['sstp', 'vpn', 'split-tunneling', 'routes', 'company']
description: 'Company-level split tunneling setting for the SSTP VPN connection. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Turns split tunneling on or off. [SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697) overrides it for a site, and [SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045) overrides both for a single device. The default value, `Disabled`, applies to every company that doesn't have its own value.

| Option | What goes through the VPN |
|---|---|
| `Enabled` | Only the networks in [SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f). Internet traffic stays on the device's own connection. |
| `Disabled` | All traffic. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697)
- [Custom Field: SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Split | Company-level split tunneling setting for the SSTP VPN connection. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `String` | `Enabled`, `Disabled` | Select Enabled to send only the networks in SSTP_Routes through the VPN. | `Disabled` | `Yes` |

:::note

With split tunneling on and no routes, Windows only routes the network that the VPN address belongs to. Add your internal networks to SSTP_Routes.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
