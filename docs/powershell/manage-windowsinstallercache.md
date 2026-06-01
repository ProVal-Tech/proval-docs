---
id: 'fb30b46a-ae2e-498f-b049-48f687fea928'
slug: /fb30b46a-ae2e-498f-b049-48f687fea928
title: 'Manage-WindowsInstallerCache'
title_meta: 'Manage-WindowsInstallerCache'
keywords: ['windows-installer', 'cache', 'msi', 'msp', 'quarantine', 'cleanup']
description: 'Defensive Windows Installer cache reconciliation script with quarantine-first handling and rollback support.'
tags: ['windows', 'installer', 'maintenance', 'safety']
draft: false
unlisted: false
last_update:
  date: 2026-06-01
---

## Description
`Manage-WindowsInstallerCache` is a defensive Windows Installer cache reconciliation utility for enterprise endpoints.

It inspects `C:\Windows\Installer` by combining Windows Installer API data, the `WindowsInstaller.Installer` COM object, registry metadata, and filesystem reconciliation before anything is classified as removable.

The default path is quarantine-first and scan-first (`WhatIf`). A file is only treated as a candidate when it is absent from every full-path validation source.

## Safety Model
The script uses four validation layers before any file is marked as a candidate:

1. Windows Installer API validation through an embedded C# wrapper.
2. COM validation through `WindowsInstaller.Installer`.
3. Registry validation across core Windows Installer metadata hives.
4. Filesystem reconciliation across `*.msi`, `*.msp`, and `*.mst` under `C:\Windows\Installer`.

Classification rules:

1. `SAFE_ORPHAN`: no full-path or weak reference was found and no collection errors were recorded.
2. `POSSIBLE_REFERENCE`: no full-path reference was found, but filename-only evidence was found in one or more sources.
3. `UNVERIFIED`: no reference was found, but one or more validation layers failed to enumerate cleanly.
4. `ACTIVE_REFERENCE`: the file was found in one or more full-path validation sources.

Only `SAFE_ORPHAN` items are eligible for quarantine by default.

`POSSIBLE_REFERENCE` and `UNVERIFIED` remain log-only unless `-Force` is explicitly used and confirmed.

## Process
The script implements the following functions:

1. `Get-InstallerReferences`: orchestrates API, COM, and registry collection.
2. `Get-MsiApiReferences`: uses the embedded C# wrapper to call MSI enumeration methods and collect `LocalPackage`, transform, and source-style metadata.
3. `Get-ComInstallerReferences`: uses `WindowsInstaller.Installer` to collect product and patch references.
4. `Get-RegistryInstallerReferences`: scans Windows Installer registry hives for cached package paths and transform references.
5. `Find-OrphanedInstallerFiles`: reconciles installer cache contents against collected references and applies risk classification.
6. `Move-InstallerCandidates`: quarantines candidate files and writes a rollback manifest.
7. `Restore-InstallerCandidates`: restores files from the rollback manifest.
8. `Write-CleanupLog`: writes structured JSON and CSV logs for change control and audits.

The script does not rely on filesystem-only cleanup logic and does not direct-delete live cache files from the active installer directory.

## Requirements
- PowerShell 5.1 or newer
- Local administrator rights
- Access to `C:\Windows\Installer`

## Usage
Dry run scan (default behavior):

```powershell
.\Manage-WindowsInstallerCache.ps1 -Verbose
```

Quarantine only verified orphaned files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Quarantine -Verbose -Confirm
```

Delete previously quarantined files from a manifest:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Delete -ManifestPath .\Logs\Manage-WindowsInstallerCache-20260529-120001-manifest.json -Confirm
```

Restore quarantined files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Restore -RestoreFromManifest .\Logs\Manage-WindowsInstallerCache-20260529-120001-manifest.json -Confirm
```

## Parameters
| Parameter | Required | Default | Description |
| --- | --- | --- | --- |
| `ScanOnly` | No | Active when no mode switch is supplied | Performs discovery and classification only. |
| `Quarantine` | No | `False` | Moves `SAFE_ORPHAN` findings into `C:\Windows\Installer\_Quarantine`. |
| `Delete` | No | `False` | Deletes previously quarantined files referenced by a manifest. |
| `Restore` | No | `False` | Restores previously quarantined files. |
| `RestoreFromManifest` | No | Newest manifest in log path | Manifest to restore from. |
| `ManifestPath` | No | Newest manifest in log path for delete mode | Manifest to delete from. |
| `InstallerPath` | No | `C:\Windows\Installer` | Root installer cache path to inspect. |
| `QuarantinePath` | No | `C:\Windows\Installer\_Quarantine` | Quarantine folder. |
| `LogPath` | No | `.\Logs` | Folder for JSON, CSV, and manifest files. |
| `Force` | No | `False` | Permits non-safe items to be processed after explicit confirmation. |

## Safety Rationale
Every cleanup decision is intentionally conservative:

1. The Windows Installer API is the primary path-based source of truth.
2. COM and registry results provide independent validation layers for servicing relationships not surfaced by one source.
3. Weak filename-only evidence never becomes a cleanup candidate and downgrades the item to `POSSIBLE_REFERENCE`.
4. Any validation collection failure downgrades otherwise unreferenced files to `UNVERIFIED`.
5. `Delete` operates against quarantine manifests, not the active installer cache, preserving a rollback window.

## Output
The script writes:

1. A JSON audit log with findings, actions, validation errors, and manifest references.
2. A CSV audit log suitable for ticket attachments or CAB evidence.
3. A rollback manifest whenever files are successfully quarantined.

Default output location:

```text
.\Logs\Manage-WindowsInstallerCache-<timestamp>.json
.\Logs\Manage-WindowsInstallerCache-<timestamp>.csv
.\Logs\Manage-WindowsInstallerCache-<timestamp>-manifest.json
```

## Sample Dry-Run Output
```powershell
PS C:\> .\Manage-WindowsInstallerCache.ps1 -Verbose

InstallerPath        : C:\Windows\Installer
QuarantinePath       : C:\Windows\Installer\_Quarantine
TotalFiles           : 612
SafeOrphans          : 4
PossibleReferences   : 2
Unverified           : 0
ActiveReferences     : 606
ValidationErrorCount : 0
ManifestPath         :
JsonLogPath          : C:\Scripts\Manage-WindowsInstallerCache\Logs\Manage-WindowsInstallerCache-20260529-141500.json
CsvLogPath           : C:\Scripts\Manage-WindowsInstallerCache\Logs\Manage-WindowsInstallerCache-20260529-141500.csv
```

## Testing
Pester tests can be added for classification and manifest workflows in a file such as:

```text
Tests/Manage-WindowsInstallerCache.Tests.ps1
```

## Testing Guide
The Windows Installer folder (`C:\Windows\Installer`) is hidden by default. Use the following steps to build a manual validation scenario.

### Prepare File Explorer
1. Open File Explorer and navigate to `C:\Windows\Installer`. If the folder is not visible, enable hidden items or type the path directly.
2. Switch folder view to **Details**.
3. Right-click a column header and select **More...**.
4. Select **Subject** and **Authors**, then click **OK**.
5. Use these columns to identify which product owns each `.msi` or `.msp` file.

### Create Orphaned Test Files
1. Install an application that uses Windows Installer (for example, Adobe Acrobat Reader).
2. After install, identify the new `*.msi` and `*.msp` files in `C:\Windows\Installer`.
3. Copy those files to a temporary folder such as `C:\Temp\InstallerBackup`.
4. Uninstall the application.
5. Paste the backed-up files back into `C:\Windows\Installer`.

These reinserted files should now be orphaned because product references were removed during uninstall.

### Run the Script
```powershell
.\Manage-WindowsInstallerCache.ps1 -Verbose
```

Expected result:
- Reinserted files are classified as `SAFE_ORPHAN` when all validation sources enumerate cleanly.
- Reinserted files are classified as `UNVERIFIED` if any validation source has collection errors.
- Still-active product files remain `ACTIVE_REFERENCE`.

## Changelog

### 2026-06-01
- Initial version of the document
