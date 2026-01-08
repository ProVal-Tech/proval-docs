---
id: '5f6128a5-4fc8-44b2-adb2-40c2ac92edc5'
slug: /5f6128a5-4fc8-44b2-adb2-40c2ac92edc5
title: 'cPVAL BitLocker Enabled for System Drive'
title_meta: 'cPVAL BitLocker Enabled for System Drive'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'A boolean flag indicating if the Operating System drive is actively encrypted and protected by BitLocker. Useful for conditions and reporting compliance.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

A boolean flag indicating if the Operating System drive is actively encrypted and protected by BitLocker. Useful for conditions and reporting compliance.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL BitLocker Enabled for System Drive | cpvalBitlockerEnabledForSystemDrive | `Devices` | Checkbox | `False` | | Editable | Read_Write | Read_Write | A boolean flag indicating if the Operating System drive is actively encrypted and protected by BitLocker. Useful for conditions and reporting compliance. | Checked (Yes) if the OS Drive is fully protected; Unchecked (No) otherwise. | Read-only. Updated automatically by the BitLocker solution. | BitLocker |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-bitlocker-enabled-for-system-drive.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/5f6128a5-4fc8-44b2-adb2-40c2ac92edc5/image1.webp)
