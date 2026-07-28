---
id: 'bf16fc48-0565-4746-9ae9-a744e9363937'
slug: /bf16fc48-0565-4746-9ae9-a744e9363937
title: 'Missing Key Protectors'
title_meta: 'FilenameMissing Key Protectors'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'This ticket template configures how a ConnectWise Manage ticket will be generated in response to the Detect Bitlocker Missing KeyProtectors Conditions.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2026-07-28
---

## Overview
This ticket template configures how a ConnectWise Manage ticket will be generated in response to the [Compound Condition : Detect Bitlocker Missing KeyProtectors - Workstations](/docs/31e82508-7f54-40c4-97a8-6af3af24fa55) and [Compound Condition : Detect Bitlocker Missing KeyProtectors - Servers](/docs/0756ab51-5d8f-4f7e-b82e-50a51d36c641) condition.

## Requirement

Ensure that the ConnectWise Manage app is enabled and connected.  
![Requirement](../../../static/img/docs/86a9b907-a95e-48a8-a304-2bb243c3b6a1/requirement.webp)

## Dependencies

- [Compound Condition : Detect Bitlocker Missing KeyProtectors - Servers](/docs/0756ab51-5d8f-4f7e-b82e-50a51d36c641)
- [Compound Condition : Detect Bitlocker Missing KeyProtectors - Workstations](/docs/31e82508-7f54-40c4-97a8-6af3af24fa55)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Template Creation

- [CW Manage Ticket Template Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/cw-manage-ticket-templates/missing-key-protectors.toml)

## Changelog

### 2026-07-28

- Initial version of the document