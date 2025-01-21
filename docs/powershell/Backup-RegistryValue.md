---
id: '2e38bff4-a727-4c7e-8c3b-ccf8eee85891'
title: 'Backup-RegistryValue'
title_meta: 'Backup-RegistryValue'
keywords: ['backup', 'registry', 'windows', 'administration', 'copy']
description: 'This document provides an overview of a script that creates a backup of a specified registry item either specifically or recursively to a designated backup location in the Windows registry. The script requires administrative rights and ensures that the backup is identical to the original key.'
tags: ['backup', 'registry', 'windows']
draft: false
unlisted: false
---

## Overview

This script will **create a backup of a registry item either specifically or recursively to `HKLM:\Software\_automation\RegistryBackup`**.

For instance, if backing up the key **Windowsversion found in** **`HKLM:\Software\_automation\WindowsUpdate`**, the backed-up key will be found in **`HKLM:\SOFTWARE\_automation\RegistryBackup\HKLM\Software\_automation\WindowsUpdate\Windowsversion`**.

## Requirements

This script requires administrative rights to read and write in the registry.

## Process

1. Gets needed information for the key properties (or keys and all associated properties) being backed up.
2. Formats a new path for the backup using the standard `HKLM:\Software\_automation\RegistryBackup` (HKLM, HKCU, HKU, etc.) followed by the remainder of the given origin path.
3. Saves a copy of that key to the new location.
4. Verifies that the copied key is identical to the original key.

## Payload Usage

```
Backup-RegistryValue.ps1 -Path 'HKLM:\Software\_automation\WindowsUpdate' -KeyName Windowsversion
```
Creates a copy of the key `HKLM:\Software\_automation\WindowsUpdate\Windowsversion` to `HKLM:\SOFTWARE\_automation\RegistryBackup\HKLM\Software\_automation\WindowsUpdate\Windowsversion`.

```
Backup-RegistryValue.ps1 'HKLM:\SOFTWARE\Microsoft\DataAccess'
```
Creates a copy of the key `HKLM:\Software\Microsoft\DataAccess` and all its subkeys recursively to `HKLM:\SOFTWARE\_automation\RegistryBackup\HKLM\Software\Microsoft\DataAccess`.

### Parameters

| Parameter      | Alias | Required | Default | Type   | Description                                                                 |
|----------------|-------|----------|---------|--------|-----------------------------------------------------------------------------|
| `-Path`        |       | True     |         | String | The path of the key you wish to backup.                                    |
| `-Name`        |       | True     |         | String | Holds the key name for the desired backup specific key (omit for recursive backup). |

## Output

```
.\Backup-RegistryValue-log.txt
.\Backup-RegistryValue-error.txt
```

## Locations

| Payload                           |                                          |
|-----------------------------------|------------------------------------------|
| /repo/script/Backup-RegistryValue.ps1 |                                          |
| Automate                          |                                          |
| ConnectWise RMM                   |                                          |
| Kaseya                            |                                          |
| Datto RMM                         |                                          |



