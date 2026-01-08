---
id: 'ee96061c-3700-44af-a10c-9f1dde32e611'
slug: /ee96061c-3700-44af-a10c-9f1dde32e611
title: 'BitLocker Audit - Servers'
title_meta: 'BitLocker Audit - Servers'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'This compound condition performs BitLocker and TPM audit once per day on Windows servers where auditing is enabled from cPVAL Enable BitLocker Audit custom field. If set to Disable, the audit will not be performed.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

This compound condition performs BitLocker and TPM audit once per day on Windows servers where auditing is enabled from [cPVAL Enable BitLocker Audit](/docs/61e7d229-4f47-431d-b948-23523a04cb7d) custom field. If set to Disable, the audit will not be performed.

**Note:**

- The BitLocker Drive Encryption feature must be enabled on servers to perform auditing. This script will not work without enabling this feature.

## Details

- **Name:** `BitLocker Audit - Servers`
- **Description:** `This compound condition performs BitLocker and TPM audit once per day on Windows servers where auditing is enabled from 'cPVAL Enable BitLocker Audit' custom field. If set to Disable, the audit will not be performed.`
- **Recommended Agent Policies:** `Windows Server Policy [Default]`

## Dependencies

- [Custom Field: cPVAL Enable BitLocker Audit](/docs/61e7d229-4f47-431d-b948-23523a04cb7d)
- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Compound Condition Creation

[Compound Condition Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/compound-conditions/bitlocker-audit-servers.toml)
