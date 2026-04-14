---
id: 'ced74400-a022-4fa2-9b72-4c10e92e36ab'
slug: /ced74400-a022-4fa2-9b72-4c10e92e36ab
title: 'cPVAl Audit Mount Point'
title_meta: 'cPVAl Audit Mount Point'
keywords: ['bitlocker','auditing','encryption','tpm']
description: 'Shows the specific volume or drive for example, C:, D: that is protected by BitLocker.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-04-14
---

## Summary

Shows the specific volume or drive (for example, C:, D:) that is protected by BitLocker.

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAl Audit Mount Point | cpvalAuditMountPoint | `Devices` | Text | `False` | | Editable | Read_Write | Read_Write | Displays the drive letter where BitLocker encryption is enabled. | Shows the specific volume or drive `(for example, C:, D:)` that is protected by BitLocker. | BitLocker-enabled drive location | BitLocker Audit |

## Dependencies

- [Automation: BitLocker and TPM Audit](/docs/2d104874-ec69-4d95-b912-7fcd240bf592)
- [Automation: Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution: BitLocker and TPM Audit](/docs/57c787ad-8d22-4ae4-b5e5-dac34fc600fc)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-audit-mount-point.toml)

## Sample Screenshot

![Image1](../../../static/img/docs/ced74400-a022-4fa2-9b72-4c10e92e36ab/mountpoint.webp)

## Changelog

### 2026-04-14

- Initial version of the document
