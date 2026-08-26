---
id: '1f925f10-61f7-4db7-824f-f955d252342b'
slug: /1f925f10-61f7-4db7-824f-f955d252342b
title: 'DRV_Frag_Mode_Wks_Site'
title_meta: 'DRV_Frag_Mode_Wks_Site'
keywords: ['drive', 'fragmentation', 'defragmentation', 'alerts', 'thresholds', 'disk', 'HDD']
description: 'Site-level override for workstation fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

Site-level override for workstation fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint.

## Dependencies

- [Solution: Drive Fragmentation Monitoring](/docs/fb923e51-3cca-4b32-9066-51fbef06953f)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| DRV_Frag_Mode_Wks_Site | Site-level override for workstation fragmentation monitoring mode. Overrides Company settings, but overridden by Endpoint. | `Site` | `Dropdown` | `string` | `Enabled - Automation and Alert`, `Enabled - Alert Only`, `Disabled` | Leave blank to inherit. Select Automation and Alert to allow autofix, Alert Only to ticket only, or Disabled to exclude. |  | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/1f925f10-61f7-4db7-824f-f955d252342b/image1.webp)

## Changelog

### 2026-08-26

- Initial version of the document
