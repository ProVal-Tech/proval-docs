---
id: 'd7079417-ab2f-460a-ab63-6ec1f7b986ca'
slug: /d7079417-ab2f-460a-ab63-6ec1f7b986ca
title: 'cPVAL Audit TPM Activated'
title_meta: 'cPVAL Audit TPM Activated'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays whether the TPM (Trusted Platform Module) is activated on the device.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays whether the TPM (Trusted Platform Module) is activated on the device. Indicates if TPM is currently activated and ready for use.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit TPM Activated | cpvalAuditTpmActivated | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays whether the TPM `(Trusted Platform Module)` is activated on the device. | Indicates if TPM is currently activated and ready for use. | TPM activation status. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-tpm-activated.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/d7079417-ab2f-460a-ab63-6ec1f7b986ca/activated.webp)

## Changelog

### 2026-04-14

- Initial version of the document
