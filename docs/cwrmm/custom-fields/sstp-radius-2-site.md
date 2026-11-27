---
id: '6e6ea744-fb29-4980-9da2-5ac322367933'
slug: /6e6ea744-fb29-4980-9da2-5ac322367933
title: 'SSTP_RADIUS_2_Site'
title_meta: 'SSTP_RADIUS_2_Site'
keywords: ['sstp', 'vpn', 'radius', 'nps', 'certificate', 'peap', 'site']
description: 'Site-level override for the secondary RADIUS server. Overrides Company settings, but overridden by Endpoint.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb) for one site. Leave it empty to use the company's value. [SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc) overrides it for a single device. Enter `None` to use no secondary server at this site, even when the company has one.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb)
- [Custom Field: SSTP_RADIUS_2_Endpoint](/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_RADIUS_2_Site | Site-level override for the secondary RADIUS server. Overrides Company settings, but overridden by Endpoint. | `Site` | `Text Box` | Leave blank to inherit. Enter the host name or FQDN, or None to use no secondary server at this site. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every site and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/6e6ea744-fb29-4980-9da2-5ac322367933/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
