---
id: '861c715f-e228-4342-b9f8-6f663917c902'
slug: /861c715f-e228-4342-b9f8-6f663917c902
title: 'cPVAL Memory Modules'
title_meta: 'cPVAL Memory Modules'
keywords: ['memory', 'ram', 'hardware', 'inventory', 'audit', 'ninjaone', 'wysiwyg', 'custom-field', 'windows']
description: Collects detailed physical memory module information from Windows endpoints stores the per-module inventory details.'
tags: ['hardware', 'windows', 'custom-fields', 'memory', 'data-collection', 'audit']
draft: false
unlisted: false
last_update:
  date: 2026-11-02
---

## Summary

Collects detailed physical memory module information from Windows endpoints stores the per-module inventory details.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
 ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| cPVAL Memory Modules | cpvalMemoryModules | -- | `Device` | `WYSIWYG` | True | -- | -- | True | Memory Details |

## Dependencies

- [Automation: Get Detailed Memory Information](/docs/36bad181-d46c-4c2a-a3b6-7c52800a5f76)
- [Solution: Get Detailed Memory Information - NinjaOne](/docs/fd8c41d3-ecf7-4eb8-95f5-4317a787a579)

## Table Columns

| Column Name | Description |
| ----------- | ----------- |
| Organization | The organization the device belongs to. |
| Location | The location assigned to the device. |
| Device | The device name. |
| LastContact | The last contact time reported by NinjaOne. |
| LastUser | The last user associated with the device, as reported by NinjaOne. |
| DeviceType | The device type reported by NinjaOne. |
| OS | The operating system installed on the device. |
| OSBuild | The operating system build number. |
| Manufacturer | The device manufacturer. |
| Model | The device model. |
| Memory Modules | Per-module information, including slot, capacity, memory type, form factor, rated speed, running speed, manufacturer, and part number. |

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-memory-modules.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/861c715f-e228-4342-b9f8-6f663917c902/memory-cf.webp)

## Changelog

### 2026-11-02

- Initial version of the document
