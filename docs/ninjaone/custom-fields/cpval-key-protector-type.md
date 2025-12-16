---
id: '3378eace-ffba-4f7d-8e93-3cc37510a4ea'
slug: /3378eace-ffba-4f7d-8e93-3cc37510a4ea
title: 'cPVAL KeyProtectorType'
title_meta: 'cPVAL KeyProtectorType'
keywords: ['Bitlocker','initialization','encryption']
description: 'Defines which BitLocker key protector method (TPM, PIN, Password, Recovery, or AD Account) will be applied during encryption.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Summary

Parameter for BitLocker: Tpm, TpmPin (PIN/Password), TpmStartup (Path/ADAccount), TpmPinStartup (PIN/Password and Path/ADAccount), Password (PIN/Password), Startup (Path/ADAcct), RecoveryKey (Path/ADAccount), RecoveryPassword, AdAccount (Path/ADAcct)

## Details

| Label | Field Name | Definition Scope | Type | Required | Default Value | Technician Permission | Automation Permission | API Permission | Description | Tool Tip | Footer Text |  Custom Field Tab Name |
| ----- | ---- | ---------------- | ---- | -------- | ------------- | --------------------- | --------------------- | -------------- | ----------- | -------- | ----------- | ----------- |
| cPVAL KeyProtectorType | cpvalKeyprotectortype | `Organizations`,`Devices`,`Location` | Drop-down |  | `Tpm`, `TpmPin`, `TpmStartup`, `TpmPinStartup`, `Password`, `Startup`, `RecoveryKey`, `RecoveryPassword`, `AdAccount` | Editable | Read_Write | Read_Write | Parameter for BitLocker: Tpm, TpmPin (PIN/Password), TpmStartup (Path/ADAccount), TpmPinStartup (PIN/Password and Path/ADAccount), Password (PIN/Password), Startup (Path/ADAcct), RecoveryKey (Path/ADAccount), RecoveryPassword, AdAccount (Path/ADAcct) | Specifies the BitLocker key protector type used for securing the volume. | Defines which BitLocker key protector method (TPM, PIN, Password, Recovery, or AD Account) will be applied during encryption. | Bitlocker |

## Dependencies

- [Automation - Initialize Bitlocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)

## Custom Field Creation

[Custom Field Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/custom-fields/cpval-Key-protector-type.toml)

## Sample Screenshot

![cPVAL KeyProtectorType](../../../static/img/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea/cpval-Keyprotectortype.webp)  
