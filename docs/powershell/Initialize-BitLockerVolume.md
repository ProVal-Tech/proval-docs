---
id: ps-initialize-bitlockervolume
title: 'Initialize-BitLockerVolume'
title_meta: 'Initialize-BitLockerVolume Command'
keywords: ['initialize', 'bitlocker', 'volume', 'encryption']
description: 'Documentation for the Initialize-BitLockerVolume command to encrypt a drive with BitLocker disk encryption.'
tags: ['disk-encryption', 'security', 'windows']
draft: false
unlisted: false
---
## Description
Encrypts a drive with Bitlocker disk encryption.

## Requirements
PowerShell v5

## Usage
The script takes multiple switches which determines the type of encryption that will be implemented. The script will first validate the following items:

- If the protection status of the drive is currently "On" then the script will print the current status and encryption percentage and exit.
- If the Bitlocker volume is currently suspended, then protection will be resumed.
- If the Bitlocker volume currently has an encryption or decryption process running against it, then it will exit and prompt the operator to re-run the script after the process finishes.
- If all of the above checks pass and there is still a key protector (or multiple key protectors) installed then it/they will be removed.

The script will then check for an existing TPM chip.

If a TPM chip exists, then the script will validate that the chip is initialized. If `-AllowTPMInit` is passed, the chip will be initialized if it is not already. If `-AllowRestart` was passed, then the computer will be shut down or rebooted based on the requirements of the TPM initialization.

If a TPM chip is not found and `-TpmProtector`, `-TpmAndPinProtector`, `-TpmAndStartupKeyProtector`, or `-TpmAndPinAndStartupKeyProtector` were passed, then the script will exit on error.

Otherwise, if a TPM chip is not found, the script will continue. The drive will be encrypted based on the passed switches.

If a recovery password was installed, then an attempt to back it up the AD will be made.

If `-AllowRestart` was passed, then the computer will be rebooted to complete the encryption process if `-SkipHardwareTest` was not passed.


Encrypts the E: volume with a password protector using Aes128. Will initialize TPM if needed and reboot the computer after completion.
```powershell
.\Initialize-BitLockerVolume.ps1 -MountPoint E: -EncryptionMethod Aes128 -PasswordProtector -Password (ConvertTo-SecureString -String 'P@$sw0rD!' -AsPlainText -Force) -AllowTPMInit -AllowRestart
```

Encrypts the $env:SystemDrive volume with a Tpm protector using Aes256. if TPM is not initialized, the script will exit. Will reboot the computer after completion.
```powershell
.\Initialize-BitLockerVolume.ps1 -Tpm -AllowRestart
```

Encrypts the $env:SystemDrive volume with a Startup key protector using Aes256 to E:\Recovery. Will initialize TPM if needed. Will reboot the computer after completion.
```powershell
.\Initialize-BitLockerVolume.ps1 -StartupKeyProtector -Path E:\Recovery -AllowTPMInit -AllowRestart
```

## Parameters
| Parameter                         | Required  | Default            | Type         | Description                               |
| -----------------                 | --------- | ---------          | ---------    | ----------------------------------------- |
| `MountPoint`                      | False     | `$env:SystemDrive` | String       | The target volume to enable Bitlocker encryption against. Should be in the format '\<driveletter\>' or '\<driveletter\>:'. If a path is passed, the drive of that path will attempted to be parsed. Defaults to `$env:SystemDrive`. |
| `EncryptionMethod`                | False     | "Aes256"           | String       | The method of encryption to use for Bitlocker. Valid options are Aes128, Aes256, XtsAes128, or XtsAes256. Defaults to Aes256. |
| `AllowTPMInit`                    | False     | False              | Switch       | Allow the script to attempt initilization of TPM is necessary. Will require a reboot if TPM needs to be initilized. |
| `AllowRestart`                    | False     | False              | Switch       | Allow the script to automatically restart or shutdown the machine. This can happen on initilization of TPM or successful encryption of a volume. |
| `TpmProtector`                    | True      |                    | Switch       | Protect the encrypted drive with only the TPM chip. |
| `TpmAndPinProtector`              | True      |                    | Switch       | Protect the encrypted drive with the TPM chip and a PIN. Requires the -Pin parameter to be passed. |
| `TpmAndStartupKeyProtector`       | True      |                    | Switch       | Protect the encrypted drive with the TPM chip and a startup key. Requires the -Path parameter to be passed. |
| `TpmAndPinAndStartupKeyProtector` | True      |                    | Switch       | Protect the encrypted drive with the TPM chip, a PIN, and a startup key. Requires the -Pin and -Path parameters to be passed. |
| `PasswordProtector`               | True      |                    | Switch       | Protects the encrypted drive with a custom password. Requires the -Password parameter to be passed. |
| `StartupKeyProtector`             | True      |                    | Switch       | Protect the encrypted drive with a startup key. Requires the -Path parameter to be passed. |
| `RecoveryKeyProtector`            | True      |                    | Switch       | Protect the encrypted drive with a recovery key. Requires the -Path parameter to be passed. |
| `RecoveryPasswordProtector`       | True      |                    | Switch       | Protect the encrypted drive with a recovery password. If the -RecoveryPassword parameter is not passed, then the script will generate one automatically. |
| `AdAccountOrGroupProtector`       | True      |                    | Switch       | Protect the encrypted drive with an Active Directory Account or Group. Requires the -AdAccountOrGroup parameter to be passed. |
| `Pin`                             | True      |                    | SecureString | The PIN to use in conjunction with TPM to protect the encrypted drive. |
| `Path`                            | True      |                    | String       | The path to the external drive to save the startup or recovery key to. |
| `Password`                        | True      |                    | SecureString | The password to set on the encrypted drive. |
| `RecoveryPassword`                | False     |                    | String       | The recovery password to set on the encrypted drive. Must be in the following format: 000000-000000-000000-000000-000000-000000-000000-000000 |
| `AdAccountOrGroup`                | True      |                    | String       | The Active Directory Account or Group to protect the encrypted drive with. |
| `SkipHardwareTest`                | False     |                    | Switch       | Use this switch to skip the hardware test for Bitlocker, removing the need for a reboot of the system before encryption. |

## Output
    .\Initialize-BitLockerVolume-log.txt
    .\Initialize-BitLockerVolume-data.txt
    .\Initialize-BitLockerVolume-error.txt

