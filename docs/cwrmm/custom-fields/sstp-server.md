---
id: '74c3c252-1d85-4860-8e89-4c4e7d2804d7'
slug: /74c3c252-1d85-4860-8e89-4c4e7d2804d7
title: 'SSTP_Server'
title_meta: 'SSTP_Server'
keywords: ['sstp', 'vpn', 'server-address', 'company']
description: 'Company-level SSTP VPN server address. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The public host name of the SSTP VPN server that devices connect to, for example `remote.contoso.com`. [SSTP_Server_Site](/docs/89c2001e-dfce-43fd-b622-23a6e0f9703f) overrides it for a site, and [SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc) overrides both for a single device. A device in scope fails the task when no level holds an address.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_Server_Site](/docs/89c2001e-dfce-43fd-b622-23a6e0f9703f)
- [Custom Field: SSTP_Server_Endpoint](/docs/ee49791e-8522-4665-a2c1-f302db20d2fc)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_Server | Company-level SSTP VPN server address. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter the public host name of the VPN server, for example remote.contoso.com. |  | `Yes` |

:::note

SSTP checks the VPN server's certificate when it connects, so enter the name on that certificate. An IP address or a different name makes the connection fail, even though the task succeeds.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/74c3c252-1d85-4860-8e89-4c4e7d2804d7/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
