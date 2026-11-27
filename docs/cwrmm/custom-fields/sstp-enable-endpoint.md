---
id: '2e5a736d-431a-46ba-a157-e6f7e6740843'
slug: /2e5a736d-431a-46ba-a157-e6f7e6740843
title: 'SSTP_Enable_Endpoint'
title_meta: 'SSTP_Enable_Endpoint'
keywords: ['sstp', 'vpn', 'scope', 'os-type', 'deployment', 'endpoint']
description: 'Endpoint-level SSTP VPN deployment switch. Overrides Site and Company settings, whatever the device OS.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Includes or excludes a single device, whatever its site and company say. Leave it empty to use [SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2) or [SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1).

| Option | What happens |
|---|---|
| `Enabled` | The device gets the connection, even when its site or company is `Disabled` or doesn't cover its OS type. |
| `Disabled` | The device is left alone. No connection is created or changed. |
| Empty | The site or company setting applies. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Group: SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75)
- [Custom Field: SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1)
- [Custom Field: SSTP_Enable_Site](/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Enable_Endpoint | Endpoint-level SSTP VPN deployment switch. Overrides Site and Company settings, whatever the device OS. | `Endpoint` | `Dropdown` | `String` | `Enabled`, `Disabled` | Leave blank to inherit. Select Enabled to include this device, or Disabled to exclude it. |  | `Yes` |

:::note

Set it to `Enabled` on one device to try the solution before turning it on for a whole company.

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/2e5a736d-431a-46ba-a157-e6f7e6740843/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
