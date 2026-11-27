---
id: '3e97136c-12d2-4a09-8712-b80b3ae55edc'
slug: /3e97136c-12d2-4a09-8712-b80b3ae55edc
title: 'SSTP_RADIUS_2_Endpoint'
title_meta: 'SSTP_RADIUS_2_Endpoint'
keywords: ['sstp', 'vpn', 'radius', 'nps', 'certificate', 'peap', 'endpoint']
description: 'Endpoint-level override for the secondary RADIUS server. Overrides Site and Company settings.'
tags: ['vpn', 'deployment', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-11-27
---

## Summary

Overrides [SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933) and [SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb) for a single device. Leave it empty to use the site or company value. Enter `None` to use no secondary server on this device.

## Dependencies

- [Solution: SSTP VPN Deployment](/docs/7513f241-2384-433a-8887-fe8a014a927e)
- [Task: SSTP VPN Deployment](/docs/11eb7169-75d8-456d-a28d-fe9aff517ac7)
- [Custom Field: SSTP_RADIUS_2](/docs/42062995-a0d7-45b7-a6b7-f9aeeb952cfb)
- [Custom Field: SSTP_RADIUS_2_Site](/docs/6e6ea744-fb29-4980-9da2-5ac322367933)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| SSTP_RADIUS_2_Endpoint | Endpoint-level override for the secondary RADIUS server. Overrides Site and Company settings. | `Endpoint` | `Text Box` | Leave blank to inherit. Enter the host name or FQDN, or None to use no secondary server on this device. |  | `Yes` |

:::note

This field has no default value, and shouldn't be given one. A default value would apply to every device and override the level above it everywhere.

:::

## Implementation

Install the custom field from the `ProVal - Content` Community, selecting the **Custom Fields** repository.

![Image1](../../../static/img/docs/3e97136c-12d2-4a09-8712-b80b3ae55edc/image1.webp)

## Changelog

### 2026-11-27

- Initial version of the document
