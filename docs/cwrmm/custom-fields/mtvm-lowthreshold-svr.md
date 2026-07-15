---
id: '699f0cee-b9aa-4518-978c-411438d5f5a0'
slug: /699f0cee-b9aa-4518-978c-411438d5f5a0
title: 'MTVM_LowThreshold_Svr'
title_meta: 'MTVM_LowThreshold_Svr'
keywords: ['memory', 'monitoring', 'windows', 'alerts', 'thresholds', 'performance']
description: 'Defines Company baseline low Memory % that resets the timer on Servers. Overridden if Site or Endpoint limit exists.'
tags: ['performance', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-15
---

## Summary

Defines Company baseline low Memory % that resets the timer on Servers. Overridden if Site or Endpoint limit exists.

## Dependencies

- [Solution: Memory Threshold Violation Monitoring](/docs/cda6ee21-e70f-45c3-868c-1800d4aa26d7)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|
| MTVM_LowThreshold_Svr | Defines Company baseline low Memory % that resets the timer on Servers. Overridden if Site or Endpoint limit exists. | `Company` | `Text Box` | Enter a number (e.g., 90). Must be lower than the high threshold. | `90` | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/699f0cee-b9aa-4518-978c-411438d5f5a0/image1.webp)

## Changelog

### 2026-07-15

- Initial version of the document
