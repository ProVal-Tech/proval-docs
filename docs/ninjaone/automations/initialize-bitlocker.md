---
id: 'e3a24552-f347-4117-82f5-7afaaa3fc198'
slug: /e3a24552-f347-4117-82f5-7afaaa3fc198
title: 'Initialize BitLocker'
title_meta: 'Initialize BitLocker'
keywords: ['bitlocker','initialization','encryption']
description: 'Automates BitLocker initialization on Windows via Ninja RMM custom fields. Validates parameters, sets mount point, encryption method, key protector, PIN/password, and AD/path, downloads a helper script, executes it, and logs output for auditing.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Description

This script serves as the enforcement engine that automatically corrects BitLocker configuration issues identified by the detection logic. Designed as a wrapper for an agnostic encryption solution, it first prepares the environment by ensuring the correct security protocols (TLS 1.2/1.3) are active and establishing a secure working directory. It then parses the same custom fields to understand the required policy. Based on the current state of the drive, the script performs intelligent remediation actions: it will inject a missing Recovery Password without decrypting, or fully disable and re-encrypt the drive if the encryption algorithm or key protector type is incorrect. If decryption is required, the script enters a monitored wait loop to ensure the drive is fully clean before re-attempting encryption. Finally, it executes the core encryption logic to apply the correct settings, ensuring the device becomes fully compliant without requiring manual administrator intervention.

**Note:**

- This is only compatible for Windows devices.  
- If no mount point is provided in the Custom field, it will encrypt "C" Drive by default.
- The BitLocker Drive Encryption feature must be enabled on servers to encrypt a drive with BitLocker disk encryption. Encryption will not work without enabling this feature.

## Requirements

- PowerShell v5
- Update the custom fields with the data so that script will use that settings.

## Sample Run

![SampleRun1](../../../static/img/docs/e3a24552-f347-4117-82f5-7afaaa3fc198/initialize-bitlocker.webp)

## Dependencies

- [Custom Field - cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
- [Custom Field - cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
- [Custom Field - cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
- [Custom Field - cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
- [Custom Field - cPVAL Mountpoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
- [Custom Field - cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)
- [Custom Field - cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)
- [Agnostic - Initialize-BitLockerVolume](/docs/2ce835a2-3ac1-4291-baaf-8d3cac76869f)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Custom Fields

| Field Label               | Scope                     | Accepted Values                                                                                                   | Default Value      | Description |
|---------------------------|---------------------------|-------------------------------------------------------------------------------------------------------------------|--------------------|-------------|
| [cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)   | Organization, Location, Device           | **Drive Letter** (e.g., `C:` or `D:`)                                                                             | $env:SystemDrive   | The drive letter to initialize BitLocker on. |
|  [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)   | Organization, Location, Device     | `XTSAES128`, `XTSAES256`, `AES128`, `AES256`                                                                      | XtsAes256          | The encryption algorithm to apply. |
| [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)  | Organization, Location, Device     | `TPM`, `TpmPin`, `TpmStartup`, `TpmPinStartup`, `Password`, `Startup`, `RecoveryKey`, `RecoveryPassword`, `AdAccount` | RecoveryPassword   | The primary authentication method used to unlock the drive. |
| [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)     | Organization, Location, Device        | **String** (Any valid PIN or Password)                                                                            | $null              | Required if `TpmPin` or `Password` is selected. |
| [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)  | Organization, Location, Device      | **String** (UNC Path, Drive Path, or AD User/Group)                                                               | $null              | Required for `Startup`, `RecoveryKey`, or `AdAccount`. |
| [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) | Organization, Location, Device     | `0` = None<br />`1` = Allow TPM Init<br />`2` = Allow Restart<br />`3` = Allow Both                                  | 0                  | Controls if the script can initialize TPM or reboot the machine. |
| [cPVAL SkipHardwareTes](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)  | Organization, Location, Device | | $false             | Skips the hardware pre-check (faster, but riskier). |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/initialize-bitlocker.ps1)

## Output

- Activity Logs
