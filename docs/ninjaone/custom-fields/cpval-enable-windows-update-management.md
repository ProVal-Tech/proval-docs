---
id: 'e1a4db82-eea6-4e2b-a687-9fc551d9c884'
slug: /e1a4db82-eea6-4e2b-a687-9fc551d9c884
title: 'cPVAL Enable Windows Update Management'
title_meta: 'cPVAL Enable Windows Update Management'
keywords: ['windows','updates','patching']
description: 'This custom field allows the option to run the Windows Update UI management to be enabled or disabled based on the OS type selection.'
tags: ['windows','updates','patching']
draft: false
unlisted: false
last_update:
  date: 2026-04-22
---

## Summary

This custom field allows the option to run the Windows Update UI management to be enabled or disabled based on the OS type selection.

## Details

| Label | Field Name | Definition Scope | Type | Required | Option Value | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------ | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Enable Windows Update Management| cpvalEnableWindowsUpdateManagement | Organization , Location, Device | DropDown | False  | Disable, Windows, Windows Workstations, Windows Servers |  | Editable | Read/Write | Read/Write |This custom field allows the option to run the Windows Update UI management to be enabled or disabled based on the OS type selection. | Used to enable/disable Check for updates UI and notification level based on the OS selection. | Used to enable/disable Check for updates UI and notification level based on the OS selection. | Windows Updates  |

## Dependencies

- [Script - Windows Updates - Enable or Disable Settings](/docs/c988cacf-1964-4c9b-8a9f-bb6b43c283cb)
- [Solution - Windows Update UI Enable-Disable](/docs/a6da0735-ac80-40f8-8ad3-375ffa8d0e93)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-windows-update-management-enable.toml)

## Sample Screenshot

![Device Level](../../../static/img/docs/e1a4db82-eea6-4e2b-a687-9fc551d9c884/image.webp)

## Changelog

### 2026-04-22

- Initial version of the document