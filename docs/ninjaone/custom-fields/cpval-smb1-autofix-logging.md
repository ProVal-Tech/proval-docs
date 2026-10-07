---
id: 'c8152ccc-732a-4b33-93ef-6db1788068f8'
slug: /c8152ccc-732a-4b33-93ef-6db1788068f8
title: 'cPVAL SMB1 Autofix Logging'
title_meta: 'cPVAL SMB1 Autofix Logging'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'Stores the remediation result reported by the `SMBv1 Status Audit/Autofix` automation..'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary
Stores the remediation result reported by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0).

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value |  Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ---------------- | -------- | ---------------- |
| cPVAL SMB1 Autofix Logging | cpvalSmb1AutofixLogging  |  | `System`,`Device` | Multi-line | False | | True | SMB1 Audit/Autofix |

## Dependencies

- [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0)
- [Solution - SMBv1 Status Audit/Autofix](/docs/d4508b91-c43e-41ca-bc94-28a4a22508d8) 

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-smb1-autofix-logging.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/c8152ccc-732a-4b33-93ef-6db1788068f8/image1.webp)

## Changelog

### 2026-10-07

- Initial version of the document