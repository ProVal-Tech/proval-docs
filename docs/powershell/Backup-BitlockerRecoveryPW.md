---
id: ps-backup-bitlockerrecoverypw
title: 'Backup-BitlockerRecoveryPW'
title_meta: 'Backup-BitlockerRecoveryPW Command'
keywords: ['bitlocker', 'recovery', 'password', 'backup']
description: 'Documentation for the Backup-BitlockerRecoveryPW command to backup BitLocker recovery passwords.'
tags: ['active-directory', 'backup', 'recovery']
draft: false
unlisted: false
---

## Description
This script will cycle through all volumes and backup the recovery password for any drive that has an associated Recovery Password.

## Requirements
- PowerShell v5
- Target must be domain joined

## Usage
1. Starts the loop through all Bitlocker volumes.
2. Attempts to Backup the Recovery Password to AD for each volume, if one exists.
3. Logs any failures to the error log.


```powershell
.\Backup-BitlockerRecoveryPW.ps1
```
Attempts to back up any Recovery Password type key protectors to Active Directory.

## Output
    Microsoft.BitLocker.Structures.BitLockerVolume

    .\Backup-BitlockerRecoveryPW-log.txt
    .\Backup-BitlockerRecoveryPW-error.txt

