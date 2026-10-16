---
id: '86f44138-3e57-4c1f-8d7e-c4a0efc70fac'
slug: /86f44138-3e57-4c1f-8d7e-c4a0efc70fac
title: 'Enforce Dell BIOS Settings'
title_meta: 'Enforce Dell BIOS Settings'
keywords: ['bios', 'bios-configuration', 'dell', 'dell-command-configure', 'wake-on-lan', 'auto-on', 'device-standards']
description: 'Runs Check Dell BIOS Settings once a day on Windows workstations where cPVAL Enforce Dell BIOS Settings is set to Audit or Enforce, and runs Apply Dell BIOS Settings when the settings differ in Enforce mode.'
tags: ['windows', 'setup', 'bios', 'dell']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Summary

This condition runs the [Check Dell BIOS Settings](/docs/a9117300-d45b-45e8-9cfe-e85859b1931b) script once a day on Dell workstations where [cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba) is set to Audit or Enforce. Devices where the field is None or blank are not checked.

The condition triggers when the check finds settings that differ in Enforce mode. It then runs the [Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955) script, which applies the settings and flags the device for a restart. In Audit mode, the check only records the result in [cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba).

## Details

**Name:** `Enforce Dell BIOS Settings`  
**Description:** `Runs Check Dell BIOS Settings once a day on Dell workstations where cPVAL Enforce Dell BIOS Settings is set to Audit or Enforce, and runs Apply Dell BIOS Settings when the settings differ in Enforce mode.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field: cPVAL Enforce Dell BIOS Settings](/docs/eb1c5a88-0933-45e4-96e7-f71422e4ddba)
- [Custom Field: cPVAL Dell BIOS Settings](/docs/0ca65a80-d1c0-4ef9-b078-cd3e8d9d89db)
- [Custom Field: cPVAL Dell BIOS Settings Status](/docs/1ddc8f49-ede2-4d44-871e-b448e8ba61ba)
- [Automation: Check Dell BIOS Settings](/docs/a9117300-d45b-45e8-9cfe-e85859b1931b)
- [Automation: Apply Dell BIOS Settings](/docs/b0c846eb-72d8-48ea-84b5-af87a02aa955)
- [Solution: Enforce Dell BIOS Settings](/docs/d3ee4598-13c1-4d19-8b6c-d368f2a00ab3)
- [Solution: Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/enforce-dell-bios-settings.toml)

## Changelog

### 2026-10-16

- Initial version of the document