---
id: '6193f950-2266-42fd-9535-59adfe445cb5'
slug: /6193f950-2266-42fd-9535-59adfe445cb5
title: 'Enable BitLocker - Workstation'
title_meta: 'Enable BitLocker - Workstation'
keywords: ['bitlocker','initialization','encryption']
description: 'This is a compound condition that triggers the BitLocker initialization on windows Workstations.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

This compound condition controls whether BitLocker initialization runs on Windows Workstations. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.

## Details

- **Name:** `Enable BitLocker - Workstation`
- **Description:** `This compound condition controls whether BitLocker initialization runs on Windows Workstations. When the BitLocker value is set to "Enable", it triggers the initialization process. If set to "Disable", the initialization will not run.`
- **Recommended Agent Policies:** `Windows Workstation Policy [Default]`

## Dependencies

- [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
- [Automation - Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-workstation.toml)
