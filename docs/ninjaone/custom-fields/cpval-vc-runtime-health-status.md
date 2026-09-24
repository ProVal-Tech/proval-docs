---
id: '81660c29-6528-4cb0-9dbe-964ba1b4588e'
slug: /81660c29-6528-4cb0-9dbe-964ba1b4588e
title: 'cPVAL VC Runtime Health Status'
title_meta: 'cPVAL VC Runtime Health Status'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'Stores the VC Runtime Health status returned by the Test VC Runtime script. Indicates whether the VC runtime is healthy or corrupted.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-24
---

## Summary

Stores the VC Runtime Health status returned by the 'Test VC Runtime' script. Indicates whether the VC runtime is healthy or corrupted.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL VC Runtime Health Status` | `cpvalVcRuntimeHealthStatus` | `Healthy` | `Device` | `Text` | `True` | | | `No` | `Visual C++ Remediation` |

## Dependencies

- [Solution: Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-vc-runtime-health-status.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/81660c29-6528-4cb0-9dbe-964ba1b4588e/image1.webp)

## Changelog

### 2026-09-24

- Initial version of the document
