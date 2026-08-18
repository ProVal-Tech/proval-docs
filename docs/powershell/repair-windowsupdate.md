---
id: '39345bfd-d9e2-4e68-9d7a-3e8b443140cc'
slug: /39345bfd-d9e2-4e68-9d7a-3e8b443140cc
title: 'Repair-WindowsUpdate'
title_meta: 'Repair-WindowsUpdate'
keywords: ['repair', 'windowsupdate', 'reset', 'troubleshoot', 'sfc', 'dism']
description: 'This script resets Windows Update settings and repairs system files to resolve common update errors. It clears outdated update caches, resets core services, and optionally repairs the Windows image.'
tags: ['update', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-08-18
---

## Description

This script resets Windows Update settings and repairs system files to resolve common update errors. It clears outdated update caches, resets core services, and optionally repairs the Windows image.

:::warning
This script is provided without warranty and does not guarantee that all Windows Update issues will be resolved
:::

## Requirements

- PowerShell 5.1 or later
- Administrator privileges
- Active internet connection
- Valid Windows license

## When to use it

Use this script when Windows Update fails to install, gets stuck checking for updates, or reports corrupted system files. It serves as a primary troubleshooting step for stubborn update errors.

## Usage

Run the script to clear update caches and reset Windows Update services:

```powershell
.\Repair-WindowsUpdate.ps1
```

Run the script and include a DISM repair to fix the underlying Windows image:

```powershell
.\Repair-WindowsUpdate.ps1 -DismRepair
```

Run the script and include a System File Checker (SFC) scan to repair corrupted Windows files:

```powershell
.\Repair-WindowsUpdate.ps1 -SfcScan
```

Run all repairs (DISM, SFC, and Windows Update reset) for a comprehensive fix. DISM runs first to ensure the component store is healthy:

```powershell
.\Repair-WindowsUpdate.ps1 -DismRepair -SfcScan
```

Run only DISM and SFC repairs without resetting Windows Update settings:

```powershell
.\Repair-WindowsUpdate.ps1 -DismRepair -SfcScan -SkipWUReset
```

## Parameters

| Parameter | Required | Default | Type | Description |
|---|---|---|---|---|
| `-DismRepair` | No | False | Switch | Repairs the Windows image using DISM. Runs before SFC. |
| `-SfcScan` | No | False | Switch | Scans and repairs corrupted Windows system files. |
| `-SkipWUReset` | No | False | Switch | Skips the Windows Update reset and inventory pull. Use this to run only DISM and SFC. |

## Output

  .\Repair-WindowsUpdate-log.txt  
  .\Repair-WindowsUpdate-error.txt

## Changelog

### 2026-08-18

- Added `-SkipWUReset` parameter to allow running only system repairs.
- Added automatic cleanup of old update backup folders to prevent disk space bloat.
- Improved repair order so DISM runs before SFC.
- Updated logging to use the Strapper module.

### 2025-04-10

- Initial version of the document.
