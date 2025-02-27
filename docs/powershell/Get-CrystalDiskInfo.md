---
id: 'b08e9cd3-931f-4c70-a084-6193fe3702fb'
title: 'Get-CrystalDiskInfo'
title_meta: 'Get-CrystalDiskInfo'
keywords: ['crystaldiskinfo', 'disk', 'health', 'monitoring']
description: 'Documentation for the Get-CrystalDiskInfo command to gather data pulled from the CrystalDiskInfo application.'
tags: ['performance', 'report', 'software']
draft: false
unlisted: false
---

## Description
Gathers data pulled from the CrystalDiskInfo application.

## Requirements
PowerShell V.5

## Usage
1. Downloads CrystalDiskInfo.
2. Runs the executable silently.
3. Parses the created .txt file.
4. Generates objects based on the output.
5. Returns the objects.

Executes the CrystalDiskInfo application and stores the basic information for all disks into a custom object.
```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1
```

Run the CrystalDiskInfo application with a threshold of 50 reallocated sectors. This way, the tool will only flag the disk as `caution` if the HDD has more than 50 reallocated sectors. Additionally, store the basic information for all disks in a custom object.
```powershell
$GetDiskInfo = .\Get-CrystalDiskInfo.ps1 -ReallocatedSector 50
```

## Parameters
| Parameter                | Alias | Required  | Default   | Type      | Description                                                                                                  |
| -------------------------| ----- | --------- | --------- | --------- | -------------------------------------------------------------------------------------------------------------|
| `ReallocatedSector`      | `r`   | False     |           | int       | Set the threshold for the number of reallocated sectors to mark an HDD as `caution` (not applicable to SSDs). |

## Output
Location of output for log, result, and error files.

```
.\Get-CrystalDiskInfo-log.txt
.\Get-CrystalDiskInfo-error.txt
```



