---
id: '6193f950-2266-42fd-9535-59adfe445cb5'
slug: /6193f950-2266-42fd-9535-59adfe445cb5
title: 'Enable Bitlocker - Workstations'
title_meta: 'Enable Bitlocker - Workstations'
keywords: ['Bitlocker','initialization','encryption']
description: 'This is a compound conditon that triggers the bitlocker initlization on windows Workstations.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

This compound condition controls whether BitLocker initialization runs on Windows Workstations. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.

## Details

**Name:*Enable Bitlocker - Workstations*
**Description:*This compound condition controls whether BitLocker initialization runs on Windows Workstations. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.*
**Recommended Agent Policies:*Windows Workstation Policy*

## Dependencies

- [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - Initialize Bitlocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-workstation.toml)
