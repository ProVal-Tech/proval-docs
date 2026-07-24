---
id: '31e82508-7f54-40c4-97a8-6af3af24fa55'
slug: /31e82508-7f54-40c4-97a8-6af3af24fa55
title: 'Detect Bitlocker Missing KeyProtectors - Workstations'
title_meta: 'Detect Bitlocker Missing KeyProtectors - Workstations'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'Triggers BitLocker - Missing Key Protectors automation on windows workstations and creates tickets if any missing KeyProtector is detected on the machine.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Summary
Triggers [BitLocker - Missing Key Protectors](/docs/0f9279df-9d04-43ab-8db9-cc4b241c9e95) automation on windows workstations and creates tickets if any missing KeyProtector is detected on the machine.

## Details

- **Name:** `Detect Bitlocker Missing KeyProtectors - Workstations`
- **Description:** `Triggers BitLocker - Missing Key Protectors automation on windows workstations and creates tickets if any missing KeyProtector is detected on the machine.`
- **Recommended Agent Policies:** `Windows Workstation Policy`

## Dependencies

- [BitLocker - Missing Key Protectors](/docs/0f9279df-9d04-43ab-8db9-cc4b241c9e95)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Compound Condition Creation 

- [Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/detect-bitlocker-missing-keyprotectors-workstations.toml)

## Changelog

### 2026-07-24

- Initial version of the document