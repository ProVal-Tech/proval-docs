---
id: '52ff36d4-e554-4741-aae1-4bd1a50165ee'
slug: /52ff36d4-e554-4741-aae1-4bd1a50165ee
title: 'cPVAL Audit Lock Status'
title_meta: 'cPVAL Audit Lock Status'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Displays the current lock status of the BitLocker-protected drive.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Displays the current lock status of the BitLocker-protected drive. Indicates whether the drive is locked or unlocked.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL Audit Lock Status | cpvalAuditLockStatus | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays the current lock status of the BitLocker-protected drive. | Indicates whether the drive is locked or unlocked. | BitLocker drive lock status. | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-lock-status.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/52ff36d4-e554-4741-aae1-4bd1a50165ee/audit-lock.webp)

## Changelog

### 2026-04-14

- Initial version of the document
