---
id: '858fa597-2e08-4da4-ad6d-27ca62858547'
slug: /858fa597-2e08-4da4-ad6d-27ca62858547
title: 'Install-PSGalleryModule'
title_meta: 'Install-PSGalleryModule'
keywords: ['install', 'install-module', 'install-strapper', 'update-module', 'strapper']
description: 'Downloads and installs a PowerShell module directly from the PowerShell Gallery API.'
tags: ['windows']
draft: false
unlisted: false
last_update:
  date: 2025-07-30
---

## Overview

Standard module installation via `Install-Module` or `Update-Module` relies on the PackageManagement and PowerShellGet engine, which dynamically compiles .NET DLLs at runtime. In constrained or locked-down environments (such as RMM agent contexts, AppLocker-enforced machines, or systems with outdated NuGet providers), this compilation step fails or is blocked entirely, preventing module installation.

This script bypasses the PackageManagement engine completely. It queries the PowerShell Gallery v2 OData API directly, downloads the module's raw nupkg package as a zip archive, extracts it into the versioned system Modules directory, and removes any previously installed older versions. No dynamic compilation, no NuGet provider bootstrapping, and no PowerShellGet dependency are required.

## Requirements

- PowerShell 5.1 or later.
- Outbound HTTPS access to `https://www.powershellgallery.com`.
- Administrative privileges (the script writes to `%ProgramFiles%\WindowsPowerShell\Modules`).
- No additional modules, providers, or configuration are required.

# Payload Usage

```powershell
.\Install-PSGalleryModule.ps1 -Name 'Strapper'
```

## Parameters

| Parameter | Alias | Required | Default | Type   | Description                                              |
| --------- | ----- | -------- | ------- | ------ | -------------------------------------------------------- |
| `Name`    |       | True     |         | String | The name of the module to install from the PowerShell Gallery. |

## Output

This script does not produce log, result, or error files. All diagnostic information is emitted through the PowerShell error stream via `throw` on failure. On success the script completes silently with no console output. The installed module is written to:

    %ProgramFiles%\WindowsPowerShell\Modules\<ModuleName>\<Version>\

## Changelog

### 2025-05-29

- Initial version of the document
