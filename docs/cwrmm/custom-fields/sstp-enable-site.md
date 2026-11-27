---
id: '48e518b7-2a64-42a1-9d00-8e46136a86d2'
slug: /48e518b7-2a64-42a1-9d00-8e46136a86d2
title: 'SSTP_Enable_Site'
title_meta: 'SSTP_Enable_Site'
keywords: ['sstp', 'vpn', 'scope', 'os-type', 'deployment', 'site']
description: 'Site-level override for the SSTP VPN deployment scope by OS type. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1) for one site. Leave it empty to use the company's value. [SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843) overrides it for a single device.

A site set to `Disabled` is excluded even when its company is enabled, and a site set to an OS option is included even when its company is `Disabled`.

| Option | Devices in scope |
|---|---|
| `Windows Workstations and Servers` | Windows workstations and Windows servers |
| `Windows Workstations Only` | Windows workstations |
| `Windows Servers Only` | Windows servers |
| `Disabled` | None. No connection is created or changed. |

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Group: SSTP VPN Deployment](/docs/9848ce15-c56b-4ccd-a80f-95b21e5a4f75)
- [Custom Field: SSTP_Enable](/docs/57f97be2-e027-413f-919e-b6984ce6fba1)
- [Custom Field: SSTP_Enable_Endpoint](/docs/2e5a736d-431a-46ba-a157-e6f7e6740843)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| SSTP_Enable_Site | Site-level override for the SSTP VPN deployment scope by OS type. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `String` | `Windows Workstations and Servers`, `Windows Workstations Only`, `Windows Servers Only`, `Disabled` | Leave blank to inherit. Select which Windows devices get the SSTP VPN connection, or Disabled to exclude the site. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/48e518b7-2a64-42a1-9d00-8e46136a86d2/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
