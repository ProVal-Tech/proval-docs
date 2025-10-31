---
id: 'b5d53223-2755-48da-b4f5-a1cd5fa9f58f'
slug: /b5d53223-2755-48da-b4f5-a1cd5fa9f58f
title: 'Initialize-HPBiosConfigUtility'
title_meta: 'Initialize-HPBiosConfigUtility'
keywords: ['hp', 'hp-bcu', 'hp-bios-config', 'bios', 'bios-configuration']
description: 'This script automates downloading/extracting the BCU package, verifying the BCU executable, running BCU to read or apply BIOS settings, and interpreting BCU exit codes into human-readable messages.'
tags: ['application', 'installation', 'hp', 'bios', ]
draft: false
unlisted: false
---

## Overview

This script automates downloading/extracting the BCU package, verifying the BCU executable, running BCU to read or apply BIOS settings, and interpreting BCU exit codes into human-readable messages.

**References:**

- [HP BIOS Configuration Utility | HP Client Management Solutions](https://ftp.ext.hp.com/pub/caps-softpaq/cmit/HP_BCU.html)
- [BIOS_Configuration_Utility_User_Guide.pdf](https://ftp.hp.com/pub/caps-softpaq/cmit/whitepapers/BIOS_Configuration_Utility_User_Guide.pdf)

## Requirements

- Windows on HP hardware (manufacturer must be 'HP' or 'Hewlett').
- Administrative privileges (required to write to ProgramData, install utilities, and access BIOS/WMI namespaces).
- PowerShell 5.0 or later (script declares #requires -Version 5).
- Internet access to access the HP BCU webpage and download the latest BCU package if it is not present locally.
- Strapper PowerShell module (the script will update/install it automatically if missing).
- NuGet package provider (auto-bootstrapped by the script if missing).

## Process

The script follows these main steps:

1. Enforce secure TLS policy (prefers TLS 1.3 then TLS 1.2) for downloads.
2. Prepare working directories under ProgramData where the installer, extraction, and report files are stored.
3. Ensure `Strapper` module is available and call `Set-StrapperEnvironment` for consistent logging utilities such as `Write-Log`.
4. Validate host manufacturer is HP and OS is compatible; exit early on unsupported hosts.
5. Install or verify the HP BIOS Configuration Utility (BCU) by:
   - Fetching and parsing the HP BCU webpage to obtain the latest installer download URL
   - Downloading the installer archive using the obtained URL
   - Extracting it to the configured extract path
6. Locate the BCU executable (`BIOSConfigUtility64.exe`) in the extraction folder.
7. Execute BCU with provided arguments (or default `/get`) and capture output and exit codes.
8. Parse XML output (when present) to retrieve the BIOS return code, and call `Convert-ExitCode` to map the numeric code to a descriptive message and log the result.
9. Return the raw command output (and log success/failure). Functions return boolean success/failure for programmatic use.

## Payload Usage

This script accepts an optional `-Argument` string which is forwarded to the BCU executable. If omitted, the script defaults to running BCU with `/get` to retrieve BIOS configuration.

Example usage:

Run a read-only configuration scan (installs BCU if missing):

```powershell
.\Initialize-HPBiosConfigUtility.ps1
```

Get the current value of the "Fast Boot" setting:

```powershell
.\Initialize-HPBiosConfigUtility.ps1 -Argument '/getvalue:"Fast Boot"'
```

Set the "Fast Boot" setting to "Enable":

```powershell
.\Initialize-HPBiosConfigUtility.ps1 -Argument '/setvalue:"Fast Boot","Enable"'
```

Display BCU help and supported commands:

```powershell
.\Initialize-HPBiosConfigUtility.ps1 -Argument '/help'
```

## Parameters

| Parameter         | Alias | Required  | Default   | Type      | Description                               |
| ----------------- | ----- | --------- | --------- | --------- | ----------------------------------------- |
| `Argument`        |       | False     | `'/get'`  | String    | Arguments to forward to the BCU executable (e.g. '/get', '/set:"Name=Value"', '/setconfig config.txt'). |

## Output

The script writes logs using the `Write-Log` function (provided by the Strapper module). It returns the raw output produced by the BCU executable (string/array) and logs a clear interpretation of the return code.

Log and error files (location depends on Strapper configuration; defaults are):

    .\Initialize-HPBiosConfigUtility-log.txt
    .\Initialize-HPBiosConfigUtility-error.txt
