---
id: '7eecbf0c-2b91-4454-ba5c-e1b9605f07fc'
title: 'Backup-BitlockerRecoveryPW'
title_meta: 'Backup-BitlockerRecoveryPW'
keywords: ['bitlocker', 'recovery', 'password', 'backup']
description: 'Documentation for the Backup-BitlockerRecoveryPW command to backup BitLocker recovery passwords.'
tags: ['active-directory', 'backup', 'recovery']
draft: false
unlisted: false
---

## Description
This script cycles through all volumes and backs up the recovery password for any drive that has an associated Recovery Password.

## Requirements
- PowerShell v5
- Target must be domain-joined

## Usage
1. Starts the loop through all BitLocker volumes.
2. Attempts to back up the Recovery Password to Active Directory for each volume, if one exists.
3. Logs any failures to the error log.

```powershell
.\Backup-BitlockerRecoveryPW.ps1
```
Attempts to back up any Recovery Password type key protectors to Active Directory.

## Output
- `Microsoft.BitLocker.Structures.BitLockerVolume`
- `.\Backup-BitlockerRecoveryPW-log.txt`
- `.\Backup-BitlockerRecoveryPW-error.txt`



