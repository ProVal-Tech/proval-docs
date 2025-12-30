---
id: '87d7a413-4bd4-4629-9475-35db91cb1320'
slug: /87d7a413-4bd4-4629-9475-35db91cb1320
title: 'BitLocker Initialization - Detection'
title_meta: 'BitLocker Initialization - Detection'
keywords: ['bitlocker','initialization','encryption']
description: 'Evaluates the BitLocker compliance status of an endpoint against policies defined in NinjaRMM Custom Fields.'
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Description

This script functions as a read-only compliance auditor designed to determine if an endpoint's current encryption state matches the organization's security policy. It begins by validating the system's compatibility, ensuring the machine is running a supported Windows edition (excluding Home) and has the necessary BitLocker modules. It then retrieves the desired configuration, such as the specific encryption method (e.g., XTS-AES 256) and key protector type (e.g., TPM or TPM+PIN), directly from NinjaRMM custom fields. The script compares these requirements against the actual state of the drive. It identifies discrepancies such as "Suspended" protection, incorrect encryption algorithms, mismatched protectors, or missing recovery passwords. The script returns specific exit codes to signal its findings: Exit 0 indicates the device is fully compliant; Exit 1 signals that remediation is required (triggering the autofix); and Exit 2 indicates an unsupported or error state where no action should be taken.

### **Detection Conditions & Logic**

The script evaluates the endpoint against the desired configuration (defined in `cPVAL` Custom Fields) and categorizes the device into one of three states. The final status is determined by the Exit Code returned by the script.

#### **1. Non-Compliant (Action Required)**

**Exit Code: 1**
The script triggers this state if the device is compatible but fails to meet the specified security policy. This is the only state that triggers the remediation automation. A device is flagged as Non-Compliant if:

* **Protection Suspended:** BitLocker is enabled, but the protection status is `Off` (Suspended).
* **Encryption Method Mismatch:** The drive is encrypted, but the algorithm (e.g., `AES128`) does not match the policy (e.g., `XTS-AES256`).
* **Key Protector Mismatch:** The active key protector (e.g., `TPM` only) does not match the required type (e.g., `TPM` + `PIN`).
* **Missing Recovery Password:** The policy requires a Recovery Password, but the drive is encrypted without one.

#### **2. Compliant (No Action Required)**

**Exit Code: 0**
The script triggers this state when the device is fully secured according to the policy. No remediation is performed. A device is flagged as Compliant if:

* **Fully Encrypted:** The drive is fully encrypted with `ProtectionStatus: On`.
* **Correct Configuration:** Both the **Encryption Method** and **Key Protector** types match the values defined in the Custom Fields.
* **Recovery Password Present:** If required by policy, a valid Recovery Password exists on the volume.

#### **3. Error / Unsupported (No Action Taken)**

**Exit Code: 2**
The script triggers this state if the device cannot be encrypted due to hardware or software limitations. This prevents the remediation script from running and failing repeatedly. A device is flagged as Unsupported if:

* **Unsupported OS:** The device is running a **Windows Home** edition.
* **Missing Modules:** The BitLocker PowerShell module is not available or cannot be loaded.
* **Invalid Input:** The Custom Field configuration contains invalid values (e.g., an unknown encryption method).

## Sample Run

Manual execution of this script is not recommended. It is specifically designed to function as the automated detection logic within the solution's Compound Conditions

## Dependencies

- [Custom Field - cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
- [Custom Field - cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
- [Custom Field - cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
- [Custom Field - cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
- [Custom Field - cPVAL Mountpoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
- [Custom Field - cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)
- [Custom Field - cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)
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

[Automation Configuration](https://github.com/ProVal-Tech/ninjarmm/blob/main/scripts/bitlocker-initialization-detection.ps1)

## Output

- Activity Logs
