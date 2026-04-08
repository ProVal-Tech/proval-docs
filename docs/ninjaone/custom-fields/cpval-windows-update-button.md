---
id: '134eb999-a5dd-4599-ae1f-4c0082590007'
slug: /134eb999-a5dd-4599-ae1f-4c0082590007
title: 'cPVAL Windows Update Button'
title_meta: 'cPVAL Windows Update Button'
keywords: ['windows','updates','patching']
description: 'This Custom field provides the option to "Enable" or "Disable" the Windows Update (Check for Updates).'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-08
---

## Summary

This Custom field provides the option to "Enable" or "Disable" the Windows Update (Check for Updates).

## Details

| Label | Field Name | Definition Scope | Type | Required | Option Value | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------ | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Update Button | cpvalWindowsUpdateButton | Organization , Location, Device | DropDown | False  | Enable, Disable |  | Editable | Read/Write | Read/Write | This custom field is used to configure the Windows Updates notification based on the selected options. |  |  |  |

## Dependencies

[Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-button.toml)

## Changelog

### 2026-04-08

- Initial version of the document