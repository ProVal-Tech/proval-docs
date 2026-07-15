---
id: '48c01a19-6250-4eb2-a9c4-c0431a2789dc'
slug: /48c01a19-6250-4eb2-a9c4-c0431a2789dc
title: 'MTVM_LowThreshold_Wks'
title_meta: 'MTVM_LowThreshold_Wks'
keywords: ['memory', 'monitoring', 'windows', 'alerts', 'thresholds', 'performance']
description: 'Defines Company baseline low Memory % that resets the timer on Workstations. Overridden if Site or Endpoint limit exists.'
tags: ['performance', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-15
---

## Summary

Defines Company baseline low Memory % that resets the timer on Workstations. Overridden if Site or Endpoint limit exists.

## Dependencies

- [Solution: Memory Threshold Violation Monitoring](/docs/cda6ee21-e70f-45c3-868c-1800d4aa26d7)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| MTVM_LowThreshold_Wks | Defines Company baseline low Memory % that resets the timer on Workstations. Overridden if Site or Endpoint limit exists. | `Company` | `Text Box` | Enter a number (e.g., 85). Must be lower than the high threshold. | `85` | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/48c01a19-6250-4eb2-a9c4-c0431a2789dc/image1.webp)

## Changelog

### 2026-07-15

- Initial version of the document
