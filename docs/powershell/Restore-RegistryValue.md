---
id: '1f1d7e57-764e-4888-bda1-fc0ea45f85c0'
slug: /1f1d7e57-764e-4888-bda1-fc0ea45f85c0
title: 'Restore-RegistryValue'
title_meta: 'Restore-RegistryValue'
keywords: ['registry', 'restore', 'backup', 'windows', 'administration']
description: 'This document provides a comprehensive guide on restoring backed up registry key properties or keys recursively using the Restore-RegistryValue.ps1 script. It outlines the requirements, process, parameters, and output associated with the script, ensuring users can effectively restore their registry settings.'
tags: ['backup', 'windows']
draft: false
unlisted: false
---

## Overview

This document explains how to restore a backed-up registry key property or registry key recursively when backed up with `Backup-RegistryValue.ps1`.

## Requirements

1. The [EPM - Windows Configuration - Agnostic - Script - Backup-RegistryValue](<./Backup-RegistryValue.md>) must have been used to back up the registry value.
2. The script must be run with Admin Rights.

## Process

1. Retrieve the necessary information for the key properties (or keys and all associated properties) being restored.
2. Restore the key property or key properties to their original registry location.
3. Verify that the two keys match.
   1. If the removal of the backup is desired, remove the backup key.

## Payload Usage

To restore the backed-up key property to its original registry location and remove the backed-up key property when finished, use the following command:

```
Restore-RegistryValue.ps1 -Path "HKLM:\\Software\\_automation\\WindowsUpdate\\Windowsversion" -Name Windowsversion -RemoveOnRestore
```

To restore the backed-up key property and all recursive keys and properties to their original registry locations, use the following command:

```
Restore-RegistryValue.ps1 -Path "HKLM:\\Software\\_automation\\WindowsUpdate\\Windowsversion"
```

### Parameters

| Parameter                | Alias | Required | Default | Type   | Description                                     |
|--------------------------|-------|----------|---------|--------|-------------------------------------------------|
| `-Path`                  |       | True     |         | String | The path to the backed-up registry key.         |
| `-Name`                  |       | True     |         | String | The original path of the backed-up key.         |
| `-RemoveOnRestore`      |       | False    | False   | Bool   | Designates removal of the backed-up key after successful restore. |

## Output

Does the content write to the RMM log, a data file, or the console? If so, what is the syntax?

```
./Restore-RegistryValue-log.txt
./Restore-RegistryValue-error.txt
```

## Locations

| Payload                              | Path                                      |
|--------------------------------------|-------------------------------------------|
| Restore Script                       | /repo/script/Restore-RegistryValue.ps1   |
| Automate                             |                                           |
| ConnectWise RMM                      |                                           |
| Kaseya                               |                                           |
| Datto RMM                            |                                           |
## Attachments
[Install-AnyConnect.ps1](<../../static/attachments/itg/10441516/Install-AnyConnect.ps1>)
[README.md](<../../static/attachments/itg/10441516/README.md>)