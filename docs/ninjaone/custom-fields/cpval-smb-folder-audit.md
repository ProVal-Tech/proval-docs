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
  date: 2026-10-21
---

## Summary

This custom field is used in the compound condition to determine whether the automation should run on the device.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| `cPVAL SMB Folder Audit` | `cpvalSmbFolderAudit` | -- | `Organization`, `Location`, `Device`, `System` | DropDown| False | -- | `Disabled`, `Windows Servers`, `Windows Workstations`, `Windows` | True | SMB Shares Audit |

## Dependencies

* [Compound Condition - SMB Share Permission Audit - workstations](/docs/728b7519-dd3f-4e98-9f24-32b981bc00b3)
* [Compound Condition - SMB Share Permission Audit - Servers](/docs/bc81efc9-c4f1-4943-8139-a6a2682fc7e4)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-smb-folder-audit.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/c0a7d30e-785c-4b9a-9f71-f9386e026c29/custom%20field.webp)

## Changelog

### 2026-10-21

- Initial version of the document
