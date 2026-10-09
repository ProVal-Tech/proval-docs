---
id: '71ed69e7-e11b-412e-842b-2416bcd30f04'
slug: /71ed69e7-e11b-412e-842b-2416bcd30f04
title: 'cPVAL SMB1 Server Status'
title_meta: 'cPVAL SMB1 Server Status'
keywords: ['smbv1', 'remediation', 'detection', 'vulnerability']
description: 'Indicates whether SMBv1 Server is enabled on the machine.'
tags: ['logging', 'report', 'vulnerability', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-10-07
---

## Summary

Indicates whether SMBv1 Server is enabled on the machine. This field is populated by the [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0).

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | -------- | ---------------- |
| cPVAL SMB1 Server Status | cpvalSmb1ServerStatus | | `System`,`Device` | Text | False | | True | SMB1 Audit/Autofix |


## Dependencies

- [Automation - SMBv1 Status Audit/Autofix](/docs/1d1540ab-ec63-41d6-99e2-1f8fae44fff0)
- [Solution - SMBv1 Status Audit/Autofix](/docs/d4508b91-c43e-41ca-bc94-28a4a22508d8) 

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-smb1-server-status.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/71ed69e7-e11b-412e-842b-2416bcd30f04/image1.webp)

## Changelog

### 2026-10-07

- Initial version of the document
