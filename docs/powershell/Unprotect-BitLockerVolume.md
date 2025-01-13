---
id: ps-unprotect-bitlockervolume
title: 'Unprotect-BitLockerVolume'
title_meta: 'Unprotect-BitLockerVolume Command'
keywords: ['unprotect', 'bitlocker', 'volume', 'disable']
description: 'Documentation for the Unprotect-BitLockerVolume command to disable BitLocker protection on one or all volumes.'
tags: ['disk-encryption', 'recovery', 'windows']
draft: false
unlisted: false
---

## Description
Disable Bitlocker protection on one (or all) volumes.

## Requirements
PowerShell v5

## Usage
The script will validate that the volume/volumes is/are ready for decryption, and then run the `Disable-BitLocker` cmdlet against the target volumes.


Disables Bitlocker protection on the C: volume.
```powershell
.\Unprotect-BitLockerVolume.ps1 -MountPoint "C:"
```

Disables Bitlocker protection on all volumes.
```powershell
.\Unprotect-BitLockerVolume.ps1 -All
```

## Parameters
| Parameter         | Required  | Default   | Type      | Description                               |
| ----------------- | --------- | --------- | --------- | ----------------------------------------- |
| `MountPoint`      | True      |           | String    | The target volume to remove Bitlocker protection from. |
| `All`             | True      |           | Switch    | Use this switch to remove Bitlocker protection from all volumes. |

## Output

    .\Unprotect-BitLockerVolume-log.txt
    .\Unprotect-BitLockerVolume-data.txt
    .\Unprotect-BitLockerVolume-error.txt

