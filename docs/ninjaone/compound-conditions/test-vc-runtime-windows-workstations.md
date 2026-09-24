---
id: '0f9b6490-325a-4863-8d1a-e4e38f21f0e6'
slug: /0f9b6490-325a-4863-8d1a-e4e38f21f0e6
title: 'Test VC Runtime - Windows Workstations'
title_meta: 'Test VC Runtime - Windows Workstations'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'Finds Windows workstations with a corrupted Microsoft Visual C++ runtime and repairs them automatically.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-24
---

## Summary

This compound condition finds Windows workstations with a corrupted Microsoft Visual C++ runtime and repairs them automatically. It is part of the [Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96) solution.

## What It Does

1. Every 24 hours, it runs [Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f) to check the runtime. This check makes no changes.
2. If the check finds corruption, it runs [Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f) again with `Remediate` checked to repair it.
3. It resets on its own once the runtime is healthy again.

A check that fails for another reason, such as no internet access, does not trigger a repair. The repair never restarts the workstation.

## Turn It On

Set [cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c) to `Windows` or `Windows Workstations` for the organization, location, or device. Set it to `Disable` to exclude one.

## Details

- **Name:** `Test VC Runtime - Windows Workstations`
- **Description:** `Finds Windows workstations with a corrupted Visual C++ runtime and runs Test VC Runtime to repair it.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Automation: Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f)
- [Custom Field: cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c)
- [Solution: Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/test-vc-runtime-windows-workstations.toml)

## Changelog

### 2026-09-24

- Initial version of the document
