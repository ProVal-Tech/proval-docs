---
id: '82144ad7-4cff-4883-8389-1180052ab156'
slug: /82144ad7-4cff-4883-8389-1180052ab156
title: 'plugin_proval_tpm_audit'
title_meta: 'plugin_proval_tpm_audit'
keywords: ['bitlocker', 'tpm', 'audit', 'encryption', 'security']
description: 'This document provides a detailed overview of the Bitlocker TPM Audit Table populated by the SEC - Encryption - Script - Bitlocker - Audit script. It outlines the structure and dependencies of the table, including the various properties captured from the Get-TPM command related to TPM management.'
tags: ['database', 'encryption', 'security', 'windows']
draft: false
unlisted: false
---

## Purpose

This table will be populated by the [SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>) script.  
It holds all data from the Get-TPM command.

## Dependencies

[SEC - Encryption - Script - Bitlocker - Audit](<../scripts/Bitlocker - Audit.md>)

## Tables

#### plugin_proval_tpm_audit

| Column                  | Type    | Explanation                                                         |
|------------------------|---------|---------------------------------------------------------------------|
| ComputerID             | INT     | Primary key - Holds target computer ID.                             |
| ManufacturerID         | INT     | Primary key - Holds the manufacturer ID for the TPM module.        |
| AutoProvisioning       | VARCHAR | Holds the value of the Autoprovisioning property of Get-TPM.      |
| LockedOut              | VARCHAR | Holds the value of the LockedOut property of Get-TPM.              |
| LockOutCount           | VARCHAR | Holds the value of the LockOutCount property of Get-TPM.           |
| LockOutHealTime        | VARCHAR | Holds the value of the LockOutHealTime property of Get-TPM.        |
| LockOutMax             | VARCHAR | Holds the value of the LockOutMax property of Get-TPM.             |
| ManagedAuthLevel       | VARCHAR | Holds the value of the ManagedAuthLevel property of Get-TPM.       |
| ManufacturerIDTxt      | VARCHAR | Holds the value of the ManufacturerIDTxt property of Get-TPM.      |
| ManufacturerVersion     | VARCHAR | Holds the value of the ManufacturerVersion property of Get-TPM.    |
| ManufacturerVersionFull20 | VARCHAR | Holds the value of the ManufacturerVersionFull20 property of Get-TPM. |
| OwnerAuth              | VARCHAR | Holds the value of the OwnerAuth property of Get-TPM.              |
| OwnerClearDisabled     | VARCHAR | Holds the value of the OwnerClearDisabled property of Get-TPM.     |
| RestartPending         | VARCHAR | Holds the value of the RestartPending property of Get-TPM.         |
| SelfTest               | VARCHAR | Holds the value of the SelfTest property of Get-TPM.               |
| TpmActivated           | VARCHAR | Holds the value of the TpmActivated property of Get-TPM.           |
| TpmEnabled             | VARCHAR | Holds the value of the TpmEnabled property of Get-TPM.             |
| TpmOwned               | VARCHAR | Holds the value of the TpmOwned property of Get-TPM.               |
| TpmPresent             | VARCHAR | Holds the value of the TpmPresent property of Get-TPM.             |
| TpmReady               | VARCHAR | Holds the value of the TpmReady property of Get-TPM.               |


