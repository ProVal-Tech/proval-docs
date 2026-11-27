---
id: 'd3fcba13-20f4-4371-a743-937868c9e8b3'
slug: /d3fcba13-20f4-4371-a743-937868c9e8b3
title: 'SSTP_Connection'
title_meta: 'SSTP_Connection'
keywords: ['sstp', 'vpn', 'connection-name', 'company']
description: 'Company-level name of the SSTP VPN connection as users see it in Windows. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The name of the VPN connection, as users see it in the Windows network list. [SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2) overrides it for a site, and [SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1) overrides both for a single device.

The [SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7) task creates an all-user connection with this name, or updates the one that already has it. A device in scope fails the task when no level holds a name.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Connection_Site](/docs/942398eb-d14a-4cea-aee8-f392bad853b2)
- [Custom Field: SSTP_Connection_Endpoint](/docs/0d156eb8-142a-48a5-bbc7-00cab392c9c1)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Connection | Company-level name of the SSTP VPN connection as users see it in Windows. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter the connection name, for example Contoso VPN. Type a single quote twice. |  | `Yes` |

:::note

Changing the name creates a new connection with the new name at the next run. The connection with the old name stays on the device, so remove it by hand if it's no longer needed.

Type a single quote twice, for example `Contoso''s VPN` for Contoso's VPN.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/d3fcba13-20f4-4371-a743-937868c9e8b3/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
