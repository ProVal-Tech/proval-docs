---
id: 'a4d9dc9c-3e10-4cf4-a296-709ad9f507dd'
slug: /a4d9dc9c-3e10-4cf4-a296-709ad9f507dd
title: 'Enable BitLocker - Server'
title_meta: 'Enable BitLocker - Server'
keywords: ['bitlocker','initialization','encryption']
description: 'This is a compound condition that triggers the bitlocker initialization on windows servers.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

This compound condition controls whether BitLocker initialization runs on Windows servers. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run.

## Details

- **Name:** `Enable BitLocker - Server`
- **Description:** `This compound condition controls whether BitLocker initialization runs on Windows servers. When the BitLocker value is set to "Enable", it triggers the initialization process. If set to "Disable", the initialization will not run.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [Automation - Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Automation - BitLocker Initialization - Detection](/docs/87d7a413-4bd4-4629-9475-35db91cb1320)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-initialization-servers.toml)
