---
id: 'ba58573e-5e74-4241-a036-a1519acf426d'
slug: /ba58573e-5e74-4241-a036-a1519acf426d
title: 'SSTP_RADIUS_1'
title_meta: 'SSTP_RADIUS_1'
keywords: ['sstp', 'vpn', 'radius', 'nps', 'certificate', 'peap', 'company']
description: 'Company-level primary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The primary RADIUS (NPS) server, used when the authentication method is `PEAP with Server Validation`. Enter a host name such as `nps01`, which is completed with [SSTP_DNS_Suffix](/docs/ff024303-4ef0-4f07-826e-a3913095299c), or a full name such as `nps01.corp.contoso.com`. [SSTP_RADIUS_1_Site](/docs/e3fc5254-1fcd-4f1c-b98e-8c6f5335a120) overrides it for a site, and [SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b) overrides both for a single device.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_RADIUS_1_Site](/docs/e3fc5254-1fcd-4f1c-b98e-8c6f5335a120)
- [Custom Field: SSTP_RADIUS_1_Endpoint](/docs/b4a4ebdd-1ae4-4539-87d9-3d723126664b)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_RADIUS_1 | Company-level primary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter the host name or FQDN, for example nps01. A short name is completed with the DNS suffix. |  | `Yes` |

:::note

Each device needs a valid certificate for this server in the Local Machine **Trusted Root Certification Authorities** store, with the server's name as its common name (CN). The solution doesn't install certificates. When no valid one is found, the task fails and names the server.

Windows only accepts a RADIUS server whose name is in SSTP_RADIUS_1 or [SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb).

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/ba58573e-5e74-4241-a036-a1519acf426d/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
