---
id: '8be26d10-ce6c-49b1-99ac-bd5b3bdafc2d'
slug: /8be26d10-ce6c-49b1-99ac-bd5b3bdafc2d
title: 'Test VC Runtime - Windows Servers'
title_meta: 'Test VC Runtime - Windows Servers'
keywords: ['visual-c++', 'vcredist', 'runtime', 'health-check', 'remediation', 'dism', 'sfc', 'windows']
description: 'Finds Windows servers with a corrupted Microsoft Visual C++ runtime and repairs them automatically.'
tags: ['update', 'windows', 'automation']
draft: false
unlisted: false
last_update:
  date: 2026-09-24
---

## Summary

This compound condition finds Windows servers with a corrupted Microsoft Visual C++ runtime and repairs them automatically. It is part of the [Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96) solution.

## What It Does

1. Every 24 hours, it runs [Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f) to check the runtime. This check makes no changes.
2. If the check finds corruption, it runs [Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f) again with `Remediate` checked to repair it.
3. It resets on its own once the runtime is healthy again.

A check that fails for another reason, such as no internet access, does not trigger a repair. The repair never restarts the server.

## Turn It On

Set [cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c) to `Windows` or `Windows Servers` for the organization, location, or device. Set it to `Disable` to exclude one.

## Details

- **Name:** `Test VC Runtime - Windows Servers`
- **Description:** `Finds Windows servers with a corrupted Visual C++ runtime and runs Test VC Runtime to repair it.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Automation: Test VC Runtime](/docs/a63278c8-89e1-4cfc-80dc-7158bd88635f)
- [Custom Field: cPVAL VC Runtime Remediation](/docs/c6895ff6-39ae-403c-9436-4830e1a84d4c)
- [Solution: Visual C++ Health Remediation](/docs/6646d475-e16b-4fa0-b758-fede6155ed96)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/test-vc-runtime-windows-servers.toml)

## Changelog

### 2026-09-24

- Initial version of the document
