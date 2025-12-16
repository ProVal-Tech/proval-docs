---
id: 'a4d9dc9c-3e10-4cf4-a296-709ad9f507dd'
slug: /a4d9dc9c-3e10-4cf4-a296-709ad9f507dd
title: 'Enable Bitlocker - Servers'
title_meta: 'Enable Bitlocker - Servers'
keywords: ['bitlocker','initialization','encryption']
description: 'This is a compound conditon that triggers the bitlocker initlization on windows servers.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

This compound condition controls whether BitLocker initialization runs on Windows servers. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.

## Details

**Name:*Enable Bitlocker - Servers* 
**Description:*This compound condition controls whether BitLocker initialization runs on Windows servers. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.*
**Recommended Agent Policies:*Windows Server Policy*

## Dependencies

- [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - Initialize Bitlocker](/docs/d6d4249e-b614-4474-a7d6-2ae28417f83f)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-servers.toml)
