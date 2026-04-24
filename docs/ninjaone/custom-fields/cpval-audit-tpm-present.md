---
id: '5014cdab-65a5-45d9-9587-70d354cbe89b'
slug: /5014cdab-65a5-45d9-9587-70d354cbe89b
title: 'cPVAL Audit TPM Present'
title_meta: 'cPVAL Audit TPM Present'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays whether a TPM (Trusted Platform Module) is present on the device.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays whether a TPM (Trusted Platform Module) is present on the device. Indicates if the system has a physical TPM chip available.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit TPM Present | cpvalAuditTpmPresent | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays whether a TPM (Trusted Platform Module) is present on the device. | Indicates if the system has a physical TPM chip available. | TPM presence status. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-tpm-present.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/5014cdab-65a5-45d9-9587-70d354cbe89b/tpm-present.webp)

## Changelog

### 2026-04-14

- Initial version of the document
