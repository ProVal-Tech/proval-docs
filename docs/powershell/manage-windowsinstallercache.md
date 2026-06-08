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

Identifies orphaned `.msi`, `.msp`, and `.mst` files in `C:\Windows\Installer` and safely quarantines them to reclaim disk space. Files are validated against multiple sources before removal. The default mode is scan-only and no files are moved or deleted without explicit action.

## Requirements

- PowerShell 5.1 or newer
- Local administrator rights
- Access to `C:\Windows\Installer`

## Usage

Scan and classify files (default, no changes made):

```powershell
.\Manage-WindowsInstallerCache.ps1 -Verbose
```

Quarantine verified orphaned files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Quarantine -Verbose -Confirm
```

Delete previously quarantined files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Delete -ManifestPath .\Logs\Manage-WindowsInstallerCache-20260529-120001-manifest.json -Confirm
```

Restore quarantined files:

```powershell
.\Manage-WindowsInstallerCache.ps1 -Restore -RestoreFromManifest .\Logs\Manage-WindowsInstallerCache-20260529-120001-manifest.json -Confirm
```

## Parameters

| Parameter | Required | Default | Type | Description |
| --- | --- | --- | --- | --- |
| `ScanOnly` | No | Active when no mode switch is supplied | Switch | Performs discovery and classification only. |
| `Quarantine` | No | `False` | Switch | Moves verified orphaned files to the quarantine folder. |
| `Delete` | No | `False` | Switch | Deletes previously quarantined files referenced by a manifest. |
| `Restore` | No | `False` | Switch | Restores previously quarantined files from a manifest. |
| `RestoreFromManifest` | No | Newest manifest in log path | String | Path to the manifest used for restore. |
| `ManifestPath` | No | Newest manifest in log path | String | Path to the manifest used for delete. |
| `InstallerPath` | No | `C:\Windows\Installer` | String | Root installer cache path to inspect. |
| `QuarantinePath` | No | `C:\Windows\Installer\_Quarantine` | String | Quarantine destination folder. |
| `LogPath` | No | `C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache` | String | Folder for JSON, CSV, and manifest output. |
| `Force` | No | `False` | Switch | Permits non-safe items to be processed after explicit confirmation. |

## Output

- JSON audit log
- CSV audit log (suitable for ticket attachments)
- Rollback manifest (created when files are quarantined)

Default output location:

```text
C:\ProgramData\_Automation\Script\Manage-WindowsInstallerCache\
```

## Changelog

### 2026-06-08

- Initial version of the document
