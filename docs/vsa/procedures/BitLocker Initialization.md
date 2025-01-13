---
id: 'vsa-bitlocker-volume-initialization'
title: 'Bitlocker Volume Initialization Procedures'
title_meta: 'Bitlocker Volume Initialization Procedures'
keywords: ['bitlocker', 'encryption', 'tpm', 'protector', 'security']
description: 'This document outlines a suite of 9 agent procedures designed for the initialization of BitLocker volumes using various protection methods. Each procedure is detailed with examples and logs to illustrate functionality and outcomes during execution.'
tags: ['encryption', 'security', 'windows', 'setup', 'backup']
draft: false
unlisted: false
---
## Summary

A Suite of 9 Agent Procedures which implement agnostic content [SEC - Encryption - Agnostic - Initialize-BitLockerVolume](https://proval.itglue.com/DOC-5078775-8931801)

All required parameters are prompted and explained at script runtime.

---

## Example Agent Procedure Log

| Time                     | Procedure Description                                             | Status                                                                                                                  | User                                |
|--------------------------|------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| 5:35:13 pm 13-Dec-22     | Bitlocker Volume Initialization - TPM protector                  | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:35:13 pm 13-Dec-22     | Bitlocker Volume Initialization - TPM-0004                       | ERROR: 2022-12-13 17:35:09 ERROR TPM is not present on this system.                                                   | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | Bitlocker Volume Initialization - TPM-0002                       | Log: 2022-12-13 17:35:02 INIT ----------------------------------------------- 2022-12-13 17:35:02 INIT Initialize-BitlockerVolume 2022-12-13 17:35:02 INIT System: DEV 2022-12-13 17:35:02 INIT User: DEV$ 2022-12-13 17:35:02 INIT OS Bitness: AMD64 2022-12-13 17:35:02 INIT PowerShell Bitness: 64 2022-12-13 17:35:02 INIT PowerShell Version: 5 2022-12-13 17:35:02 INIT ----------------------------------------------- 2022-12-13 17:35:03 LOG PowerShell is already at or above version 5. 2022-12-13 17:35:07 LOG Checking BitLocker status of drive 'C:'. 2022-12-13 17:35:08 LOG BitLocker protection is not currently enabled on drive 'C:'. 2022-12-13 17:35:09 ERROR TPM is not present on this system. | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | Bitlocker Volume Initialization - TPM protector                  | Raw PS1 Data: 1                                                                                                      | provaltech.com/dan.hicks           |
| 5:35:12 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)              | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:35:11 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0016         | Powershell command complete. Results returned to global variable #global:psresult# and saved in Agent's Documents tab of server. | provaltech.com/dan.hicks           |
| 5:35:11 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0016         | Informational: GetFile command overwrote the server file C://Kaseya//UserProfiles//229175768944442//GetFiles//..//docs//psoutput.txt with the new contents from c://provaltech//psoutput.txt in THEN step 3. | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0011         | Executing 64-bit Powershell command as System: "" -command "%ProgramData%//_automation//AgentProcedure//BitlockerVolumeInit//Initialize-BitlockerVolume.ps1 -TpmProtector -MountPoint C: -EncryptionMethod Aes128 -AllowRestart -AllowTpmInit" >"c://provaltech//psoutputtmp.txt" | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0013         | Sending output to global variable.                                                                                   | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0008         | Custom commands detected as %ProgramData%//_automation//AgentProcedure//BitlockerVolumeInit//Initialize-BitlockerVolume.ps1 -TpmProtector -MountPoint C: -EncryptionMethod Aes128 -AllowRestart -AllowTpmInit | provaltech.com/dan.hicks           |
| 5:35:00 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0003         | No powershell file variable detected.                                                                                 | provaltech.com/dan.hicks           |
| 5:34:56 pm 13-Dec-22     | Execute Powershell Command (64-bit, Run As System)-0002         | Powershell is present.                                                                                                 | provaltech.com/dan.hicks           |
| 5:34:52 pm 13-Dec-22     | Execute Powershell Command                                          | Success THEN                                                                                                           | provaltech.com/dan.hicks           |
| 5:34:51 pm 13-Dec-22     | Execute Powershell Command-0011                                   | Powershell command completed!                                                                                         | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute Powershell Command-0011                                   | Executing powershell "" -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitlockerVolumeInit" "" | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute Powershell Command-0010                                   | Not sending output to variable.                                                                                       | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute Powershell Command-0008                                   | New command variable is: -Command "New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitlockerVolumeInit" | provaltech.com/dan.hicks           |
| 5:34:47 pm 13-Dec-22     | Execute Powershell Command-0008                                   | Custom commands detected as New-Item -Type Directory -Path $env:ProgramData//_automation//AgentProcedure -name BitlockerVolumeInit | provaltech.com/dan.hicks           |
| 5:34:43 pm 13-Dec-22     | Execute Powershell Command-0002                                   | Powershell is present.                                                                                                 | provaltech.com/dan.hicks           |
| 5:34:32 pm 13-Dec-22     | Run Now - Bitlocker Volume Initialization - TPM protector         | Admin provaltech.com/dan.hicks scheduled procedure Run Now - Bitlocker Volume Initialization - TPM protector to run at Dec 13 2022 5:34PM |                                     |

---

## Dependencies

[SEC - Encryption - Agnostic - Initialize-BitLockerVolume](https://proval.itglue.com/DOC-5078775-8931801)

---

## Procedure List

- Bitlocker Volume Initialization - Bitlocker Volume Initialization - TPM Protector
  - Protect the encrypted drive with only the TPM chip.
- Bitlocker Volume Initialization - TPM and Pin Protector
  - Protect the encrypted drive with the TPM chip and a PIN.
- Bitlocker Volume Initialization - TPM and Startup Key Protector
  - Protect the encrypted drive with the TPM chip and a startup key.
- Bitlocker Volume Initialization - TPM, Startup Key, and Pin Protector
  - Protect the encrypted drive with the TPM chip, a PIN, and a startup key.
- Bitlocker Volume Initialization - Password Protector
  - Protects the encrypted drive with a custom password.
- Bitlocker Volume Initialization - Startup Key Protector
  - Protect the encrypted drive with a startup key.
- Bitlocker Volume Initialization - Recovery Key Protector
  - Protect the encrypted drive with a recovery key.
- Bitlocker Volume Initialization - Recovery Password Protector
  - Protect the encrypted drive with a recovery password.
- Bitlocker Volume Initialization - AD Account or Group Protector
  - Protect the encrypted drive with an Active Directory Account or Group.

---

## Output

```
    ./Initialize-BitLockerVolume-log.txt
    ./Initialize-BitLockerVolume-data.txt
    ./Initialize-BitLockerVolume-error.txt
    Agent Procedure Log
```




