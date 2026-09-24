---
id: 'c6895ff6-39ae-403c-9436-4830e1a84d4c'
slug: /c6895ff6-39ae-403c-9436-4830e1a84d4c
title: 'cPVAL VC Runtime Remediation'
title_meta: 'cPVAL VC Runtime Remediation'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'This custom field is used to trigger the automation for Visual C++ Remediation. It is referenced in compound conditions to determine whether corrupted VC runtime needs to be remediated.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-24
---

## Summary

This custom field is used to trigger the automation for Visual C++ Remediation. It is referenced in compound conditions to determine whether corrupted VC runtime needs to be remediated.

## Details

| Label | Field Name | Example | Definition Scope | Type | Required | Default Value | Dropdown Options | Editable | Custom Field Tab |
| ----- | ---------- | ------- | ---------------- | ---- | -------- | ------------- | ---------------- | -------- | ---------------- |
| `cPVAL VC Runtime Remediation` | `cpvalVcRuntimeRemediation` | `Windows` | `System`,`Organization`, `Location`, `Device` | `Dropdown` | `True` | | `Windows`, `Windows Servers`, `Windows Workstations`, `Disable` | `Yes` | `Visual C++ Remediation` |

### Dropdown options

| Option | Description |
| ------ | ----------- |
| Disable | No deployment action. Can be used for excluding a device or location. |
| Windows | Enable Visual C++ Health Remediation to all Windows devices in scope. |
| Windows Servers | Enable Visual C++ Health Remediation only to Windows Server devices in scope. |
| Windows Workstations | Enable Visual C++ Health Remediation only to Windows workstation devices in scope. |

## Dependencies

- [Compound Condition: Test VC Runtime - Windows Workstations](/docs/0f9b6490-325a-4863-8d1a-e4e38f21f0e6)
- [Compound Condition: Test VC Runtime - Windows Servers](/docs/8be26d10-ce6c-49b1-99ac-bd5b3bdafc2d)
- [Solution: Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96)

## Custom Field Creation

- [Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-vc-runtime-remediation.toml)

## Sample Screenshot

![Sample Screenshot](../../../static/img/docs/07fdc412-cf16-4e61-a760-c7269e016731/image1.webp)

## Changelog

### 2026-09-24

- Initial version of the document
