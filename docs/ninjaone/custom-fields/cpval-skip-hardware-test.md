---
id: 'e22d7853-1e3c-403c-8ba9-b9b99ba31bac'
slug: /e22d7853-1e3c-403c-8ba9-b9b99ba31bac
title: 'cPVAL SkipHardwareTest'
title_meta: 'cPVAL SkipHardwareTest'
keywords: ['BitLocker','initialization','encryption']
description: 'Mark this checkbox to enable BitLocker without forcefully validating the hardware.'
tags: ['encryption','custom-fields','BitLocker','security']
draft: false
unlisted: false
---

## Summary

Mark this checkbox to enable BitLocker without performing the hardware validation test. Skipping the hardware test allows BitLocker initialization to proceed on devices where hardware checks may fail or are unnecessary.

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL SkipHardwareTest | cpvalSkiphardwaretest | `Organizations`,`Devices`,`Location` | CheckBox |  |  | Editable | Read_Write | Read_Write | Mark this checkbox to enable BitLocker without performing the hardware validation test. Skipping the hardware test allows BitLocker initialization to proceed on devices where hardware checks may fail or are unnecessary. | Mark this checkbox to enable BitLocker without forcefully validating the hardware. Skipping the hardware test allows BitLocker initialization to proceed on devices where hardware checks may fail or are unnecessary.| Mark this checkbox to enable BitLocker without forcefully validating the hardware. | BitLocker |

## Dependencies

- [Automation - Initialize BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution - Bitlocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)


## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-skip-hardware-test.toml)

## Sample Screenshot

![cPVAL SkipHardwareTest](../../../static/img/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac/skip-hardware.webp)  
