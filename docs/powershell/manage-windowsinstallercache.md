---
id: 'fb30b46a-ae2e-498f-b049-48f687fea928'
slug: /fb30b46a-ae2e-498f-b049-48f687fea928
title: 'Manage-WindowsInstallerCache'
title_meta: 'Manage-WindowsInstallerCache'
keywords: ['windows-installer', 'cache', 'msi', 'msp', 'quarantine', 'cleanup']
description: 'Safely identifies and quarantines orphaned files in the Windows Installer cache to reclaim disk space.'
tags: ['windows', 'disk-cleanup', 'installation', 'security']
draft: false
unlisted: false
last_update:
  date: 2026-06-08
---

## Description

Identifies orphaned `.msi`, `.msp`, and `.mst` files in `C:\Windows\Installer` and safely quarantines them to reclaim disk space. The script validates files against the Windows Installer API, the `WindowsInstaller.Installer` COM object, and registry metadata before classifying anything as removable. The default mode is scan-only — no files are moved or deleted without explicit action.

## Requirements

- PowerShell 5.1 or newer
- Local administrator rights
- Access to `C:\Windows\Installer`

## Usage

Dry-run scan (default, no changes made):

```powershell
.\Manage-WindowsInstallerCache.ps1 -Verbose
```

Quarantine verified orphaned files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Quarantine -Verbose
```

Quarantine orphaned and unverified files without prompting:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Quarantine -Force
```

Delete previously quarantined files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Delete -ManifestPath "C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-20260529-120001-manifest.json"
```

Restore quarantined files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Restore -RestoreFromManifest "C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-20260529-120001-manifest.json"
```

## File Classifications

Each file in the installer cache receives one of the following classifications:

| Classification | Meaning | Eligible for Quarantine |
| --- | --- | --- |
| `SAFE_ORPHAN` | No full-path or weak reference found; all validation sources enumerated cleanly. | Yes (default) |
| `POSSIBLE_REFERENCE` | No full-path reference found, but filename-only evidence exists in one or more sources. | No |
| `UNVERIFIED` | No reference found, but one or more validation layers failed to enumerate cleanly. | Only with `-Force` or operator confirmation |
| `ACTIVE_REFERENCE` | File found in one or more full-path validation sources. | No |

## Parameters

| Parameter | Required | Default | Type | Description |
| --- | --- | --- | --- | --- |
| `ScanOnly` | No | Active when no mode switch is supplied | Switch | Performs discovery and classification only. |
| `Quarantine` | No | `False` | Switch | Moves `SAFE_ORPHAN` files to the quarantine folder (`C:\Windows\Installer\_Quarantine` by default). |
| `Delete` | No | `False` | Switch | Permanently deletes previously quarantined files referenced by a manifest. |
| `Restore` | No | `False` | Switch | Restores previously quarantined files from a manifest back to their original location. |
| `RestoreFromManifest` | No | Newest manifest in log path | String | Path to the manifest used for restore. |
| `ManifestPath` | No | Newest manifest in log path | String | Path to the manifest produced by a `-Quarantine` run. Created automatically when at least one file is quarantined — records each file's original path, quarantine destination, hash, size, classification, and timestamp. Supply this path to `-Delete` or `-Restore`. |
| `InstallerPath` | No | `C:\Windows\Installer` | String | Root installer cache path to inspect. |
| `QuarantinePath` | No | `C:\Windows\Installer\_Quarantine` | String | Quarantine destination folder. |
| `LogPath` | No | `C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache` | String | Folder for JSON, CSV, and manifest output. |
| `Force` | No | `False` | Switch | Suppresses confirmation prompts for `UNVERIFIED` files during quarantine, quarantining them automatically. |

## Output

The script writes:

- JSON audit log with findings, actions, validation errors, and manifest references
- CSV audit log (suitable for ticket attachments or CAB evidence)
- Scan report CSV with per-file classification details (scan and quarantine modes)
- Rollback manifest (created when files are quarantined)

Default output location:

```text
C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-<timestamp>.json
C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-<timestamp>.csv
C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-<timestamp>-manifest.json
```

## Sample Output

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
JsonLogPath          : C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-20260529-141500.json
CsvLogPath           : C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\Manage-WindowsInstallerCache-20260529-141500.csv
```

## Changelog

### 2026-06-09

- Updated documentation to reflect classification model and safety details

### 2026-06-08

- Initial version of the document
