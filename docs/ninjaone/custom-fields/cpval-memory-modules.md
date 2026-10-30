---
id: '861c715f-e228-4342-b9f8-6f663917c902'
slug: /861c715f-e228-4342-b9f8-6f663917c902
title: 'cPVAL Memory Modules'
title_meta: 'cPVAL Memory Modules'
keywords: ['memory', 'ram', 'hardware', 'inventory', 'audit', 'ninjaone', 'wysiwyg', 'custom-field', 'windows']
description: 'Collects detailed physical memory module information from Windows endpoints using NinjaOne and stores the per-module inventory details in the cPVAL Memory Modules WYSIWYG custom field.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-10-29
---

## Summary

Collects detailed physical memory module information from Windows endpoints using NinjaOne and stores the per-module inventory details in the cPVAL Memory Modules WYSIWYG custom field.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
 ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| cPVAL Memory Modules | cpvalMemoryModules | -- | `device` | `WYSIWYG` | True | -- | -- | True | Memory Details |

## Dependencies

- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Solution: Get Detailed Memory Information - NinjaOne](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-memory-modules.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/861c715f-e228-4342-b9f8-6f663917c902/memory-cf.webp)

## Changelog

### 2026-10-29

- Initial version of the document
