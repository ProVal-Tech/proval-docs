---
id: '2a93ccc8-7de0-4107-9251-747b55905734'
slug: /2a93ccc8-7de0-4107-9251-747b55905734
title: 'Bitlocker Status - Retired Computers'
title_meta: 'Bitlocker Status - Retired Computers'
keywords: ['bitlocker', 'audit', 'retired', 'computers', 'encryption', 'tpm', 'active-directory']
description: 'This document provides a comprehensive overview of the Bitlocker information displayed in the dataview for all retired computers that have executed the Bitlocker Audit script. It details the Bitlocker status of machine drives, key protectors, TPM status, and backup status in Active Directory, along with the necessary dependencies and column explanations.'
tags: ['active-directory', 'backup', 'encryption', 'security', 'tpm', 'windows']
draft: false
unlisted: false
---

## Summary

This dataview displays the Bitlocker information on all retired computers that have run the [Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a). This Bitlocker information consists of the Bitlocker status of machine drives, information about key protectors, TPM status, and the backup status in Active Directory.

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14)
- [CWM - Automate - Custom Table - plugin_proval_tpm_audit](/docs/82144ad7-4cff-4883-8389-1180052ab156)
- [SEC - Encryption - Custom Table - plugin_proval_ad_bitlocker_keyprotectors](/docs/23777e5f-2cdd-414c-9938-2293223df3ac)

## Columns

| Column                    | Explanation                                                                                                                                                                 |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                   | The name of the client of the audited agent.                                                                                                                             |
| ComputerID               | The ID of the audited agent.                                                                                                                                              |
| Computer                 | The name of the audited agent.                                                                                                                                             |
| MountPoint               | The drive letter of the audited volume.                                                                                                                                   |
| EncryptionMethod         | The encryption method used to encrypt the drive.                                                                                                                          |
| AutoUnlockEnabled        | 1 or 0 depending on whether the drive will be auto-unlocked.                                                                                                             |
| AutoUnlockKeyStored      | 1 or 0 depending on whether any external keys or related information that may be used to automatically unlock data volumes exist in the currently running operating system volume. |
| MetadataVersion          | The version of the Bitlocker metadata.                                                                                                                                     |
| VolumeStatus             | The current status that the audited volume is in.                                                                                                                         |
| ProtectionStatus         | Whether Bitlocker protection is currently On or Off.                                                                                                                      |
| LockStatus               | Whether the protected drive is currently locked.                                                                                                                          |
| EncryptionPercentage     | The percentage that the audited drive is currently encrypted. If encryption is enabled and has completed, then this should be 100.                                         |
| WipePercentage           | The percentage of the volume that has been wiped after issuing a wipe command.                                                                                            |
| VolumeType               | The type of the audited volume.                                                                                                                                           |
| KeyProtectorId          | The GUID of the key protector for the audited volume.                                                                                                                     |
| AutoUnlockProtector      | 1 or 0 depending on whether this key protector is an auto-unlock protector.                                                                                               |
| KeyProtectorType         | The type of key protector.                                                                                                                                                 |
| KeyFileName              | The file name of the key protector (if applicable).                                                                                                                       |
| RecoveryPassword         | The recovery password of the key protector (if applicable).                                                                                                              |
| KeyCertificateType       | The certificate type of the key protector (if applicable).                                                                                                               |
| Thumbprint               | The thumbprint of the key protector (if applicable).                                                                                                                     |
| LastUpdated              | The last time the volume was audited.                                                                                                                                     |
| ADBackupDetected         | True or False if the key was detected as backed up to Active Directory.                                                                                                  |
| ADBackupLastAudit        | The last time any domain controller in the target domain has been audited for key protector backups. NULL if no audit has been performed.                                   |
| MachineType              | The type of target machine (workstation or server).                                                                                                                       |
| LastContact              | The date/time of last contact with the target.                                                                                                                            |
| DaysSinceLastContact     | The number of days between now and the target's last contact.                                                                                                            |
| OperatingSystem          | The operating system of the target.                                                                                                                                       |
| LocationID               | This was required to allow the data to populate in the dataview.                                                                                                         |
| ClientID                 | This was required to allow the data to populate in the dataview.                                                                                                         |
| TpmReady                 | The TPM Ready state of the target.                                                                                                                                       |
| TpmEnabled               | The TPM Enabled state of the target.                                                                                                                                     |
| TPM Version              | The TPM Version number.                                                                                                                                                   |
| TPMOwned                 | The TPM Owned state of the target.                                                                                                                                       |
| TPMActivated             | The activation state of the TPM on the target.                                                                                                                           |


