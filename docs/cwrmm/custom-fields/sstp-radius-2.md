---
id: '42062995-a0d7-45b7-a6b7-f9aeeb952cfb'
slug: /42062995-a0d7-45b7-a6b7-f9aeeb952cfb
title: 'SSTP_RADIUS_2'
title_meta: 'SSTP_RADIUS_2'
keywords: ['sstp', 'vpn', 'radius', 'nps', 'certificate', 'peap', 'company']
description: 'Company-level secondary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

The secondary RADIUS server, used with `PEAP with Server Validation` alongside [SSTP_RADIUS_1](/docs/ba58573e-5e74-4241-a036-a1519acf426d). Enter it the same way. Leave it empty, or enter `None`, when there's no secondary server. [SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933) overrides it for a site, and [SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc) overrides both for a single device.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933)
- [Custom Field: SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_RADIUS_2 | Company-level secondary RADIUS server, used by PEAP with Server Validation. Its certificate must be in the Local Machine Trusted Root store. Overridden by Site or Endpoint settings. | `Company` | `Text Box` | Enter the host name or FQDN. Leave blank or enter None when there is no secondary server. |  | `Yes` |

:::note

Its certificate must also be in the Local Machine Trusted Root store on each device, as for SSTP_RADIUS_1.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
