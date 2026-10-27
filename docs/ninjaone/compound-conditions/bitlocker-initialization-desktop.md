---
id: '47f52182-7c4c-4b4d-a0d7-7cb25c5256fa'
slug: /47f52182-7c4c-4b4d-a0d7-7cb25c5256fa
title: 'Enable BitLocker - Desktop'
title_meta: 'Enable BitLocker - Desktop'
keywords: ['bitlocker','initialization','encryption','desktop']
description: 'Runs Initialize and Audit BitLocker on Windows desktops that need a BitLocker fix, when cPVAL BitLocker Enable is set to Windows, Windows Workstations or Windows Desktops.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-10-26
---

## Summary

Runs [Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198) on Windows desktops when [BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320) finds that the desktop's BitLocker state does not match the cPVAL custom fields. It applies to desktops where [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) is `Windows`, `Windows Workstations` or `Windows Desktops`, and checks them every 24 hours.

A workstation counts as a desktop when Windows has not detected a battery on it, which includes all-in-ones, mini PCs and virtual machines. The compound condition checks this with the registry key `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\ACPI\PNP0C0A`, which Windows creates for a laptop battery. [Enable BitLocker - Laptop](/docs/32f08cdb-3ce6-4628-989b-704cd2e6394e) covers the workstations that have one.

## Details

- **Name:** `Enable BitLocker - Desktop`
- **Description:** `Runs Initialize and Audit BitLocker on Windows desktops where cPVAL BitLocker Enable is Windows, Windows Workstations or Windows Desktops and the detection script finds a needed fix.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [Custom Field - cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
- [Automation - Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-desktop.toml)

## Changelog

### 2026-10-26

- Initial version of the document
