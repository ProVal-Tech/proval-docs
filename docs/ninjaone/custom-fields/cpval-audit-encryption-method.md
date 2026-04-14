---
id: '66adc025-26ec-43f9-ae1e-330c422c799c'
slug: /66adc025-26ec-43f9-ae1e-330c422c799c
title: 'cPVAL Audit Encryption Method'
title_meta: 'cPVAL Audit Encryption Method'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays the encryption method used for BitLocker protection on the selected volume.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays the encryption method used for BitLocker protection on the selected volume. Shows the encryption algorithm applied (for example, XTS-AES 128 or XTS-AES 256).

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit Encryption Method | cpvalAuditEncryptionMethod | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays the encryption method used for BitLocker protection on the selected volume. | Shows the encryption algorithm applied (for example, XTS-AES 128 or XTS-AES 256). | BitLocker encryption method used for the drive. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-encryption-method.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/66adc025-26ec-43f9-ae1e-330c422c799c/method.webp)

## Changelog

### 2026-04-14

- Initial version of the document
