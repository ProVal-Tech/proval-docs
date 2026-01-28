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
---

## Overview

This script ensures that the system is running the latest supported versions of .NET runtimes and SDKs while removing unsupported versions to maintain a clean and secure environment. It manages the installation, uninstallation, updates, and listing of .NET runtimes and SDKs on a Windows system using official Microsoft release metadata.

## Requirements

- PowerShell v5+
- Administrative Privileges
- Active Internet Connection (to fetch release metadata and installers)

## Process

1. **Initialization**
    - Ensure the script is run with administrative privileges.
    - Validate PowerShell version (requires version 5 or higher).
    - Install or update the `Strapper` module for environment setup and logging.

2. **Parameter Handling**
    - Accept `Action` and `Type` parameters:
        - Action: `list`, `install`, `uninstall`, `update`, `renew`.
        - Type: `sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`, `all`.
    - Default values:
        - `Action`: `list`.
        - `Type`: `desktopRuntime` (if not specified for install, uninstall, update, or renew).

3. **Fetch Supported Versions**
    - Query the official **[Microsoft release-index.json](https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json)** API.
    - Dynamically determine the correct download URLs for the system architecture (x64, x86, arm64).
    - Identify the "Latest Release" and "Latest SDK" for active support channels.

4. **List Installed Components**
    - Use `dotnet --list-runtimes` and `dotnet --list-sdks` to identify installed components.
    - Categorize components into standard types (`sdk`, `runtime`, `desktopRuntime`, `aspNetCoreRuntime`).
    - Compare installed versions against the JSON metadata to determine support status.

5. **Perform Actions Based on Action Parameter**
    - `list`:
        - Display installed .NET components filtered by Type, showing support and update status.
    - `install`:
        - Download and install the absolute latest supported version of specified components.
        - Skip installation if the latest version is already installed.
    - `update`:
        - Identify installed supported major versions.
        - Install the latest patch for that major version.
        - Remove superseded/older patch versions of the **same** major version to save space.
    - `uninstall`:
        - Remove End-of-Life (EOL) or unsupported versions using the **.NET Core Uninstall Tool** (automatically downloaded if missing).
    - `renew`:
        - Aggressive maintenance strategy:
        - Install the latest supported versions.
        - Remove **ALL** older or unsupported versions.

6. **Error Handling and Logging**
    - Log all actions, including successes, failures, and skipped operations using `Write-Log`.
    - Handle errors gracefully (e.g., download failures, installer exit codes).

7. **Clean Up**
    - Ensure temporary files (installers, uninstall tools) in `ProgramData` are managed appropriately.

## Payload Usage

**To List all installed .NET runtimes and SDKs**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list

```

**To List only installed .NET SDKs**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action list -Type sdk

```

**To Install the latest supported versions of all .NET components**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install -Type all

```

**To Update SDKs (Install new patch, remove old patches for installed supported versions)**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action update -Type sdk

```

**To Uninstall unsupported versions of ASP.NET Core runtimes**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action uninstall -Type aspNetCoreRuntime

```

**To Remove all unsupported/old versions and install ONLY the latest available version**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action renew -Type all

```

**To Install the latest .NET Desktop Runtime (Default Type)**

```powershell
.\Optimize-DotNetRunTime.ps1 -Action install

```

## Parameters

| Parameter | Alias | Required | Default | Type | Description |
| --- | --- | --- | --- | --- | --- |
| `Action` |  | False | List | String | Specifies the action to perform. Valid values are: <br /><br /> - `list`: Lists installed components and support status. <br /><br /> - `install`: Installs the latest supported versions. <br /><br /> - `uninstall`: Uninstalls unsupported versions. <br /><br /> - `update`: Updates to latest patch and removes superseded patches for the installed supported versions. <br /><br /> - `renew`: Removes ALL old/unsupported versions and installs the latest. |
| `Type` |  | False | desktopRuntime | String | Specifies the type of .NET component to manage. Valid values are: <br /><br /> - `sdk`: Manages .NET SDKs. <br /><br /> - `runtime`: Manages .NET runtimes. <br /><br /> - `desktopRuntime`: Manages .NET desktop runtimes. <br /><br /> - `aspNetCoreRuntime`: Manages ASP.NET Core runtimes. <br /><br /> - `all`: Manages all .NET components. |

## Output

The script generates the following output files (via Strapper logs):

* `.\Optimize-DotNetRunTime-log.txt`
* `.\Optimize-DotNetRunTime-Error.txt`
