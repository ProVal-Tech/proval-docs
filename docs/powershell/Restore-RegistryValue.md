---
id: '1f1d7e57-764e-4888-bda1-fc0ea45f85c0'
title: 'Restore Registry Value'
title_meta: 'Restore Registry Value - Detailed Guide'
keywords: ['registry', 'restore', 'backup', 'windows', 'administration']
description: 'This document provides a comprehensive guide on restoring backed up registry key properties or keys recursively using the Restore-RegistryValue.ps1 script. It outlines the requirements, process, parameters, and output associated with the script, ensuring users can effectively restore their registry settings.'
tags: ['backup', 'windows']
draft: false
unlisted: false
---
## Overview

Restores a backed up registry key property or registry key recursively when backed up with Backup-RegistryValue.ps1.

## Requirements

1. [EPM - Windows Configuration - Agnostic - Script - Backup-RegistryValue](https://proval.itglue.com/DOC-5078775-10441514) must have been used to back up that value.
2. Must be run with Admin Rights.

## Process

1. Gets needed information for the key properties (or keys and all associated properties) being restored.
2. Restores that key property or key properties to their original registry location.
3. Verifies that the two keys match.
   1. If removal of backup is desired, removes backup key.

## Payload Usage

```
Restore-RegistryValue.ps1 -Path "HKLM:\\Software\\_automation\\WindowsUpdate\\Windowsversion" -Name Windowsversion -RemoveOnRestore
```
Restores the backed up key property to its original registry location and removes the backed up key property when finished.

```
Restore-RegistryValue.ps1 -Path "HKLM:\\Software\\_automation\\WindowsUpdate\\Windowsversion"
```
Restores the backed up key property and all recursive keys and properties to their original registry locations.

### Parameters

| Parameter                | Alias | Required | Default | Type   | Description                                     |
|--------------------------|-------|----------|---------|--------|-------------------------------------------------|
| `-Path`                  |       | True     |         | String | The path to the backed up registry key.         |
| `-Name`                  |       | True     |         | String | The original path of the backed up key.         |
| `-RemoveOnRestore`       |       | False    | False   | Bool   | Designates removal of backed up key after successful restore.|

## Output

Does the content write to the RMM log, a data file, or the console? If so, what is the syntax?

```
.\Restore-RegistryValue-log.txt
.\Restore-RegistryValue-error.txt
```

## Locations

| Payload                              | /repo/script/Restore-RegistryValue.ps1 |
|--------------------------------------|------------------------------------------|
| Automate                             |                                          |
| ConnectWise RMM                      |                                          |
| Kaseya                               |                                          |
| Datto RMM                            |                                          |










