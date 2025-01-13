---
id: 'cwa-bitlocker-configuration'
title: 'Bitlocker Configuration Audit'
title_meta: 'Bitlocker Configuration Audit for Target Machines'
keywords: ['bitlocker', 'encryption', 'audit', 'configuration', 'security']
description: 'This document provides details on how to store and audit Bitlocker configuration information on target machines, including the various parameters and statuses related to Bitlocker encryption.'
tags: ['encryption', 'audit', 'security', 'configuration', 'windows']
draft: false
unlisted: false
---
## Purpose

Stores information about Bitlocker configuration on target machines.

## Dependencies

[SEC - Encryption - Script - Bitlocker - Audit](https://proval.itglue.com/DOC-5078775-8943478)

## Tables

### plugin_proval_bitlocker_audit

| Column                     | Type      | Explanation                                                                                                                     |
|---------------------------|-----------|-------------------------------------------------------------------------------------------------------------------------------|
| ComputerID                | INT       | The ID of the audited endpoint.                                                                                               |
| MountPoint                | VARCHAR   | The drive letter of the audited volume.                                                                                       |
| EncryptionMethod          | VARCHAR   | The encryption method used to encrypt the drive.                                                                              |
| AutoUnlockEnabled         | TINYINT   | 1 or 0 depending on if the drive will be auto-unlocked.                                                                      |
| AutoUnlockKeyStored       | TINYINT   | 1 or 0 depending on whether any external keys or related information that may be used to automatically unlock data volumes exist in the currently running operating system volume. |
| MetadataVersion           | INT       | The version of the Bitlocker metadata.                                                                                        |
| VolumeStatus              | VARCHAR   | The current status that the audited volume is in.                                                                            |
| ProtectionStatus          | VARCHAR   | Whether Bitlocker protection is currently On or Off.                                                                         |
| LockStatus                | VARCHAR   | Whether the protected drive is currently locked.                                                                              |
| EncryptionPercentage      | INT       | The percentage that the audited drive is currently encrypted. If encryption is enabled and has completed, then this should be 100. |
| WipePercentage            | INT       | The percentage of the volume that has been wiped after issuing a wipe command.                                               |
| VolumeType                | VARCHAR   | The type of the audited volume.                                                                                               |
| KeyProtectorId            | VARCHAR   | The GUID of the key protector for the audited volume.                                                                         |
| AutoUnlockProtector       | TINYINT   | 1 or 0 depending on if this key protector is an auto-unlock protector.                                                       |
| KeyProtectorType          | VARCHAR   | The type of key protector.                                                                                                    |
| KeyFileName               | VARCHAR   | The file name of the key protector (if applicable).                                                                          |
| RecoveryPassword          | VARCHAR   | The recovery password of the key protector (if applicable).                                                                   |
| KeyCertificateType        | VARCHAR   | The certificate type of the key protector (if applicable).                                                                    |
| Thumbprint                | VARCHAR   | The thumbprint of the key protector (if applicable).                                                                         |
| LastUpdated               | DATETIME  | The last time the volume was audited.                                                                                         |



