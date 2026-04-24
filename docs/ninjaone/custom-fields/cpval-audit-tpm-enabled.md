---
id: '20f300a5-65f7-443b-aeeb-16ee9e7dc923'
slug: /20f300a5-65f7-443b-aeeb-16ee9e7dc923
title: 'cPVAL Audit TPM Enabled'
title_meta: 'cPVAL Audit TPM Enabled'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays whether the TPM (Trusted Platform Module) is enabled in the system firmware.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays whether the TPM (Trusted Platform Module) is enabled in the system firmware. Indicates if TPM is enabled in `BIOS/UEFI` settings.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit TPM Enabled | cpvalAuditTpmEnabled | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays whether the TPM (Trusted Platform Module) is enabled in the system firmware. | Indicates if TPM is enabled in `BIOS/UEFI` settings | TPM enabled status. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-tpm-enabled.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/20f300a5-65f7-443b-aeeb-16ee9e7dc923/tpm-enabled.webp)

## Changelog

### 2026-04-14

- Initial version of the document
