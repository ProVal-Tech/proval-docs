---
id: 'a2670f69-d6b0-4dad-a60b-24e0b2d311f1'
slug: /a2670f69-d6b0-4dad-a60b-24e0b2d311f1
title: 'cPVAL Windows Update Settings UI Audit'
title_meta: 'cPVAL Windows Update Settings UI Audit'
keywords: ['windows','updates','patching']
description: 'This checkbox enables the Windows Update Settings UI Audit by running the "Windows Update Settings Audit" script.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-13
---

## Summary

This checkbox enables the Windows Update Settings UI Audit by running the "Windows Update Settings Audit" script.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Windows Update Settings UI Audit | cpvalWindowsUpdateSettingsUiAudit | Organization, Location, Device | Checkbox | False  |  | Editable | Read/Write | Read/Write |This checkbox enables the Windows Update Settings UI Audit by running the [Script - Windows Updates Settings Audit](/docs/aac11efa-8782-4bf9-ba64-55337d81d5a0). |  |  | Windows Updates |

## Dependencies

- [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
- [Script - Windows Updates Settings Audit](/docs/aac11efa-8782-4bf9-ba64-55337d81d5a0)
- [Solution - Windows Update UI Enable-Disable](/docs/a6da0735-ac80-40f8-8ad3-375ffa8d0e93)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-settings-ui-audit.toml)

## Changelog

### 2026-04-13

- Audit version created

### 2026-04-08

- Initial version of the document