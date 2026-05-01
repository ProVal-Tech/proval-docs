---
id: '6ec8fb3c-29ef-4b05-b8fd-546eb07176c7'
slug: /6ec8fb3c-29ef-4b05-b8fd-546eb07176c7
title: 'Optimize-DotNetRunTime'
title_meta: 'Optimize-DotNetRunTime'
keywords: ['Optimize','.net','Runtime','list','uninstall',]
description: 'Manage .NET SDK and runtime versions on Windows: list, install, update, uninstall, and renew with x64/x86 support.'
tags: ['dotnet','windows']
draft: false
unlisted: false
last_update:
  date: 2026-05-01
---

## Overview

This script helps you keep .NET clean, current, and supported on Windows.

It can list, install, update, uninstall, and renew .NET components.

Install and update use the machine's native architecture installer (for example, x64 on x64 systems). If older x86 components are already installed, the script can still detect and remove them during `uninstall`, `update`, and `renew` cleanup.

## Requirements

- PowerShell v5+
- Administrative Privileges
- Active Internet Connection

## Before You Run

- Review which apps depend on .NET versions you plan to remove.
- Use `-Action list` first to confirm what is installed.
- If you use `-Version`, confirm those major versions are correct.
- Use `-Force` only when you are confident it is safe. See warning below.

## What The Script Does

1. Reads Microsoft .NET release metadata to find current versions.
2. Detects installed SDKs and runtimes from both x64 and x86 locations.
3. Includes registry-based package detection so it can find entries that `dotnet.exe` may not show.
4. Installs or updates selected components for the machine's native architecture.
5. Removes old, unsupported, or non-target versions based on your action.
6. Writes detailed logs for audit and troubleshooting.

## Default Behavior

- `Action`: `list`
- `Type`:
  - For `list`, defaults to `all`
  - For `install`, `uninstall`, `update`, and `renew`, defaults to `desktopRuntime`
- `Version`: not set (the script follows each action's default scope)

## How To Use

### List installed components

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list
```

### List only SDKs

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Type sdk
```

### Install latest supported version of all component types

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type all
```

### Install a specific major version

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type desktopRuntime -Version 10
```

### Install multiple major versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type desktopRuntime -Version 8, 9
```

### Update to latest patch (single type)

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type sdk
```

### Update selected major versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type all -Version 8, 9, 10
```

### Uninstall unsupported versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type aspNetCoreRuntime
```

### Uninstall specific major versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all -Version 6, 7
```

### Renew to latest supported versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all
```

### Renew and keep only selected versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -Version 8, 9
```

### List only selected versions

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Version 8, 9
```

## Parameter Summary

| Parameter | Required | Default | Type | What it controls |
| --- | --- | --- | --- | --- |
| `Action` | No | `list` | String | Operation to run: `list`, `install`, `uninstall`, `update`, `renew` |
| `Type` | No | `all` for `list`; `desktopRuntime` for other actions | String[] | Component type: `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all` |
| `Version` | No | not set | Int[] | One or more .NET major versions, such as `8`, `9`, or `8, 9` |
| `Force` | No | not set | Switch | Forces MSI-based removal by bypassing dependency protection |

## Version Scope By Action

| Action | Without `-Version` | With `-Version` |
| --- | --- | --- |
| `list` | Shows all installed components | Shows only selected major versions |
| `install` | Installs highest supported major version | Installs latest patch for each selected major version (including EOL, with warning) |
| `update` | Updates only installed supported versions | Updates selected major versions, including EOL |
| `uninstall` | Removes unsupported/EOL versions | Removes selected major versions, including supported |
| `renew` | Installs latest supported and removes unsupported | Keeps only selected versions and removes all others. Fails if any selected version is unsupported |

## `-Force` Switch - Caution

> **⚠️ WARNING:** The `-Force` switch overrides Windows Installer dependency protection. Use only when you fully understand the implications.

Without `-Force`, the script respects MSI dependency providers registered by other applications. If software such as Visual Studio, SQL Server, or third-party tools installed a .NET component and registered a dependency on it, the Windows Installer will silently refuse to remove it (returning exit code 0) to protect the dependent application. This is by design.

When `-Force` is specified, the script appends `IGNOREDEPENDENCIES=ALL` to all MSI uninstall commands, which:
- Bypasses the dependency provider safety check.
- Forces removal of the .NET component regardless of what other software depends on it.
- May cause dependent applications to malfunction, fail to start, or require repair/reinstallation.

**When to use `-Force`:**
- You are certain no critical software depends on the targeted .NET version.
- You are performing a controlled upgrade where a newer version will immediately replace the removed one (e.g., `renew -Version 10 -Force` installs .NET 10 before removing older versions).
- You need to clean up orphaned registry entries from partially removed installations.

**When NOT to use `-Force`:**
- On systems with Visual Studio, SQL Server, or other enterprise software that bundles .NET runtimes.
- On shared/production servers where breaking a dependency could disrupt services.
- When you are unsure which applications depend on the .NET components being removed.

Examples:

```powershell
# Force renew to .NET 10 only
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -Version 10 -Force

# Force uninstall .NET 8
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all -Version 8 -Force
```

## Architecture And Removal Notes

- x64 and x86 installs are tracked separately.
- On x64 machines, installs use x64 packages. The script does not install new x86 runtime/SDK packages by default.
- x64 `sdk`, `runtime`, and `aspNetCoreRuntime` removals use the official .NET uninstall tool.
- x86 components and all `desktopRuntime` removals use Windows uninstall registration.
- During `uninstall`, `update`, and `renew`, outdated x86 components can be removed when detected.
- During `uninstall`, `update`, and `renew`, older version cleanup primarily targets components detected by `dotnet.exe`.
- Registry-only entries are detected and can be cleaned up when file-based detection misses them.
- When `-Force` is used, cleanup can also remove registry/package-registered components not listed by `dotnet.exe`, including shared prerequisites used by other apps.
- The script logs the uninstall command and exit code for each removal attempt.

## Log Output

The script writes logs using Strapper:

- `.\Optimize-DotNetRunTime-log.txt`
- `.\Optimize-DotNetRunTime-Error.txt`

## Changelog

### 2026-05-01

- Improved mixed x64/x86 handling: installs follow machine architecture, while cleanup actions can still remove outdated x86 components.
- Updated install, update, and removal logic to be architecture-aware for safer results.
- Improved uninstall reliability by resolving Windows Installer product codes from registry data.
- Added `-Force` to allow dependency bypass for advanced cleanup scenarios.
- Improved `renew` cleanup to remove orphaned MSI entries using .NET version parsing from package names.
- Expanded logging for removal operations, including exact uninstall command paths and exit codes.

### 2026-04-16

- Introduced the `Version` parameter.

### 2025-05-09

- Initial version of the document
