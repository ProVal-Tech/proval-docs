---
id: '52919877-7d53-49a4-becf-cee8f59fd697'
slug: /52919877-7d53-49a4-becf-cee8f59fd697
title: 'SSTP_Split_Site'
title_meta: 'SSTP_Split_Site'
keywords: ['sstp', 'vpn', 'split-tunneling', 'routes', 'site']
description: 'Site-level override for split tunneling. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81) for one site. Leave it empty to use the company's value. [SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045) overrides it for a single device.

| Option | What goes through the VPN |
|---|---|
| `Enabled` | Only the networks in [SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f). Internet traffic stays on the device's own connection. |
| `Disabled` | All traffic. |
| Empty | The company's value applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81)
- [Custom Field: SSTP_Split_Endpoint](/docs/4c605b55-44bf-436f-8530-333aeb2f0045)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Split_Site | Site-level override for split tunneling. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to send only the networks in SSTP_Routes through the VPN. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/52919877-7d53-49a4-becf-cee8f59fd697/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
