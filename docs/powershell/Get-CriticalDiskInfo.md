---
id: ps-get-criticaldiskinfo
title: 'Get-CriticalDiskInfo'
title_meta: 'Get-CriticalDiskInfo Command'
keywords: ['disk', 'health', 'monitoring', 'performance']
description: 'Documentation for the Get-CriticalDiskInfo command to gather data pulled from the CrystalDiskInfo application and return it to RMM.'
tags: ['performance', 'report', 'software']
draft: false
unlisted: false
---
## Description
Gathers Data pulled from the Crystal Disk info application and pulls that data into rmm

## Requirements
Powershell V.5

## Usage
1. Downloads Crystal Disk Info
2. Runs the Executable silently
3. Parses the created .txt file
4. Generates objects based on the output
5. Returns the objects


```powershell
$GetDiskInfo = .\Get-CriticalDiskInfo.ps1
```

## Output
Location of output for log, result, and error files.

    .\Get-CriticalDiskInfo-log.txt
    .\Get-CriticalDiskInfo-error.txt

