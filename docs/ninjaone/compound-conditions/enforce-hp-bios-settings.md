---
id: '20215141-015b-4108-b40b-26070194acc1'
slug: /20215141-015b-4108-b40b-26070194acc1
title: 'Enforce HP BIOS Settings'
title_meta: 'Enforce HP BIOS Settings'
keywords: ['bios', 'bios-configuration', 'hp', 'hp-bcu', 'wake-on-lan', 'power-on', 'device-standards']
description: 'Runs Check HP BIOS Settings once a day on Windows workstations where cPVAL Enforce HP BIOS Settings is set to Audit or Enforce, and runs Apply HP BIOS Settings when the settings differ in Enforce mode.'
tags: ['windows', 'setup', 'bios', 'hp']
draft: false
unlisted: false
last_update:
  date: 2026-10-16
---

## Summary

This condition runs the [Check HP BIOS Settings](/docs/d04025b0-cb2a-4f49-b211-4e13c181d2f3) script once a day on HP workstations where [cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79) is set to Audit or Enforce. Devices where the field is None or blank are not checked.

The condition triggers when the check finds settings that differ in Enforce mode. It then runs the [Apply HP BIOS Settings](/docs/c338d928-7659-4ade-862c-7f8cebc3472d) script, which applies the settings and flags the device for a restart. In Audit mode, the check only records the result in [cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7).

## Details

**Name:** `Enforce HP BIOS Settings`  
**Description:** `Runs Check HP BIOS Settings once a day on HP workstations where cPVAL Enforce HP BIOS Settings is set to Audit or Enforce, and runs Apply HP BIOS Settings when the settings differ in Enforce mode.`  
**Recommended Agent Policies:** `Windows Workstation [Default]`

## Dependencies

- [Custom Field: cPVAL Enforce HP BIOS Settings](/docs/d6023b8f-c04c-4453-89ce-bc729be9fb79)
- [Custom Field: cPVAL HP BIOS Settings](/docs/91f31a3a-5d44-4a05-a1fd-5eba010aa03a)
- [Custom Field: cPVAL HP BIOS Settings Status](/docs/dae68716-9ea4-4f05-a0d4-4c2899fd22b7)
- [Automation: Check HP BIOS Settings](/docs/d04025b0-cb2a-4f49-b211-4e13c181d2f3)
- [Automation: Apply HP BIOS Settings](/docs/c338d928-7659-4ade-862c-7f8cebc3472d)
- [Solution: Enforce HP BIOS Settings](/docs/ec68a35d-7884-4e39-bebb-6f2b37d77eca)
- [Solution: Device Standards](/docs/a0c383d4-699a-4bb8-af7f-c2a007747182)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/enforce-hp-bios-settings.toml)

## Changelog

### 2026-10-16

- Initial version of the document