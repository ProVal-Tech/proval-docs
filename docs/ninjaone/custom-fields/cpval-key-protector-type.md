---
id: '3378eace-ffba-4f7d-8e93-3cc37510a4ea'
slug: /3378eace-ffba-4f7d-8e93-3cc37510a4ea
title: 'cPVAL KeyProtectorType'
title_meta: 'cPVAL KeyProtectorType'
keywords: ['bitlocker','initialization','encryption']
description: 'Defines which BitLocker key protector method (TPM, PIN, Password, Recovery, or AD Account) will be applied during encryption.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

Defines which BitLocker key protector method will be applied during encryption.

**Key Protector Types:**

- Tpm
- TpmPin (Requires PIN/Password)
- TpmStartup (Requires Path/ADAccount)
- TpmPinStartup (Requires PIN/Password and Path/ADAccount)
- Password (Requires PIN/Password)
- Startup (Requires Path/ADAccount )
- RecoveryKey (Requires Path/ADAccount)
- RecoveryPassword
- AdAccount (Requires Path/ADAccount)

## Details

| Label | Field Name | Definition Scope | Type | Required | Available Options | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text | Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL KeyProtectorType | cpvalKeyprotectortype | `Organizations`,`Devices`,`Location` | Drop-down | `false` | `Tpm`, `TpmPin`, `TpmStartup`, `TpmPinStartup`, `Password`, `Startup`, `RecoveryKey`, `RecoveryPassword`, `AdAccount` | `RecoveryPassword` | Editable | Read_Write | Read_Write | Defines which BitLocker key protector method will be applied during encryption. | Specifies the BitLocker key protector type used for securing the volume. | Defines which BitLocker key protector method will be applied during encryption. | BitLocker |

> **Note:** *Select `RecoveryPassword` only to apply both `TPM` and `RecoveryPassword` key protectors on the end machine.*

## Dependencies

- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-Key-protector-type.toml)

## Sample Screenshot

![cPVAL KeyProtectorType](../../../static/img/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea/image1.webp)
