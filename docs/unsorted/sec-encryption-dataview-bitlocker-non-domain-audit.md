---
id: '95512be1-f340-42dc-b0c2-885396526850'
slug: /95512be1-f340-42dc-b0c2-885396526850
title: 'SEC- Encryption - Dataview - Bitlocker - Non Domain - Audit'
title_meta: 'SEC- Encryption - Dataview - Bitlocker - Non Domain - Audit'
keywords: ['bitlocker', 'audit', 'encryption', 'active-directory', 'backup', 'security']
description: 'This document provides a comprehensive Bitlocker audit report, detailing the encryption status and key protector backups for each audited volume. It includes SQL representation and dependencies for accurate data retrieval and analysis.'
tags: ['active-directory', 'backup', 'encryption', 'security', 'windows']
draft: false
unlisted: true
---

## Summary

This document displays information from the table [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14), which is filled by [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a). Additionally, it provides information about the Active Directory backup status of each key protector.

## Dependencies

- [SEC - Encryption - Custom Table - plugin_proval_bitlocker_audit](/docs/bb3eaac8-80f6-43b9-90f1-75886c06bf14)
- [SEC - Encryption - Script - Bitlocker - Audit](/docs/d7d933e3-9668-4de9-9f44-7452198ab85a)
- [SEC - Encryption - Custom Table - plugin_proval_ad_bitlocker_keyprotectors](/docs/23777e5f-2cdd-414c-9938-2293223df3ac)
- [SEC - Encryption - Script - Bitlocker - Audit AD Key Protector Backups](/docs/d533538b-8b00-425e-849f-434518296b2d)

## Columns

| Column                                              | Description                                                                                                                                                        |
|-----------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Client                                             | The name of the client of the audited agent.                                                                                                                    |
| Computer                                           | The name of the audited agent.                                                                                                                                  |
| MountPoint                                         | The drive letter of the audited volume.                                                                                                                          |
| EncryptionMethod                                   | The encryption method used to encrypt the drive.                                                                                                                |
| AutoUnlockEnabled                                  | 1 or 0 depending on whether the drive will be auto-unlocked.                                                                                                     |
| AutoUnlockKeyStored                                | 1 or 0 depending on whether any external keys or related information that may be used to automatically unlock data volumes exist in the currently running operating system volume. |
| MetadataVersion                                    | The version of the Bitlocker metadata.                                                                                                                          |
| VolumeStatus                                       | The current status of the audited volume.                                                                                                                      |
| ProtectionStatus                                   | Indicates whether Bitlocker protection is currently On or Off.                                                                                                   |
| LockStatus                                         | Indicates whether the protected drive is currently locked.                                                                                                        |
| EncryptionPercentage                               | The percentage of the audited drive that is currently encrypted. If encryption is enabled and has completed, this should be 100.                                 |
| WipePercentage                                     | The percentage of the volume that has been wiped after issuing a wipe command.                                                                                   |
| VolumeType                                         | The type of the audited volume.                                                                                                                                  |
| KeyProtectorGUID                                   | The GUID of the key protector for the audited volume.                                                                                                            |
| AutoUnlockProtector                                | 1 or 0 depending on whether this key protector is an auto-unlock protector.                                                                                      |
| KeyProtectorType                                   | The type of key protector.                                                                                                                                       |
| KeyFileName                                        | The file name of the key protector (if applicable).                                                                                                             |
| RecoveryPassword                                    | The recovery password of the key protector (if applicable).                                                                                                      |
| KeyCertificateType                                 | The certificate type of the key protector (if applicable).                                                                                                      |
| Thumbprint                                         | The thumbprint of the key protector (if applicable).                                                                                                            |
| LastUpdated                                        | The last time the volume was audited.                                                                                                                            |
| ADBackupDetected                                   | True or False indicating if the key was detected as backed up to Active Directory.                                                                                |
| ADBackupLastAudit                                  | The last time any domain controller in the target domain has been audited for key protector backups. NULL if no audit has been performed.                        |

## SQL Representation

```sql
SELECT
    dt.Client,
    dt.ComputerID,
    dt.Computer,
    dt.MountPoint,
    dt.EncryptionMethod,
    dt.AutoUnlockEnabled,
    dt.AutoUnlockKeyStored,
    dt.MetadataVersion,
    dt.VolumeStatus,
    dt.ProtectionStatus,
    dt.LockStatus,
    dt.EncryptionPercentage,
    dt.WipePercentage,
    dt.VolumeType,
    dt.KeyProtectorId,
    dt.AutoUnlockProtector,
    dt.KeyProtectorType,
    dt.KeyFileName,
    dt.RecoveryPassword,
    dt.KeyCertificateType,
    dt.Thumbprint,
    dt.LastUpdated,
    dt.ADBackupDetected,
    dt.ADBackupLastAudit
FROM (
    SELECT DISTINCT
        cl.Name AS Client,
        c.ComputerID AS ComputerID,
        c.Name AS Computer,
        b.MountPoint AS MountPoint,
        b.EncryptionMethod AS EncryptionMethod,
        b.AutoUnlockEnabled AS AutoUnlockEnabled,
        b.AutoUnlockKeyStored AS AutoUnlockKeyStored,
        b.MetadataVersion AS MetadataVersion,
        b.VolumeStatus AS VolumeStatus,
        b.ProtectionStatus AS ProtectionStatus,
        b.LockStatus AS LockStatus,
        b.EncryptionPercentage AS EncryptionPercentage,
        b.WipePercentage AS WipePercentage,
        b.VolumeType AS VolumeType,
        b.KeyProtectorId AS KeyProtectorId,
        b.AutoUnlockProtector AS AutoUnlockProtector,
        b.KeyProtectorType AS KeyProtectorType,
        b.KeyFileName AS KeyFileName,
        b.RecoveryPassword AS RecoveryPassword,
        b.KeyCertificateType AS KeyCertificateType,
        b.Thumbprint AS Thumbprint,
        b.LastUpdated AS LastUpdated,
        IF(kp.RecoveryGUID IS NULL, 'False', 'True') AS ADBackupDetected,
        (
            SELECT `Timestamp`
            FROM plugin_proval_ad_bitlocker_keyprotectors
            WHERE ComputerID IN (
                SELECT ComputerID
                FROM computers
                WHERE ClientID = c.ClientID
            ) 
            ORDER BY `Timestamp` DESC LIMIT 1
        ) AS ADBackupLastAudit
    FROM computers c
        LEFT JOIN plugin_proval_bitlocker_audit b ON c.ComputerID = b.ComputerID
        LEFT JOIN plugin_proval_ad_bitlocker_keyprotectors kp ON b.KeyProtectorId = CONCAT('{', kp.RecoveryGUID, '}')
        JOIN clients cl ON c.ClientID = cl.ClientID
) dt
```