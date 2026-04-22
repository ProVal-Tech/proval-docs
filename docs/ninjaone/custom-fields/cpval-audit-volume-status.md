---
id: '916d0353-8a35-4690-8d40-04b2a95112e1'
slug: /916d0353-8a35-4690-8d40-04b2a95112e1
title: 'cPVAL Audit Volume Status'
title_meta: 'cPVAL Audit Volume Status'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays whether the drive is fully encrypted or still in progress.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays whether the drive is fully encrypted or still in progress. Indicates the current encryption status of the drive.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit Volume Status | cpvalAuditVolumeStatus | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays whether the drive is fully encrypted or still in progress. | Indicates the current encryption status of the drive. | BitLocker volume encryption status. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-volume-status.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/916d0353-8a35-4690-8d40-04b2a95112e1/volume.webp)

## Changelog

### 2026-04-14

- Initial version of the document
