---
id: '07b326ab-b7b1-4a31-b91b-22119dd41ec8'
slug: /07b326ab-b7b1-4a31-b91b-22119dd41ec8
title: 'DRV_Frag_Mode_Wks'
title_meta: 'DRV_Frag_Mode_Wks'
keywords: ['drive', 'fragmentation', 'defragmentation', 'alerts', 'thresholds', 'disk', 'HDD']
description: 'Company-level fragmentation monitoring mode for workstations. Overridden by Site or Endpoint settings.'
tags: ['disk', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-26
---

## Summary

Company-level fragmentation monitoring mode for workstations. Overridden by Site or Endpoint settings.

## Dependencies

- [Solution: Drive Fragmentation Monitoring](/docs/fb923e51-3cca-4b32-9066-51fbef06953f)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| DRV_Frag_Mode_Wks | Company-level fragmentation monitoring mode for workstations. Overridden by Site or Endpoint settings. | `Company` | `Dropdown` | `string` | `Enabled - Automation and Alert`, `Enabled - Alert Only`, `Disabled` | Select Automation and Alert to allow autofix, Alert Only to ticket only, or Disabled to exclude. | `Disabled` | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/07b326ab-b7b1-4a31-b91b-22119dd41ec8/image1.webp)

## Changelog

### 2026-08-26

- Initial version of the document
