---
id: '0f9279df-9d04-43ab-8db9-cc4b241c9e95'
slug: /0f9279df-9d04-43ab-8db9-cc4b241c9e95
title: 'BitLocker - Missing Key Protectors'
title_meta: 'BitLocker - Missing Key Protectors'
keywords: ['bitlocker', 'bitlocker-status', 'recovery-key', 'bitlocker-audit', 'recovery-password']
description: 'Detects fully encrypted BitLocker volumes with protection off and a missing key protector.'
tags: ['bitlocker', 'security', 'auditing']
draft: false
unlisted: false
last_update:
  date: 2026-07-24
---

## Overview
Detects fully encrypted BitLocker volumes with protection off and a missing key protector.

## Sample Run

`Play Button` > `Run Automation` > `Script`  
![SampleRun1](../../../static/img/docs/0f9279df-9d04-43ab-8db9-cc4b241c9e95/image1.webp)

## Dependencies

- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/bitlocker-missing-key-protectors.ps1)

## Output

- Activity Details

## Changelog

### 2026-07-24

- Initial version of the document
