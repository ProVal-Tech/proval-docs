---
id: 'edc708ab-b61a-44d0-a563-d5f2571faf55'
slug: /edc708ab-b61a-44d0-a563-d5f2571faf55
title: 'DRV_Frag_Mode_Svr'
title_meta: 'DRV_Frag_Mode_Svr'
keywords: ['drive', 'fragmentation', 'defragmentation', 'alerts', 'thresholds', 'disk', 'HDD']
description: 'Company-level fragmentation monitoring mode for servers. Overridden by Site or Endpoint settings.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

Company-level fragmentation monitoring mode for servers. Overridden by Site or Endpoint settings.

## Dependencies

- [Solution: Drive Fragmentation Monitoring](/docs/fb923e51-3cca-4b32-9066-51fbef06953f)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| DRV_Frag_Mode_Svr | Company-level fragmentation monitoring mode for servers. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `string` | `Enabled - Alert Only`, `Disabled` | Select Alert Only to ticket only, or Disabled to exclude. | `Disabled` | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/edc708ab-b61a-44d0-a563-d5f2571faf55/image1.webp)

## Changelog

### 2026-08-26

- Initial version of the document
