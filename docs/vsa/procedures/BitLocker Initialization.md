---
id: '292daf43-dff9-418f-982f-56f08ac8d016'
title: 'BitLocker Volume Initialization Procedures'
title_meta: 'BitLocker Volume Initialization Procedures'
keywords: ['bitlocker', 'encryption', 'tpm', 'protector', 'security']
description: 'This document outlines a suite of 9 agent procedures designed for the initialization of BitLocker volumes using various protection methods. Each procedure is detailed with examples and logs to illustrate functionality and outcomes during execution.'
tags: ['backup', 'encryption', 'security', 'setup', 'windows']
draft: false
unlisted: false
---

## Summary

A suite of 9 agent procedures which implement agnostic content [SEC - Encryption - Agnostic - Initialize-BitLockerVolume](<../../powershell/Initialize-BitLockerVolume.md>).

All required parameters are prompted and explained at script runtime.

---

## Example Agent Procedure Log

| Time                     | Procedure Description                                             | Status                                                                                                                  | User                                |
|--------------------------|------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| 5:35:13 pm 13-Dec-22     | BitLocker Volume Initialization - TPM protector                  | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:35:13 pm 13-Dec-22     | BitLocker Volume Initialization - TPM-0004                       | ERROR: 2022-12-13 17:35:09 ERROR: TPM is not present on this system.                                                   | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | BitLocker Volume Initialization - TPM-0002                       | Log: 2022-12-13 17:35:02 INIT ----------------------------------------------- 2022-12-13 17:35:02 INIT Initialize-BitLockerVolume 2022-12-13 17:35:02 INIT System: DEV 2022-12-13 17:35:02 INIT User: DEV$ 2022-12-13 17:35:02 INIT OS Bitness: AMD64 2022-12-13 17:35:02 INIT PowerShell Bitness: 64 2022-12-13 17:35:02 INIT PowerShell Version: 5 2022-12-13 17:35:02 INIT ----------------------------------------------- 2022-12-13 17:35:03 LOG: PowerShell is already at or above version 5. 2022-12-13 17:35:07 LOG: Checking BitLocker status of drive 'C:'. 2022-12-13 17:35:08 LOG: BitLocker protection is not currently enabled on drive 'C:'. 2022-12-13 17:35:09 ERROR: TPM is not present on this system. | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | BitLocker Volume Initialization - TPM protector                  | Raw PS1 Data: 1                                                                                                      | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)              | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:35:11 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0016         | PowerShell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks           |
| 5:35:11 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0016         | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0011         | Executing 64-bit PowerShell command as System: \"\" -command \"%ProgramData%//_automation//AgentProcedure//BitLockerVolumeInit//Initialize-BitLockerVolume.ps1 -TpmProtector -MountPoint C: -EncryptionMethod Aes128 -AllowRestart -AllowTpmInit\" >\"c://provaltech//psoutputtmp.txt\" | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0013         | Sending output to global variable.                                                                                   | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0008         | Custom commands detected as %ProgramData%//_automation//AgentProcedure//BitLockerVolumeInit//Initialize-BitLockerVolume.ps1 -TpmProtector -MountPoint C: -EncryptionMethod Aes128 -AllowRestart -AllowTpmInit | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0003         | No PowerShell file variable detected.                                                                                 | provaltech.com/dan.hicks           |
| 5:34:56 pm 13-Dec-22     | Execute PowerShell Command (64-bit, Run As System)-0002         | PowerShell is present.                                                                                                 | provaltech.com/dan.hicks           |
| 5:34:52 pm 13-Dec-22     | Execute PowerShell Command                                          | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:34:51 pm 13-Dec-22     | Execute PowerShell Command-0011                                   | PowerShell command completed!                                                                                         | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute PowerShell Command-0011                                   | Executing PowerShell \"\" -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitLockerVolumeInit\" \"\" | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute PowerShell Command-0010                                   | Not sending output to variable.                                                                                       | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute PowerShell Command-0008                                   | New command variable is: -Command \"New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitLockerVolumeInit\" | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute PowerShell Command-0008                                   | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitLockerVolumeInit | provaltech.com/dan.hicks           |
| 5:34:43 pm 13-Dec-22     | Execute PowerShell Command-0002                                   | PowerShell is present.                                                                                                 | provaltech.com/dan.hicks           |
| 5:34:32 pm 13-Dec-22     | Run Now - BitLocker Volume Initialization - TPM protector         | Admin provaltech.com/dan.hicks scheduled procedure Run Now - BitLocker Volume Initialization - TPM protector to run at Dec 13 2022 5:34 PM |                                     |

---

## Dependencies

[SEC - Encryption - Agnostic - Initialize-BitLockerVolume](<../../powershell/Initialize-BitLockerVolume.md>)

---

## Procedure List

- BitLocker Volume Initialization - BitLocker Volume Initialization - TPM Protector
  - Protect the encrypted drive with only the TPM chip.
- BitLocker Volume Initialization - TPM and PIN Protector
  - Protect the encrypted drive with the TPM chip and a PIN.
- BitLocker Volume Initialization - TPM and Startup Key Protector
  - Protect the encrypted drive with the TPM chip and a startup key.
- BitLocker Volume Initialization - TPM, Startup Key, and PIN Protector
  - Protect the encrypted drive with the TPM chip, a PIN, and a startup key.
- BitLocker Volume Initialization - Password Protector
  - Protect the encrypted drive with a custom password.
- BitLocker Volume Initialization - Startup Key Protector
  - Protect the encrypted drive with a startup key.
- BitLocker Volume Initialization - Recovery Key Protector
  - Protect the encrypted drive with a recovery key.
- BitLocker Volume Initialization - Recovery Password Protector
  - Protect the encrypted drive with a recovery password.
- BitLocker Volume Initialization - AD Account or Group Protector
  - Protect the encrypted drive with an Active Directory Account or Group.

---

## Output

```
    ./Initialize-BitLockerVolume-log.txt
    ./Initialize-BitLockerVolume-data.txt
    ./Initialize-BitLockerVolume-error.txt
    Agent Procedure Log
```

