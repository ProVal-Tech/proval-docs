---
id: 'c9b1d4f8-2a5e-4f9a-8b7c-6d3e1f9a2b4c'
slug: /c9b1d4f8-2a5e-4f9a-8b7c-6d3e1f9a2b4c
title: 'Remove-StaleWindowsAppRunTime'
title_meta: 'Remove-StaleWindowsAppRunTime'
keywords: ['windows-app-runtime', 'cleanup', 'msix', 'appx', 'framework']
description: 'Removes superseded Windows App Runtime framework packages from a machine, keeping the newest build of every package family and architecture.'
tags: ['software', 'cleanup', 'windows']
draft: false
unlisted: false
last_update:
  date: 2026-09-10
---

## Overview

A PowerShell script that removes superseded Windows App Runtime framework packages from a machine, keeping the newest build of every package family and architecture. It can also run in a read-only reporting mode with `-List`, which makes the same script usable as the detection half of an RMM monitor and the remediation half of the same alert.

Winget is not used at any point. The script works entirely through the Appx cmdlets, which report the real MSIX build number rather than the marketing version Winget displays.

**Key Features:**

- **Safe Grouping:** Groups packages by package family name and architecture, so the newest build of every family survives and the 32-bit and 64-bit builds of a family are never mistaken for duplicates of each other.
- **Accurate Versioning:** Compares builds as real version objects rather than strings, so `8000.921.1539.0` and `8000.946.1701.0` sort correctly and the right build is retained.
- **Actionable State Tracking:** Distinguishes stale (superseded) from removable (superseded and still actionable), so a monitor built on this script cannot loop on leftovers that Windows will not let anything delete.
- **CBS Exclusion:** Excludes the CBS packages outright. They are serviced by Windows Update, not by this script, and are never reported or evaluated.
- **Device-Wide Removal:** Removes with `-AllUsers`, so a package is deregistered for every profile on the device rather than only for the account running the script.
- **Dry-Run Support:** Honours `-WhatIf` on every removal, so a dry run reports exactly what would be deleted.
- **Structured Output:** Returns an object per package in both modes and logs a summary through Strapper, so the RMM record shows what was found, what was removed, and what could not be.
- Provisions the Strapper logging module via **`Install-PSGalleryModule`**, bypassing the PackageManagement engine and avoiding dynamic .NET DLL compilation or NuGet provider bootstrapping.
- **Zero Deployment:** Deploys nothing and registers no scheduled tasks. The script runs to completion in a single pass and leaves only its log files behind.

## Requirements

- PowerShell version 5.1 or later.
- Windows 10 or later.
- Administrative privileges (the script requires `-RunAsAdministrator` because `Get-AppxPackage -AllUsers` and `Remove-AppxPackage -AllUsers` both need elevation).
- Network access to **contentrepo.net** for the module installer ([Install-PSGalleryModule.ps1](https://contentrepo.net/repo/script/Install-PSGalleryModule.ps1)).
- Network access to **www.powershellgallery.com** (queried by `Install-PSGalleryModule` to resolve and download the Strapper module).

## What Happens When You Run the Script

When you execute `Remove-StaleWindowsAppRunTime.ps1`, the following steps occur in order:

1. **Environment Preparation:** Sets secure TLS policy (TLS 1.2/1.3) and quiet output preferences. Retrieves the `Install-PSGalleryModule` script from the content repository and invokes it to ensure the Strapper module is installed. Once available, Strapper is imported silently and its logging environment is initialised.
2. **Inventory:** Queries every installed package matching `Microsoft.WindowsAppRuntime*` for all users, then discards every package matching `Microsoft.WindowsAppRuntime.CBS*` before any evaluation happens. Only the count of excluded packages is logged.
3. **Evaluation:** Groups the remaining packages by package family name and architecture. Within each group the builds are sorted as version objects in descending order; the highest build is the keeper and every other build in that group is flagged `Stale`. Each package is then checked for registration to determine if it is `Removable`.
4. **Reporting (`-List`):** If the `-List` switch is supplied, logs the inventory as a table, logs a success line with the total and removable counts, and returns the objects. Nothing is changed and the script exits here.
5. **Removal (default):** Walks the inventory and calls `Remove-AppxPackage -Package <PackageFullName> -AllUsers` for every package flagged `Removable`. Packages that are stale but no longer registered are skipped with a logged reason. Every removal is wrapped in `ShouldProcess`.
6. **Summary:** Logs a summary object (totals, removable, stranded, removed, failed, retained), logs the annotated inventory as a table, and closes with a single line beginning `Success:` or `Failure:` that the RMM platform can key off. Returns the annotated objects.

### How Packages Are Evaluated

Grouping is by family and architecture, not by name. This is what makes the operation safe.

- **1.x Runtimes:** For the 1.x runtimes the version number is part of the package family name, so Windows treats `Microsoft.WindowsAppRuntime.1.2`, `1.4`, `1.5`, `1.6`, `1.7` and `1.8` as six separate components rather than six versions of one. An application that depends on 1.2 will fail to launch if 1.2 is removed, even with 1.8 present. Grouping by family therefore guarantees the newest build of every family present on the device survives.
- **2.x Runtimes:** The 2.x runtimes behave the way you would expect. Microsoft consolidated them, so the whole 2.x line shares one family and a newer build properly supersedes the older ones.
- **Architecture:** Architecture is part of the grouping because the x86 and x64 builds of a family share a package family name and frequently carry identical version numbers. Grouping on family alone would sort them arbitrarily and delete a 32-bit runtime that nothing else provides.
- **Version Comparison:** Versions are compared as version objects. The build numbers are cast to `[Version]` before sorting, so a string comparison never puts `8000.921.1539.0` above `8000.946.1701.0`. This also sidesteps the display quirk where `winget list` reports a build newer than anything in its manifest as `> 1.8.10`.

### Stale versus Removable

These are two different questions and the script answers both:

| Property | Question it answers |
|---|---|
| `Stale` | Is this build superseded by a newer build in the same family and architecture? |
| `Registered` | Does any account still have this build registered (install state `Installed`)? |
| `Removable` | `Stale` **and** `Registered` — is there anything left to do about it? |

The distinction matters because of how Windows handles framework package removal. `Remove-AppxPackage` removes registrations. Once a build has been deregistered for every account, its payload remains on disk in `C:\Program Files\WindowsApps` in a staged state, owned by `NT AUTHORITY\SYSTEM`. Windows provides no supported way to delete that staged payload. 

These leftovers are inert. No application can bind to an unregistered package, they are invisible to `winget list`, and appx deployment hardlinks files that are identical between builds, so the disk cost is a fraction of what the separate install locations suggest.

:::note
**Important for monitors:** filter on `Removable`, never on `Stale`. A monitor keyed on `Stale` will keep finding the staged leftovers, keep triggering the cleanup, and keep alerting forever, because the cleanup has already done everything Windows permits. `Removable` reaches zero once the work is genuinely finished.
:::

### Excluded Packages

Packages matching `Microsoft.WindowsAppRuntime.CBS*` are filtered out at collection time. They are never reported, never evaluated for staleness and never removed. This covers the unsuffixed `CBS` family and the version-suffixed `CBS.1.6`, `CBS.1.8` and `CBS.2` variants.

CBS stands for Component-Based Servicing, the Windows servicing stack. These packages are the copy of the runtime that ships inside Windows and is patched by Windows Update rather than by an application installer, the Microsoft Store or Winget. They are left alone because:

- They are not part of the accumulation problem this script exists to solve.
- Microsoft does not document them as removable, and Windows reinstates them when the operating system is serviced.
- The disk they occupy does not justify altering an operating system component on a production device.

## Payload Usage

This script uses parameters to control its execution mode. Below are usage examples:

### Example 1

Reports what is installed and what is actionable without removing anything.

```powershell
.\Remove-StaleWindowsAppRunTime.ps1 -List
```

### Example 2

Reports only the actionable packages.

```powershell
.\Remove-StaleWindowsAppRunTime.ps1 -List | Where-Object -FilterScript { $_.Removable }
```

### Example 3

See what a cleanup would remove, without removing anything (dry run).

```powershell
.\Remove-StaleWindowsAppRunTime.ps1 -WhatIf
```

### Example 4

Removes the superseded builds for all users.

```powershell
.\Remove-StaleWindowsAppRunTime.ps1
```

### Example 5

Captures the result of a cleanup for auditing.

```powershell
$result = .\Remove-StaleWindowsAppRunTime.ps1
$result | Where-Object -FilterScript { $_.Removed } | Format-Table Name, Version, Architecture
```

### Monitor and Remediation Pattern

The `-List` switch exists so the same script can drive both halves of an RMM alert.

**Detection** (alert when anything is actionable):

```powershell
$actionable = @(.\Remove-StaleWindowsAppRunTime.ps1 -List | Where-Object -FilterScript { $_.Removable })
if ($actionable.Count -gt 0) {
    'Failure: {0} superseded Windows App Runtime builds can be removed.' -f $actionable.Count
} else {
    'Success: no removable Windows App Runtime builds found.'
}
```

**Remediation** (run the script with no parameters to clean up).

Because detection filters on `Removable`, the alert clears as soon as the cleanup has removed everything it can, even when stale-but-stranded builds remain visible on disk.

## Generated Files and Scenario Breakdown

The script deploys nothing and registers no scheduled tasks. It runs to completion in a single pass.

### Packages Removed

Packages are deregistered from `C:\Program Files\WindowsApps` using the `Remove-AppxPackage` cmdlet with the `-AllUsers` switch. Nothing else on disk is explicitly touched or deleted by this script.

### Configuration Script Logs

Written by Strapper for this script in the directory it is launched from:

- `.\Remove-StaleWindowsAppRunTime-log.txt`
- `.\Remove-StaleWindowsAppRunTime-error.txt`

## Parameters

| Parameter | Required | Default | Type | Description |
|---|---|---|---|---|
| `List` | False | *(off)* | Switch | Report the installed runtime packages and their state without removing anything. Returns the same objects as a cleanup run, minus the `Removed` property. |
| `WhatIf` | False | *(off)* | Switch | Standard `ShouldProcess` switch. Reports which packages would be removed without performing any removal. |
| `Confirm` | False | *(off)* | Switch | Standard `ShouldProcess` switch. Prompts before each removal. |

:::note
There is no parameter for the CBS exclusion. It is always in effect. See **Excluded Packages**.
:::

## Output

Returns an array of `PSCustomObject`, one entry per installed Windows App Runtime package (CBS packages excluded), with the following properties:

| Property | Type | Description |
|---|---|---|
| `Name` | String | Package name, for example `Microsoft.WindowsAppRuntime.1.8`. |
| `Family` | String | Package family name. Shared by the x86 and x64 builds of a family, and by every build in the 2.x line. |
| `Version` | String | The real MSIX build number, for example `8000.946.1701.0`. |
| `Stale` | Bool | `True` when superseded by a newer build in the same family and architecture. |
| `Registered` | Bool | `True` when at least one account has the package registered. `False` when only its staged payload remains. |
| `Removable` | Bool | `True` when the package is both stale and registered. **This is the property a monitor should filter on.** |
| `Removed` | Bool | *(cleanup mode only)* `True` when this run deregistered the package. |
| `Architecture` | String | `X64` or `X86`. Part of the grouping key, so it is included to make the report unambiguous. |
| `PackageFullName` | String | The only unambiguous identifier, and the value passed to `Remove-AppxPackage`. |

The run also logs a summary object:

| Field | Description |
|---|---|
| `TotalPackages` | Packages inventoried, after the CBS exclusion. |
| `RemovablePackages` | Packages that were both stale and registered. |
| `StrandedPackages` | Packages that were stale but already deregistered, and therefore skipped. |
| `RemovedPackages` | Packages this run successfully deregistered. |
| `FailedRemovals` | Removable packages whose removal failed. |
| `RetainedPackages` | Packages left in place, for any reason. |

The final log line begins with `Success:` or `Failure:` for the RMM platform to key off. A run that finds nothing removable reports `Success`, including when stranded packages remain.

## Changelog

### 2026-09-10

- Initial version of the document.
