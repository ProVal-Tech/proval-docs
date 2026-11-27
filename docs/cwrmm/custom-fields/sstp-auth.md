---
id: 'dd2b757e-651a-4ccc-bfb1-48e32eed9675'
slug: /dd2b757e-651a-4ccc-bfb1-48e32eed9675
title: 'SSTP_Auth'
title_meta: 'SSTP_Auth'
keywords: ['sstp', 'vpn', 'authentication', 'peap', 'eap-mschapv2', 'company']
description: 'Company-level authentication method for the SSTP VPN connection. PEAP with Server Validation checks the RADIUS server certificate. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The authentication method of the connection. [SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b) overrides it for a site, and [SSTP_Auth_Endpoint](/docs/42272ef7-d912-464b-9d05-cb4d53e36467) overrides both for a single device. The default value, `PEAP with Server Validation`, applies to every company that doesn't have its own value.

| Option | What it does |
|---|---|
| `PEAP with Server Validation` | PEAP-MSCHAPv2. Before it sends credentials, Windows checks that the RADIUS server's certificate is trusted and matches the RADIUS server names. Needs [SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d), and the RADIUS certificate in the Trusted Root store on each device. |
| `EAP-MSCHAPv2` | EAP-MSCHAPv2 without a certificate check. The RADIUS fields are ignored. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Auth_Site](/docs/698120a1-a717-4e8c-9fb1-3953922a513b)
- [Custom Field: SSTP_Auth_Endpoint](/docs/42272ef7-d912-464b-9d05-cb4d53e36467)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Auth | Company-level authentication method for the SSTP VPN connection. PEAP with Server Validation checks the RADIUS server certificate. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `String` | `PEAP with Server Validation`, `EAP-MSCHAPv2` | Select PEAP with Server Validation, or EAP-MSCHAPv2 when the VPN does not use RADIUS server certificates. | `PEAP with Server Validation` | `Yes` |

:::note

Use `PEAP with Server Validation` wherever the VPN uses a RADIUS server with a certificate. It stops devices from sending credentials to a server pretending to be yours.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/dd2b757e-651a-4ccc-bfb1-48e32eed9675/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
