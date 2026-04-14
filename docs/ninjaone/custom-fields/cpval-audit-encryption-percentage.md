---
id: '1c59227a-466d-4f42-a06f-0c2c0950d07e'
slug: /1c59227a-466d-4f42-a06f-0c2c0950d07e
title: 'cPVAL Audit Encryption Percentage'
title_meta: 'cPVAL Audit Encryption Percentage'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays the BitLocker encryption percentage of the selected volume.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays the BitLocker encryption percentage of the selected volume. Shows how much of the drive is currently encrypted (0% to 100%).

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit Encryption Percentage | cpvalAuditEncryptionPercentage | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays the BitLocker encryption percentage of the selected volume. | Shows how much of the drive is currently encrypted (0% to 100%). | Bitlocker Encryption progress status for BitLocker-protected volumes. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-encryption-percentage.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/1c59227a-466d-4f42-a06f-0c2c0950d07e/percentage.webp)

## Changelog

### 2026-04-14

- Initial version of the document
