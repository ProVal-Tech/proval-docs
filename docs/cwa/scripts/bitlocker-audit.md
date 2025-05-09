---
id: 'd7d933e3-9668-4de9-9f44-7452198ab85a'
slug: /d7d933e3-9668-4de9-9f44-7452198ab85a
title: 'Bitlocker - Audit'
title_meta: 'Bitlocker - Audit'
keywords: ['bitlocker', 'encryption', 'tpm', 'audit', 'recovery']
description: 'This document provides a comprehensive overview of the Bitlocker Audit script, detailing its functionality in gathering Bitlocker and TPM information from target endpoints, storing it in custom tables, and creating backup files for recovery passwords.'
tags: ['backup', 'encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Summary

The Bitlocker Audit script gathers Bitlocker information from the target endpoint and stores it in the custom table [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14). It creates a TPM table named `plugin_proval_tpm_audit` and populates that table with TPM data. Additionally, it creates a backup text document with the recovery password in the LTShare for the target machine.

**File Path:** `C:/ProgramData/_Automation/Script/Bitlocker_Audit/Bitlocker_Audit.ps1`  
**File Hash (SHA256):** `4C4E524791404130BA61E50C287681010F4D9161766945C36411AEAD23588CFF`  
**File Hash (MD5):** `C8373016D05CE365885AF644F8C9773B`  

**File Path:** `C:/ProgramData/_Automation/Script/Bitlocker_Audit/TPM_Audit.ps1`  
**File Hash (SHA256):** `36BDC7BDE052953BE5DB9324F6E00730C2E0494BC74121BE690CD16117FFF058`  
**File Hash (MD5):** `B332B23E8155ACC256D9737322A7ADF1`  

*Note*: *The Bitlocker Drive Encryption feature must be enabled on servers to encrypt a drive with Bitlocker disk encryption. Encryption will not work without enabling this feature.*

## Sample Run

**First Run:** Run the script against any online Windows computer with the `Set_Environment` parameter set to `1` to create the custom tables used by the solution.  
![First Run](../../../static/img/docs/d7d933e3-9668-4de9-9f44-7452198ab85a/image_1.webp)

**Regular Execution:**  
![Regular Execution](../../../static/img/docs/d7d933e3-9668-4de9-9f44-7452198ab85a/image_2.webp)

## Dependencies

- PowerShell v5
- Bitlocker module for PowerShell

## User Parameters

| Name              | Example | Required                              | Description                                                                                                                                               |
|-------------------|---------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Set_Environment    | 1       | For First Run (After Updating the script) | Run the script against any online Windows computer with the `Set_Environment` parameter set to `1` to create the custom tables used by the solution. |

## EDFs

| Name                   | Level    | Type   | Editable | Description                                                                                                                |
|------------------------|----------|--------|----------|----------------------------------------------------------------------------------------------------------------------------|
| Bitlocker Recovery Key  | Computer | Text   | No       | This stores the value of the "Recovery Password" of the C: volume whose key protector type is "RecoveryPassword".        |
| Bitlocker Enabled       | Computer | Flag   | No       | This is 'checked' if the protection status of the system drive shows true.                                             |
| TPM Present             | Computer | Flag   | No       | This marks the TPM Present flag if the 'TPM Present' is enabled for the TPM chipset audited by the "Get-TPM".           |

#### Variables

| Name                | Description                                                  |
|---------------------|--------------------------------------------------------------|
| ProjectName         | Bitlocker_Audit                                             |
| WorkingDirectory     | `C:/ProgramData/_automation/script/Bitlocker_Audit`        |
| PsOutBitlocker      | Output of the PowerShell script performing Bitlocker Audit  |
| PsOutTPM            | Output of the PowerShell script performing TPM Audit        |
| Count               | Iteration used for the loop generating Recovery Key Backup File for each drive |
| DriveLetter         | Drive letter with ":" removed from the end                  |
| FilePath            | `C:/ProgramData/_automation/script/Bitlocker_Audit/Bitlocker_Recovery_Key_@DriveLetter@.txt` |
| Content             | The content of the created backup file                       |

## Output

- Custom table
- Dataview
- Backup file under LTShare at `LTShare/Uploads/<ClientName>/<ComputerName (Computerid)>`