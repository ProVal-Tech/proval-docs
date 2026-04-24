---
id: '6ec8fb3c-29ef-4b05-b8fd-546eb07176c7'
slug: /6ec8fb3c-29ef-4b05-b8fd-546eb07176c7
title: 'Optimize-DotNetRunTime'
title_meta: 'Optimize-DotNetRunTime'
keywords: ['Optimize','.net','Runtime','list','uninstall',]
description: 'A description of the script.'
tags: ['dotnet','windows']
draft: false
unlisted: false
last_update:
  date: 2026-04-16
---

## Overview

This script keeps your .NET runtimes and SDKs up to date and secure. It automatically installs the latest versions, removes outdated or unsupported versions, and maintains a clean system environment.

## Requirements

- PowerShell v5+
- Administrative Privileges
- Active Internet Connection (to fetch release metadata and installers)

## How It Works

The script performs these actions:

1. **Checks your system** for installed .NET components and compares them against Microsoft's official supported versions.

2. **Lists components** - Shows what's installed and whether each version is still supported or outdated.

3. **Installs updates** - Downloads and installs the latest versions of .NET runtimes and SDKs you specify.

4. **Removes outdated versions** - Cleans up unsupported or older patch versions to save disk space and improve security.

5. **Logs results** - Records all actions so you can verify what was done.

**By default**, the script uses these settings:

- **Action**: List installed components
- **Type**: Desktop Runtime
- **Version**: All applicable versions

You can customize these using the parameters described below.

## How to Use This Script

**View all installed .NET components and their support status:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list
```

**View only .NET SDKs:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Type sdk
```

**Install the latest versions of all .NET components:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type all
```

**Update SDKs to the latest patch version:**

Installs the newest patch and removes older versions of the same SDK to save space.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type sdk
```

**Remove unsupported ASP.NET Core versions:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type aspNetCoreRuntime
```

**Perform a full cleanup: remove all old versions and install only the latest:**

Use this to get a completely clean and up-to-date .NET environment.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all
```

**Install the latest .NET Desktop Runtime *(default)*:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install
```

**Install a specific version of .NET (e.g., .NET 10):**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type desktopRuntime -Version 10
```

**Install multiple specific versions at once:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type desktopRuntime -Version 8, 10
```

**Update only .NET 8 to its latest patch:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type desktopRuntime -Version 8
```

**Update multiple specific versions to their latest patches:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type all -Version 6, 7, 8, 9
```

**Remove specific versions of .NET:**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type all -Version 6, 9
```

**Keep only specific versions and remove everything else:**

Useful when you need only .NET 8 and 9 and want to clean up all others.

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all -Version 8, 9
```

**View only specific versions (e.g., .NET 8 and 9):**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Version 8, 9
```

## Parameters

| Parameter | Alias | Required | Default | Type | Description |
| --- | --- | --- | --- | --- | --- |
| `Action` |  | False | List | String | What you want the script to do: <br /><br /> - `list`: View all installed .NET components and support status. <br /><br /> - `install`: Install the latest versions. <br /><br /> - `uninstall`: Remove specific versions. <br /><br /> - `update`: Update to latest patches and remove old patches. <br /><br /> - `renew`: Clean everything up, install latest and remove everything else. |
| `Type` |  | False | desktopRuntime | String[] | Which .NET component(s) to work with: <br /><br /> - `sdk`: .NET SDKs (for developers). <br /><br /> - `runtime`: General .NET runtimes. <br /><br /> - `desktopRuntime`: Desktop app runtimes (default). <br /><br /> - `aspNetCoreRuntime`: Web server runtimes. <br /><br /> - `all`: Everything listed above. |
| `Version` |  | False | *(not set)* | Int[] | (Optional) Limit the action to specific .NET versions by major version number (e.g., `8`, `9`, or `8, 9, 10`). When you don't specify this, the script applies its default behavior for each action. See the tips table below for details. |

### Tips for `-Version` Behavior

| Action | Without `-Version` | With `-Version` (e.g., `-Version 8, 9`) |
| --- | --- | --- |
| `list` | Shows all installed .NET components | Shows only versions 8 and 9 |
| `install` | Installs the latest supported version | Installs specific versions you choose |
| `update` | Updates only versions that are still supported | Updates the versions you specify |
| `uninstall` | Removes only outdated/unsupported versions | Removes exactly the versions you specify |
| `renew` | Full cleanup: latest versions + remove all others | Keeps only what you specify, removes everything else |

## Output

The script generates the following output files (via Strapper logs):

- `.\Optimize-DotNetRunTime-log.txt`
- `.\Optimize-DotNetRunTime-Error.txt`

## Changelog

### 2026-04-16

- Introduced the `Version` parameter.

### 2025-05-09

- Initial version of the document
