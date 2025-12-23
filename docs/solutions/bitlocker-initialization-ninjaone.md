---
id: '2ebfabd5-05cf-4175-a513-2aa290eb26e8'
slug: /2ebfabd5-05cf-4175-a513-2aa290eb26e8
title: 'BitLocker Initialize - NinjaOne'
title_meta: 'BitLocker Initialize - NinjaOne'
keywords: ['Bitlocker','initialization','encryption']
description: 'Automates BitLocker initialization on Windows devices using NinjaOne custom fields, including encryption method selection, key protector configuration, and secure execution with logging. '
tags: ['encryption','custom-fields','bitlocker','security']
draft: false
unlisted: false
---

## Purpose

The goal of this solution is to automates BitLocker initialization on Windows devices using NinjaOne custom fields, including encryption method selection, key protector configuration, and secure execution with logging.

## Associated Content

## Custom Fields

| Content                                             | Type                                                      | Function                                               |
|-----------------------------------------------------|-----------------------------------------------------------|--------------------------------------------------------|
| [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057) | Custom Field | Options for allowing TPM initialization and rebooting. 0 = Do not allow, 1 = Allow TPM Initialization, 2 = Allow Reboot, 3 = Allow TPM Initialization and Reboot. Allow the script to attempt initialization of TPM if necessary. |
| [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac) | Custom Field | Mark this checkbox to enable BitLocker without performing the hardware validation test. Skipping the hardware test allows BitLocker initialization to proceed on devices where hardware checks may fail or are unnecessary. |
| [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b) | Custom Field | This custom field is used to trigger the automation for BitLocker initialization. It is referenced in compound conditions to determine whether BitLocker needs to be enabled on the device. |
| [cPVAL BitLocker Initialization](/docs/16881247-a7d2-477c-9215-2bd25a936641) | Custom Field | Controls whether BitLocker initialization should run on the device. Used by automation to determine if the system should be included or excluded from BitLocker deployment. |
| [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0) | Custom Field | The encryption method that will be used to protect the target volume. Valid options are: Aes128, Aes256, XtsAes128, XtsAes256 |
| [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea) | Custom Field | Defines which BitLocker key protector method will be applied during encryption. |
| [cPVAL Mountpoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926) | Custom Field | The target volume to enable BitLocker encryption against. Should be in the format `'<driveletter>'` or `'<driveletter>:` If a path is passed, the drive of that path will be attempted to be parsed. Defaults to `$env:SystemDrive`. |
| [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47) | Custom Field | Option for specifying the file path or Active Directory account required by certain BitLocker key protector types. Examples include: `F:\Recovery`, `CONTOSO\ContosoUser`, or `CONTOSO\ContosoGroup`. |
| [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b) | Custom Field | Specifies the PIN or password required when using a BitLocker key protector that depends on user-provided authentication. Examples include simple PINs `(e.g., 123456)` or strong passwords `(e.g., Pa$sw0rD! or 123456-654321-…)` |
| [Initialize Bitlocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198) | Script | Automates BitLocker initialization on Windows via Ninja RMM custom fields. Validates parameters, sets mount point, `encryption method`, `key protector`, `PIN/password, and AD/path`, downloads a helper script, executes it, and logs output for auditing. |
| [Enable Bitlocker - Servers](/docs/a4d9dc9c-3e10-4cf4-a296-709ad9f507dd) | Compound Condition | This compound condition controls whether BitLocker initialization runs on Windows servers. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run. |
| [Enable Bitlocker - Workstations](/docs/6193f950-2266-42fd-9535-59adfe445cb5) | Compound Condition | This compound condition controls whether BitLocker initialization runs on Windows Workstations. When the BitLocker value is set to Enable, it triggers the initialization process. If set to Disable, the initialization will not run. |



## Implementation

**Create Custom Fields**

- [cPVAL Allow TPM Or Reboot](/docs/418f1b8b-14f8-492d-80fc-ea038cff6057)
- [cPVAL SkipHardwareTest](/docs/e22d7853-1e3c-403c-8ba9-b9b99ba31bac)
- [cPVAL BitLocker Enable](/docs/c959b82c-fc55-478b-87f1-b9d06cf5a29b)
- [cPVAL BitLocker Initialization](/docs/16881247-a7d2-477c-9215-2bd25a936641)
- [cPVAL EncryptionMethod](/docs/56fde7c8-f054-4b53-a3a9-d24134fb9cc0)
- [cPVAL KeyProtectorType](/docs/3378eace-ffba-4f7d-8e93-3cc37510a4ea)
- [cPVAL Mountpoint](/docs/4f9532e4-3d96-4e95-a6f5-b9a77d45c926)
- [cPVAL Path Or ADAccount](/docs/fb290c5b-cf73-4b7e-be34-ada7d3391e47)
- [cPVAL PIN Or Password](/docs/897971d9-4b4a-4554-8dd4-fc0bb324ed9b)

## Create Automation

- [Initialize Bitlocker](/docs/e3a24552-f347-4117-82f5-7afaaa3fc198)

## Create Compound Conditions

- [Enable Bitlocker - Servers](/docs/a4d9dc9c-3e10-4cf4-a296-709ad9f507dd)
- [Enable Bitlocker - Workstations](/docs/6193f950-2266-42fd-9535-59adfe445cb5)

## FAQ

**Q1. Can the BitLocker automation be executed manually without relying on the cpvalBitlockerInitialization custom field?**

A. No, the BitLocker automation cannot be executed without the cpvalBitlockerInitialization custom field. The script explicitly checks this field and proceeds only when it is set to Enable. If the field is disabled, missing, or misconfigured, the script exits without making any changes.

**Q2. Are the BitLocker-related custom fields mandatory for initialization?**

A. Yes, certain custom fields are mandatory for BitLocker initialization to function correctly. At a minimum, the following fields must be configured:

cpvalBitlockerInitialization – Must be set to Enable
cpvalEncryptionmethod – Required to define the encryption algorithm
cpvalKeyprotectortype – Required to define the key protector method

If any required field is missing or invalid, the script will stop execution.

**Q3. What happens if the encryption method is not configured or is invalid?**

A. If the encryption method is not set or contains an unsupported value, the script will fail validation and exit. Only the following values are supported:

XTSAES128
XTSAES256
AES128
AES256

This validation ensures BitLocker is configured using approved encryption standards only.

**Q4. Is the mount point required for BitLocker initialization?**

A. No, the mount point is optional.
If cpvalMountpoint is not configured, the script automatically defaults to the system drive (usually C:). This allows BitLocker to be enabled safely without explicitly specifying a drive.

**Q5. When are PIN or password values required?**

A.The cpvalPinOrPassword custom field is required only for specific key protector types such as:

TPM + PIN
TPM + PIN + Startup Key
Password

If the selected key protector requires a PIN or password and the value is not provided, the script exits with an error.

**Q6. When is the Path or AD Account custom field required?**

A. The cpvalPathOrAdaccount field is required when the selected key protector needs:

A file system path (Startup Key or Recovery Key)
An Active Directory account or group
If this value is required and not provided, the script will not continue.

**Q7. What does the cpvalAllowTpmOrReboot custom field control?**

A. This custom field controls whether the script is allowed to initialize TPM, reboot the system, or both.

Accepted values are:

0 – No TPM initialization or reboot
1 – Allow TPM initialization
2 – Allow system reboot
3 – Allow both TPM initialization and reboot
If not configured, the script defaults to 0.

**Q8. What is the purpose of the cpvalskipHardwareTest custom field?**

A. This field determines whether BitLocker hardware compatibility checks are skipped during initialization.

Accepted values are:
0 – Do not skip hardware test (default)
1 or True – Skip hardware test
Invalid or missing values automatically default to 0.

**Q9. Does the script store or expose sensitive information such as PINs or passwords?**

A. No, sensitive values such as PINs and passwords are never written to logs or output files. They are handled securely in memory using secure string conversion and are used only during BitLocker configuration.

**Q10. Where are the BitLocker execution logs stored?**

A. All logs and execution artifacts are stored under:

`C:\ProgramData\_Automation\Script\Initialize-BitLockerVolume`
These logs are used for auditing, verification, and troubleshooting purposes.

**Q11. What happens if the helper script download fails?**

A. If the helper script cannot be downloaded:

The script checks for an existing local copy. If no local copy exists, execution stops with an error. If a local copy is present, it is used to continue execution. This ensures reliability while preventing incomplete BitLocker configuration.