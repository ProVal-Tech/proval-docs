---
id: '251793d4-b73d-4d19-9c06-d1ce96fc4a2e'
slug: /251793d4-b73d-4d19-9c06-d1ce96fc4a2e
title: 'Tpm Detailed Audit [Script]'
title_meta: 'Tpm Detailed Audit [Script]'
keywords: ['TPM', 'Bitlocker']
description: 'This dataview shows the complete detail of the TPM of the Windows machines'
tags: ['tpm', 'bitlocker', 'auditing', 'bios']
draft: false
unlisted: false
---

## Summary

This dataview shows the complete detail of the TPM of the Windows machines.
It is been collected by the script [Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a).

## Dependencies

[Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a)

[Table - plugin_proval_tpm_audit](/docs/82144ad7-4cff-4883-8389-1180052ab156)

[Solution - Bitlocker](/docs/f41e4d71-7074-4c28-8246-b8e3036c1212)

## Columns

| **Field**                     | **Description**                                                                 |
|------------------------------|---------------------------------------------------------------------------------|
| **Client**           | Client name of the agent    |
| **Location**        | Location name of the agent             |
| **Computer**      | Computer name of the agent                  |
| **Operating System**| Operating system name of the agent    |
| **LastContact**           | Last contact date of the agent with the RMM    |
| **ManufacturerIdTxt**        | A readable string of the manufacturer (e.g., `IFX` for Infineon).              |
| **ManufacturerVersion**      | The version of the TPM firmware provided by the manufacturer.                  |
| **ManufacturerVersionFull20**| Full version string for TPM 2.0, including major, minor, and build numbers.    |
| **AutoProvisioning**         | Indicates whether Windows is allowed to provision the TPM automatically.       |
| **LockedOut**                | Shows whether the TPM is currently in a lockout state.                         |
| **LockOutCount**             | Number of failed authorization attempts made.                   |
| **LockOutHealTime**          | Time remaining before the TPM lockout counter resets (in seconds).             |
| **LockoutMax**               | Maximum number of failed attempts allowed before lockout occurs.               |
| **ManagedAuthLevel**         | Indicates the level of authorization management (e.g., `Full`, `Delegated`).   |
| **OwnerAuth**                | A secure string representing the TPM owner authorization value.                |
| **OwnerClearDisabled**       | If `True`, the TPM cannot be cleared without physical presence or BIOS access. |
| **RestartPending**           | Indicates whether a system restart is required to complete a TPM operation.    |
| **SelfTest**                 | Result of the TPM self-test (e.g., `Passed`, `Failed`).                        |
| **TpmActivated**             | Indicates whether the TPM is activated (usually via BIOS/UEFI).                |
| **TpmEnabled**               | Indicates whether the TPM is enabled in BIOS/UEFI.                             |
| **TpmOwned**                 | Indicates whether the TPM has been initialized and has an owner.               |
| **TpmPresent**               | Indicates whether a TPM chip is physically present on the system.              |
| **TpmReady**                 | Indicates whether the TPM is fully ready for use (enabled, activated, owned).  |
