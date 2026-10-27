---
id: '87d7a413-4bd4-4629-9475-35db91cb1320'
slug: /87d7a413-4bd4-4629-9475-35db91cb1320
title: 'BitLocker Initialization - Detection'
title_meta: 'BitLocker Initialization - Detection'
keywords: ['bitlocker','initialization','encryption','detection']
description: 'Checks whether the BitLocker state of a Windows device matches the cPVAL custom fields, and tells the BitLocker initialization compound conditions when Initialize and Audit BitLocker must run.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
last_update:
  date: 2026-10-26
---

## Description

Checks whether the BitLocker state of a Windows device matches the configuration in the cPVAL custom fields, without changing anything. It is the condition of the [Enable BitLocker - Laptop](/docs/32f08cdb-3ce6-4628-989b-704cd2e6394e), [Enable BitLocker - Desktop](/docs/47f52182-7c4c-4b4d-a0d7-7cb25c5256fa) and [Enable BitLocker - Server](/docs/a4d9dc9c-3e10-4cf4-a296-709ad9f507dd) compound conditions. When it exits with 1, the compound condition runs [Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198). The checks follow the same order as that automation, so it only runs when there is something to fix.

### Exit Code 0: No Action Needed

- The drive is decrypting, or decryption is paused.
- BitLocker is waiting for the hardware test at the next restart.
- Protection is suspended for a set number of restarts, as BIOS and firmware updates do.
- Encryption is in progress, or the drive matches the configuration with protection on.

### Exit Code 1: Initialize and Audit BitLocker Must Run

The output contains a line that begins with `Detected:` and gives the reason.

- BitLocker is not enabled.
- The system drive has key protectors, but none that can unlock it at startup (no TPM based or password protector), while the configured protector is `RecoveryPassword`, `RecoveryKey` or `AdAccount`. These devices ask for the recovery key at every startup while protection is on. This is checked even while encryption is in progress.
- The drive uses a different TPM based protector or encryption method than configured. This is not flagged while encryption is in progress.
- The drive is encrypted without key protectors (Windows device encryption waiting for activation).
- The configured protector, or the recovery password set in [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b), is missing.
- Encryption is paused, or protection is suspended until it is resumed manually.

### Exit Code 2: Unsupported or Needs Attention

The output contains a line that begins with `[FAIL]` and gives the reason. Initialize and Audit BitLocker does not run.

- The BitLocker module is missing, or the device runs a Home edition.
- A value the key protector needs is missing, or [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b) is not a valid 48-digit recovery password while the key protector is `RecoveryPassword`.
- The drive cannot be read.
- The BitLocker hardware test failed and [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac) is not checked.
- The fix needs a TPM and none was found, or the TPM is not ready and [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) does not allow initializing it.
- The fix would decrypt and encrypt the drive again, and the TPM it needs is not ready.

## Sample Run

Manual execution of this script is not recommended. It is designed to run as the condition of the solution's compound conditions.

## Dependencies

- [Custom Field - cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
- [Custom Field - cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
- [Custom Field - cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
- [Custom Field - cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)
- [Custom Field - cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)
- [Custom Field - cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
- [Custom Field - cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
- [Automation - Initialize and Audit BitLocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)
- [Solution - BitLocker Initialize - NinjaOne](/docs/2ebfabd5-05cf-4175-a513-2aa290eb26e8)

## Custom Fields

| Field Label | Scope | Accepted Values | Default Value | Description |
| ----------- | ----- | --------------- | ------------- | ----------- |
| [cPVAL MountPoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926) | Organization, Location, Device | A drive letter: `D`, `D:` or `D:\` | System drive | The drive to check. |
| [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0) | Organization, Location, Device | `Aes128`, `Aes256`, `XtsAes128`, `XtsAes256` | `XtsAes128` | The expected encryption method. |
| [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea) | Organization, Location, Device | `Tpm`, `TpmPin`, `TpmStartup`, `TpmPinStartup`, `Password`, `Startup`, `RecoveryKey`, `RecoveryPassword`, `AdAccount` | `RecoveryPassword` | The expected key protector. |
| [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b) | Organization, Location, Device | A PIN, a password, or a 48-digit recovery password | - | Checked for presence, and for the recovery password format with `RecoveryPassword`. |
| [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47) | Organization, Location, Device | A folder path, or a domain account or group | - | Checked for presence when the key protector needs it. |
| [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) | Organization, Location, Device | `0`, `1`, `2`, `3` | `0` | Decides whether a TPM that is not ready can be initialized by the fix. |
| [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac) | Organization, Location, Device | Checked or unchecked | Unchecked | Decides whether a failed hardware test blocks the fix. |

## Automation Setup/Import

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/bitlocker-initialization-detection.ps1)

## Output

- Activity Logs

## Changelog

### 2026-10-26

- Documented the updated detection logic and the output of each exit code. Exit 1 now writes a line that begins with `Detected:`.
- Added detection of system drives that have no key protector able to unlock them at startup, and of Windows device encryption waiting for activation.
- The script now exits with 2 instead of starting a fix that needs a TPM that is missing or not ready.
- Removed the Force parameter, which belongs to Initialize and Audit BitLocker.
- Corrected the custom field values and the cPVAL SkipHardwareTest link text.

### 2025-12-30

- Initial version of the document
