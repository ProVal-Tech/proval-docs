---
id: 'ff024303-4ef0-4f07-826e-a3913095299c'
slug: /ff024303-4ef0-4f07-826e-a3913095299c
title: 'SSTP_DNS_Suffix'
title_meta: 'SSTP_DNS_Suffix'
keywords: ['sstp', 'vpn', 'dns-suffix', 'domain', 'company']
description: 'Company-level DNS suffix for the SSTP VPN connection. Also names the domain whose members connect with their Windows logon credentials, and completes short RADIUS server names. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The internal DNS suffix given to the connection, for example `corp.contoso.com`. [SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c) overrides it for a site, and [SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c) overrides both for a single device. A device in scope fails the task when no level holds a suffix.

The suffix also does two other jobs:

- Devices joined to this domain, or to one of its child domains, connect with their Windows sign-in instead of asking for a user name and password.
- RADIUS server names entered without a domain, such as `nps01`, are completed with it.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_DNS_Suffix_Site](/docs/968485ea-c81e-4a03-b72b-b25a7bca424c)
- [Custom Field: SSTP_DNS_Suffix_Endpoint](/docs/2a2f7930-d975-4d1b-9b93-808992ddd76c)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_DNS_Suffix | Company-level DNS suffix for the SSTP VPN connection. Also names the domain whose members connect with their Windows logon credentials, and completes short RADIUS server names. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter the internal DNS suffix, for example corp.contoso.com. |  | `Yes` |

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/ff024303-4ef0-4f07-826e-a3913095299c/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
