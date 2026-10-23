---
id: 'c0a7d30e-785c-4b9a-9f71-f9386e026c29'
slug: /c0a7d30e-785c-4b9a-9f71-f9386e026c29
title: 'cPVAL SMB Folder Audit'
title_meta: 'cPVAL SMB Folder Audit'
keywords: ['SMB', 'Share', 'Permissions', 'Audit']
description: 'This custom field is used in the compound condition to determine whether the automation should run on the device.'
tags: ['auditing', 'custom-fields', 'report', 'knowledge-base', 'smb']
draft: false
unlisted: false
last_update:
  date: 2026-10-23
---

## Summary

This custom field is used in the compound condition to determine whether the automation should run on the device.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| `cPVAL SMB Folder Audit` | `cpvalSmbFolderAudit` | -- | `Organization`, `Location`, `Device`, `System` | DropDown| False | -- | `Disabled`, `Windows Servers`, `Windows Workstations`, `Windows` | True | SMB Shares Audit |

## Dependencies

* [Solution: SMB Share Permission Audit](/docs/a1a0fea8-a255-45e3-98c6-1bbe094f5693)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-smb-folder-audit.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29/custom%20field.webp)

## Changelog

### 2026-10-23

- Initial version of the document
