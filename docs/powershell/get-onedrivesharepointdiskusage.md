---
id: 'e4293429-79c1-4849-9bd1-09fe5c151b0a'
slug: /e4293429-79c1-4849-9bd1-09fe5c151b0a
title: 'Get-OneDriveSharePointDiskUsage'
title_meta: 'Get-OneDriveSharePointDiskUsage'
keywords: ['onedrive', 'sharepoint', 'disk-usage', 'disk-space']
description: 'Calculates the total disk space used by all locally synced OneDrive and SharePoint folders for all users on a Windows 10/11 system. The script outputs a summary table with the user, storage type (OneDrive or SharePoint), and total size in MB, reflecting the true disk usage (including NTFS compression and sparse files).'
tags: ['onedrive', 'disk', 'diskspace']
draft: false
unlisted: false
---

## Overview

Calculates the total disk space used by all locally synced OneDrive and SharePoint folders for all users on a Windows 10/11 system. The script outputs a summary table with the user, storage type (OneDrive or SharePoint), and total size in MB, reflecting the true disk usage (including NTFS compression and sparse files).

## Requirements

- Windows 10 or Windows 11
- Administrative privileges
- PowerShell 5.1 or later
- Internet connectivity
- Strapper PowerShell module (auto-installed if missing)
- NuGet package provider (auto-installed if missing)

## Process

The script performs the following steps:

1. **Parameter and Globals Setup**
    - Declares the script as an advanced function with `[CmdletBinding()]`.
    - No parameters are accepted.
    - Sets preferences to suppress progress, warning, and confirmation prompts.

2. **Variable Initialization**
    - Sets registry path for OneDrive/SharePoint sync engine settings.
    - Prepares arrays for grouped sync root information and results.

3. **TLS Policy Configuration**
    - Checks for supported TLS versions (TLS 1.2 and 1.3).
    - Sets the highest available TLS version for secure module downloads and API calls.

4. **Strapper Module Setup**
    - Sets execution policy to Bypass for the process.
    - Ensures the NuGet package provider is installed and bootstrapped.
    - Sets the PSGallery repository as trusted, handling possible corruption or registration issues.
    - Updates or installs the 'Strapper' module as needed, removing old versions to avoid conflicts.
    - Imports the 'Strapper' module and sets up the environment.

5. **Win32 API Integration**
    - Adds a C## type definition to the PowerShell session, exposing the `GetCompressedFileSize` Windows API to get the actual disk space used by each file.

6. **Initial System Check**
    - Verifies the OS is Windows 10 or Windows 11.
    - Logs an error and exits if the OS is unsupported.

7. **Enumerate OneDrive and SharePoint Sync Roots**
    - Uses `Get-UserRegistryItem` (from Strapper) to enumerate all user registry hives for OneDrive/SharePoint sync roots.
    - Extracts the username, mount point (local sync folder), and determines if the sync root is OneDrive or SharePoint.
    - Groups results by user and type.
    - Logs a warning and exits if no sync roots are found.

8. **Calculate Disk Usage**
    - For each user/type group, iterates through all mount points.
    - Recursively enumerates all files under each mount point.
    - For each file, uses the Win32 API to get the compressed file size (actual disk usage).
    - Sums the sizes for each group and converts the total size to MB.
    - Adds a result object to the output array with User, SizeMB, and Type.

9. **Output and Logging**
    - Logs completion and outputs the summary table to the log.
    - Returns the result array, which contains one entry per user/type with the total disk usage in MB.

**Error Handling**
    - All critical operations are wrapped in try/catch blocks. Errors are logged and the script continues or exits gracefully as appropriate.

**Security**
    - Ensures secure communication for module downloads by enforcing TLS 1.2 or 1.3.

**Extensibility**
    - The script can be extended to support additional sync providers or custom reporting.

## Payload Usage

This script does not use a payload or accept parameters.

**Usage:**

```powershell
./Get-OneDriveSharePointDiskUsage.ps1
```

## Output

The script returns an array of PowerShell objects with the following properties:

- `User` (string): Username associated with the sync root.
- `SizeMB` (float): Total disk space used by the sync root, in megabytes.
- `Type` (string): 'OneDrive' or 'SharePoint'.

Log and error files:

- .\Get-OneDriveSharePointDiskUsage-log.txt
- .\Get-OneDriveSharePointDiskUsage-error.txt
