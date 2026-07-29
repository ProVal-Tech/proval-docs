---
id: 'b08e9cd3-931f-4c70-a084-6193fe3702fb'
slug: /b08e9cd3-931f-4c70-a084-6193fe3702fb
title: 'Get-CrystalDiskInfo'
title_meta: 'Get-CrystalDiskInfo'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring']
description: 'Documentation for the Get-CrystalDiskInfo command to gather data pulled from the CrystalDiskInfo application.'
tags: ['performance', 'report', 'software']
draft: false
unlisted: false
last_update:
  date: 2026-07-29
---

# Description

Gathers data pulled from the CrystalDiskInfo application. It supports custom tool acquisition via URL, local path, or UNC share, with a graceful fallback to the default source if needed.

# Requirements

- Powershell V.5
- Run as Administrator

# Process

1. Checks if the machine is a Virtual Machine (exits if true).
2. Acquires Crystal Disk Info (Uses -Source if provided, otherwise falls back to the default download location).
3. Extracts the tool and generates a custom INI configuration.
4. Runs the Executable silently.
5. Parses the created .txt file.
6. Generates objects based on the output.
7. Returns the objects.

# Payload Usage

Executes the CrystalDiskInfo application and stores the basic information for all disks into a custom object.
```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1
```

Run the CrystalDiskInfo application with a threshold of 50 reallocated sectors.
This way, the tool will only flag the disk as `caution` if the HDD has more than 50 reallocated sectors.
Additionally, store the basic information for all disks in a custom object.
```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -ReallocatedSector 50
```
```powershell
Uses a custom local path for the tool ZIP instead of downloading it.
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source 'C:\FolderLocation\CrystalDiskInfo.zip'
```

```powershell
Uses a custom network (UNC) path for the tool ZIP.
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source '\\fileserver\share\CrystalDiskInfo.zip'
```

```powershell
Downloads the tool from a custom URL. (Falls back to default source if the URL fails).
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -Source 'https://host.example.com/CrystalDiskInfo.zip'
```

# Parameters

| Parameter                | Alias | Required  | Default   | Type      | Description                                                                                                  |
| -------------------------| ----- | --------- | --------- | --------- | -------------------------------------------------------------------------------------------------------------|
| `ReallocatedSector` | `r`   | False |           | int |Set the threshold for the number of reallocated sectors to mark an HDD as `caution` (not applicable to SSDs). |
| `Source` | `src` | False |           | string | Optional location of the CrystalDiskInfo ZIP file. Accepts a local path, a UNC path, or a URL. Falls back to default if omitted or failed. |

## Output

Location of output for log, result, and error files.

```
.\Get-CrystalDiskInfo-log.txt
.\Get-CrystalDiskInfo-error.txt
```

## Changelog

### 2026-07-29

- Added: `-Source` parameter to allow specifying a custom URL, local file path, or UNC share for the CrystalDiskInfo ZIP file.

### 2025-04-10

- Initial version of the document
