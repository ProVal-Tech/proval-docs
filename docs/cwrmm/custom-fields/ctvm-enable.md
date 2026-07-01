---
id: 'aa6be36d-3653-4f68-b9fe-5bdb7c7f5c20'
slug: /aa6be36d-3653-4f68-b9fe-5bdb7c7f5c20
title: 'CTVM_Enable'
title_meta: 'CTVM_Enable'
keywords: ['cpu', 'monitoring', 'windows', 'alerts', 'thresholds', 'performance']
description: 'Enables/disables CPU monitoring at the Endpoint level. Overrides all higher levels.'
tags: ['performance', 'monitoring', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-07-01
---

## Summary

Enables/disables CPU monitoring at the Endpoint level. Overrides all higher levels.

## Dependencies

- [Solution: CPU Threshold Violation Monitoring](/docs/49b06af7-af3b-4aaa-a90c-8efb28a65c9e)

## Custom Field Setup Location

**Custom Fields Path:** SETTINGS ➞ Custom Fields

## Details

| Name | Description | Level | Type | Option Type | Options | Help Text | Default Value | Editable |
|---|---|---|---|---|---|---|---|---|
| CTVM_Enable | Enables/disables CPU monitoring at the Endpoint level. Overrides all higher levels. | `Endpoint` | `Dropdown` | `string` | `Enable`, `Disable` | Select Enable to turn on monitoring, Disable to exclude. |  | `Yes` |

## Completed Custom Field

![Image1](../../../static/img/docs/aa6be36d-3653-4f68-b9fe-5bdb7c7f5c20/image1.webp)

## Changelog

### 2026-07-01

- Initial version of the document
