---
id: '4c605b55-44bf-436f-8530-333aeb2f0045'
slug: /4c605b55-44bf-436f-8530-333aeb2f0045
title: 'SSTP_Split_Endpoint'
title_meta: 'SSTP_Split_Endpoint'
keywords: ['sstp', 'vpn', 'split-tunneling', 'routes', 'endpoint']
description: 'Endpoint-level override for split tunneling. Overrides Site and Company settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697) and [SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81) for a single device. Leave it empty to use the site or company value.

| Option | What goes through the VPN |
|---|---|
| `Enabled` | Only the networks in [SSTP_Routes](/docs/5e860000-83c9-49fa-87fa-f046fe1a793f). Internet traffic stays on the device's own connection. |
| `Disabled` | All traffic. |
| Empty | The site or company value applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Split](/docs/bafcaae5-8322-4ff2-9ace-26f27aa5df81)
- [Custom Field: SSTP_Split_Site](/docs/52919877-7d53-49a4-becf-cee8f59fd697)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Split_Endpoint | Endpoint-level override for split tunneling. Overrides Site and Company settings. | `Endpoint` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to send only the networks in SSTP_Routes through the VPN. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/4c605b55-44bf-436f-8530-333aeb2f0045/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
