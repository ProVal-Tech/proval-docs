---
id: '8046e895-bb66-4559-be7b-23e17090381f'
slug: /8046e895-bb66-4559-be7b-23e17090381f
title: 'cPVAL SMB1 Client Status'
title_meta: 'cPVAL SMB1 Client Status'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'Indicates whether SMBv1 client is enabled on the machine.'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary
Indicates whether SMBv1 client is enabled on the machine. This field is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0).

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | -------- | ---------------- |
| cPVAL SMB1 Client Status | cpvalSmb1ClientStatus |  | `System`,`Device` | Text | False | | True | SMB1 Audit/Autofix |


## Dependencies

- [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0)
- [Solution - SMBv1 Status Audit/Autofix](/docs/d4508b91-c43e-41ca-bc94-28a4a22508d8) 

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-smb1-client-status.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/8046e895-bb66-4559-be7b-23e17090381f/image1.webp)

## Changelog

### 2026-10-07

- Initial version of the document
