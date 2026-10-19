---
id: '398e0f9e-6f9c-482d-a977-b278ed79d7df'
slug: /398e0f9e-6f9c-482d-a977-b278ed79d7df
title: 'cPVAL ChkDsk Autofix'
title_meta: 'cPVAL ChkDsk Autofix'
keywords: ['chkdsk', 'all', 'drives', 'disk-space']
description: 'This is used to set if autofix needs to be executed or not during the script run.'
tags: ['disk', 'diskspace', 'storage', 'auditing', 'report', 'custom-fields']
draft: false
unlisted: false
last_update:
  date: 2026-10-19
---

## Summary

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| cPVAL ChkDsk Deployment | cpvalChkdskDeployment | -- | `Device, Organization, Location, System` | `DropDown` | `False` | -- | `Disabled`, `Windows Servers`, `windows Workstations` | True | chkdsk |

## Dependencies

* [Automation: CHKDSK - Run All Drives](/docs/b2cc4bdc-cbb4-46b7-a785-a7bbb9341b55)
* [Solution: CHKDSK All Drives - NinjaOne](/docs/d7759df0-48d0-45c4-a1ca-958fe849ad79)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-chkdsk-autofix.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/398e0f9e-6f9c-482d-a977-b278ed79d7df/autofix.webp)

## Changelog

### 2026-10-19

- Initial version of the document
