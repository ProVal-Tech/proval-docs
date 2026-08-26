---
id: '4e70913e-811f-4238-b804-04726145b2d0'
slug: /4e70913e-811f-4238-b804-04726145b2d0
title: 'DRV_Frag_Mode_Svr_Site'
title_meta: 'DRV_Frag_Mode_Svr_Site'
keywords: ['drive', 'fragmentation', 'defragmentation', 'alerts', 'thresholds', 'disk', 'HDD']
description: 'Site-level override for server fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

Site-level override for server fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint.

## Dependencies

- [Solution: Drive Fragmentation Monitoring](/docs/fb923e51-3cca-4b32-9066-51fbef06953f)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| DRV_Frag_Mode_Svr_Site | Site-level override for server fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `string` | `Enabled - Alert Only`, `Disabled` | Leave blank to inherit. Select Alert Only to ticket only, or Disabled to exclude. |  | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/4e70913e-811f-4238-b804-04726145b2d0/image1.webp)

## Changelog

### 2026-08-26

- Initial version of the document
