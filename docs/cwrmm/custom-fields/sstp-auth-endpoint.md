---
id: '42272ef7-d912-464b-9d05-cb4d53e36467'
slug: /42272ef7-d912-464b-9d05-cb4d53e36467
title: 'SSTP_Auth_Endpoint'
title_meta: 'SSTP_Auth_Endpoint'
keywords: ['sstp', 'vpn', 'authentication', 'peap', 'eap-mschapv2', 'endpoint']
description: 'Endpoint-level override for the SSTP VPN authentication method. Overrides Site and Company settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b) and [SSTP_Auth](/docs/dd2b757e-651a-4ccc-bfb1-48e32eed9675) for a single device. Leave it empty to use the site or company value.

| Option | What it does |
|---|---|
| `PEAP with Server Validation` | PEAP-MSCHAPv2. Before it sends credentials, Windows checks that the RADIUS server's certificate is trusted and matches the RADIUS server names. Needs [SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d), and the RADIUS certificate in the Trusted Root store on each device. |
| `EAP-MSCHAPv2` | EAP-MSCHAPv2 without a certificate check. The RADIUS fields are ignored. |
| Empty | The site or company value applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Auth](/docs/dd2b757e-651a-4ccc-bfb1-48e32eed9675)
- [Custom Field: SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Auth_Endpoint | Endpoint-level override for the SSTP VPN authentication method. Overrides Site and Company settings. | `Endpoint` | `Dropdown` | `String` | `PEAP with Server Validation`, `EAP-MSCHAPv2` | Leave blank to inherit. Select PEAP with Server Validation or EAP-MSCHAPv2. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/42272ef7-d912-464b-9d05-cb4d53e36467/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
