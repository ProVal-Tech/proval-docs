---
id: 'ad629c28-f5f4-432d-93d2-abb3a35e4737'
slug: /ad629c28-f5f4-432d-93d2-abb3a35e4737
title: 'cPVAL Windows Update UI State'
title_meta: 'cPVAL Windows Update UI State'
keywords: ['windows','updates','patching']
description: 'This stores the Windows Update UI state audit from the script `Windows Updates - Enable or Disable Settings`.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This stores the Windows Update UI state audit from the script `Windows Updates - Enable or Disable Settings`.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Update UI State | cpvalWindowsUpdateUiState | Device | Text | False  |  | Editable | Read/Write | Read/Write | This stores the Windows Update UI state audit from the script "Windows Updates - Enable or Disable Settings". |  |  | Windows Updates |

## Dependencies

- [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
- [Solution - Windows Update UI Enable-Disable](/docs/a6da0735-ac80-40f8-8ad3-375ffa8d0e93)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-ui-state.toml)

## Sample Screenshot

![Device Level](../../../static/img/docs/134eb999-a5dd-4599-ae1f-4c0082590007/image1.webp)

## Changelog

### 2026-04-16

- Removed unnecessary auditing solution, that contains multiple groups, custom fields, and complicated compound conditions.

### 2026-04-08

- Initial version of the document