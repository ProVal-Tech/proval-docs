---
id: '0756ab51-5d8f-4f7e-b82e-50a51d36c641'
slug: /0756ab51-5d8f-4f7e-b82e-50a51d36c641
title: 'Detect Bitlocker Missing KeyProtectors - Servers'
title_meta: 'Detect Bitlocker Missing KeyProtectors - Servers'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'Triggers BitLocker - Missing Key Protectors automation on windows Servers and creates tickets if any missing KeyProtector is detected on the machine.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Summary
Triggers [BitLocker - Missing Key Protectors](/docs/0f9279df-9d04-43ab-8db9-cc4b241c9e95) automation on windows Servers and creates tickets if any missing KeyProtector is detected on the machine.

## Details

- **Name:** `Detect Bitlocker Missing KeyProtectors - Servers`
- **Description:** `Triggers BitLocker - Missing Key Protectors automation on windows Servers and creates tickets if any missing KeyProtector is detected on the machine.`
- **Recommended Agent Policies:** `Windows Server Policy`

## Dependencies

- [BitLocker - Missing Key Protectors](/docs/0f9279df-9d04-43ab-8db9-cc4b241c9e95)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Compound Condition Creation

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/detect-bitlocker-missing-keyprotectors-Servers.toml)

## Changelog

### 2026-07-24

- Initial version of the document